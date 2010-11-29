/****************************************************************************
**
** Copyright (C) 2010 Nokia Corporation and/or its subsidiary(-ies).
** All rights reserved.
** Contact: Nokia Corporation (qt-info@nokia.com)
**
** This file is part of the QtGui module of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:LGPL$
** Commercial Usage
** Licensees holding valid Qt Commercial licenses may use this file in
** accordance with the Qt Commercial License Agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and Nokia.
**
** GNU Lesser General Public License Usage
** Alternatively, this file may be used under the terms of the GNU Lesser
** General Public License version 2.1 as published by the Free Software
** Foundation and appearing in the file LICENSE.LGPL included in the
** packaging of this file.  Please review the following information to
** ensure the GNU Lesser General Public License version 2.1 requirements
** will be met: http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html.
**
** In addition, as a special exception, Nokia gives you certain additional
** rights.  These rights are described in the Nokia Qt LGPL Exception
** version 1.1, included in the file LGPL_EXCEPTION.txt in this package.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 3.0 as published by the Free Software
** Foundation and appearing in the file LICENSE.GPL included in the
** packaging of this file.  Please review the following information to
** ensure the GNU General Public License version 3.0 requirements will be
** met: http://www.gnu.org/copyleft/gpl.html.
**
** If you have questions regarding the use of this file, please contact
** Nokia at qt-info@nokia.com.
** $QT_END_LICENSE$
**
****************************************************************************/

#include "qplatformdefs.h"
#include "qwschannelsocket_qws.h"

// Include the .c file for now.
// TODO: Integrate NBB into Qt
#include "nbb.h"
//#include "nbb.c"

#ifndef QT_NO_QWS_MULTIPROCESS

#include <fcntl.h>
#include <netdb.h>
#include <errno.h>
#include <stdio.h>
#include <sys/file.h>
#include <sys/time.h>
#include <sys/un.h>
#include <assert.h>
#include <stdlib.h>

#include <iostream>

using namespace std;

#ifdef __MIPSEL__
# ifndef SOCK_DGRAM
#  define SOCK_DGRAM 1
# endif
# ifndef SOCK_STREAM
#  define SOCK_STREAM 2
# endif
#endif

#if defined(Q_OS_SOLARIS) || defined (QT_LINUXBASE)
// uff-da apparently Solaris doesn't have the SUN_LEN macro, here is
// an implementation of it...
#  ifndef SUN_LEN
#    define SUN_LEN(su) \
            sizeof(*(su)) - sizeof((su)->sun_path) + strlen((su)->sun_path)
#  endif

// nor the POSIX names of UNIX domain sockets *sigh*
#  ifndef AF_LOCAL
#    define AF_LOCAL        AF_UNIX
#  endif
#  ifndef PF_LOCAL
#    define PF_LOCAL        PF_UNIX
#  endif
#endif // Q_OS_SOLARIS || QT_LINUXBASE

QT_BEGIN_NAMESPACE

/******************************************
  HELPER FUNCTION/DATA FOR QWSChannelSocket
 *******************************************/

// Global socket mappings from slot ID to sockets and flags
meta_client_socket_t g_clientSocketMap[SERVICE_MAX_CHANNELS];
meta_server_socket_t g_serverSocketMap[SERVICE_MAX_CHANNELS];



// Called in the event loop to clear out new data
static void client_on_new_available_data(int slot_id) {
    g_clientSocketMap[slot_id].has_data = true;
}

void client_handle_new_available_data(int slot_id)
{
    QWSChannelSocket *socket = g_clientSocketMap[slot_id].csocket;
    g_clientSocketMap[slot_id].has_data = false;
    assert(socket != 0);
    socket->emitReadyRead();
}

/***********************************************************************
 *
 * QWSChannelSocket
 *
 **********************************************************************/
QWSChannelSocket::QWSChannelSocket(QObject *parent)
    : QChannelSocket(parent)
{
    // XXX: Not sure if we should comment this out!
//    QObject::connect( this, SIGNAL(stateChanged(SocketState)),
//            this, SLOT(forwardStateChange(SocketState)));
}

QWSChannelSocket::~QWSChannelSocket()
{
}

// Not implemented
QString QWSChannelSocket::errorString()
{
    cout << "QWSChannelSocket::errorString(): "
         << "CALLED BUT NOT IMPLEMENTED!" << endl;    
    return QString();
}

// Not implemented
void QWSChannelSocket::forwardStateChange(QChannelSocket::SocketState st  )
{
    cout << "QWSChannelSocket::forwardStateChange(): "
         << "CALLED BUT NOT IMPLEMENTED!" << endl;
}

bool QWSChannelSocket::connectToLocalFile(const QString &file)
{
    const char *client_name = this->getSocketName();
    QByteArray file_name = file.toAscii();
    const char *service_name = file_name.data();

    int slot = ::nbb_connect_service(client_name, service_name);
    if(slot < 0) {
        cout << "QWSChannelSocket::connectToLocalFile(): "
             << "Cannot connect to " << service_name << " service!" << endl;
        return false;
    }


    cout << "QWSChannelSocket::connectToLocalFile(): "
         << "Connected to " << service_name << " service on slot " << slot << endl;

    this->setSocketDescriptor(slot);

    // Set ownership to this client socket
    nbb_set_owner(slot, client_name);

    // Register for new incoming data event from nbb
    nbb_set_cb_new_data(client_name, client_on_new_available_data);

    return true;
}

// Do nothing in our channels implementation
bool QWSChannelSocket::flush()
{
    return true;
}

// Override QChannelSocket
// This is needed to move the signal handler stuff into this file.
// This move is necessary because in connectToLocalFile(), we need
// to connect_service() before setting the callback.
bool QWSChannelSocket::setSocketDescriptor(int socketDescriptor, QAbstractSocket::SocketState socketState, QAbstractSocket::OpenMode openMode)
{
    assert(socketDescriptor >= 0);
    const char *socketName = this->getSocketName();

    printf("%s: old: %d new: %d \n", socketName, this->socketDescriptor(), socketDescriptor);

    QChannelSocket::setSocketDescriptor(socketDescriptor, socketState, openMode);

    // Keep mapping from slot ID to client socket so that inside the callback
    // function (which has slot ID as argument), we can identify the client
    // socket object.
    meta_client_socket_t s;
    s.csocket = this;
    s.has_data = false;
    g_clientSocketMap[socketDescriptor] = s;

    // (Possible change ownership from service to this client socket)
    nbb_set_owner(socketDescriptor, socketName);

    // Register for new incoming data from nbb
    nbb_set_cb_new_data(socketName, client_on_new_available_data);

    return true;
}


/***********************************************************************
 *
 * QWSChannelServerSocket
 *
 **********************************************************************/

/***************************************************
 * HELPER DATA/FUNCTIONS FOR QWSChannelServerSocket
 ***************************************************/

// Callback function to handle new connection.
// It assumes that |arg| is the object pointer to which this channel slot
// belongs.
static void server_on_new_connection(int slot_id, void *arg) {
    g_serverSocketMap[slot_id].ssocket = 
                reinterpret_cast<QWSChannelServerSocket*>(arg);
    g_serverSocketMap[slot_id].has_new_connection = true;
}

void server_handle_new_connection(int slot_id)
{
    assert(slot_id >= 0); 
    QWSChannelServerSocket *serverSocket = g_serverSocketMap[slot_id].ssocket;
    g_serverSocketMap[slot_id].has_new_connection = false;
    serverSocket->incomingConnection(slot_id);
}


QWSChannelServerSocket::QWSChannelServerSocket(const QString& file, QObject *parent)

#ifndef QT_NO_SXE
    : QUnixSocketServer(parent)
#else
    : QObject(parent)
#endif
{
    init(file);
}

void QWSChannelServerSocket::init(const QString &file)
{
    // Use the file as the service name
    char *service_name = file.toAscii().data();

    // TODO this is a hardcoded 5 constant. If we need more clients per
    // server, increase this number
    if (::nbb_init_service(5, service_name)) {
        cout << "QWSChannelServerSocket::init(): Failed to init service!"
             << endl;
        exit(-1);
    }

    ::nbb_set_cb_new_connection(service_name, server_on_new_connection, this);
    //::nbb_set_cb_new_data(service_name, server_on_new_data);

    cout << "QWSChannelServerSocket::init(): Successfully init-ed "
         << service_name << endl;
}

QWSChannelServerSocket::~QWSChannelServerSocket()
{
}


// In our channels, socket descriptor is equivalent to slot ID
void QWSChannelServerSocket::incomingConnection(int socketDescriptor)
{
    inboundConnections.append( socketDescriptor );
    emit newConnection();
}

QWSChannelSocket *QWSChannelServerSocket::nextPendingConnection()
{
    QMutexLocker locker( &ssmx );
    if ( inboundConnections.count() == 0 )
        return 0;
    QWSChannelSocket *s = new QWSChannelSocket();
    printf("** nextPendingConnection()\n");
    s->setSocketDescriptor( inboundConnections.takeFirst() );
    return s;
}


QT_END_NAMESPACE

#endif  //QT_NO_QWS_MULTIPROCESS
