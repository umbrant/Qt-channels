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

/******************************
 * HELPER DATA/FUNCTIONS
 *****************************/

// Callback function to handle new connection.
// It assumes that |arg| is the object pointer to which this channel slot
// belongs.
static void on_new_connection(int slot_id, void *arg)
{
    printf("on_new_connection called for %d \n", slot_id);
    assert(arg != 0 && slot_id >= 0); 
    QWSChannelServerSocket *serverSocket = 0;
    serverSocket = reinterpret_cast<QWSChannelServerSocket*> (arg);
    serverSocket->incomingConnection(slot_id);
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
/*
    switch (QUnixSocket::error()) {
    case NoError:
        return QString();
    case InvalidPath:
    case NonexistentPath:
        return QLatin1String("Bad path"); // NO_TR
    default:
        return QLatin1String("Bad socket"); // NO TR
    }
*/
}

// Not implemented
void QWSChannelSocket::forwardStateChange(QChannelSocket::SocketState st  )
{
    cout << "QWSChannelSocket::forwardStateChange(): "
         << "CALLED BUT NOT IMPLEMENTED!" << endl;
/*
    switch ( st )
    {
        case ConnectedState:
            emit connected();
            break;
        case ClosingState:
            break;
        case UnconnectedState:
            emit disconnected();
            break;
        default:
            // nothing
            break;
    }
    if ( QUnixSocket::error() != NoError )
        emit error((QAbstractSocket::SocketError)0);
*/
}

bool QWSChannelSocket::connectToLocalFile(const QString &file)
{
    if (::nbb_connect_service(file.toAscii().data()) < 0) {
        cout << "QWSChannelSocket::connectToLocalFile(): "
             << "Cannot connect to " << file.toAscii().data() << " service!" << endl;
        return false;
    }

    cout << "QWSChannelSocket::connectToLocalFile(): "
         << "Connected to " << file.toAscii().data() << " service!" << endl;

    return true;
}

// Do nothing in our channels implementation
bool QWSChannelSocket::flush()
{
    return true;
}



/***********************************************************************
 *
 * QWSChannelServerSocket
 *
 **********************************************************************/
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

    ::nbb_set_cb_new_connection(service_name, on_new_connection, this);
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
    s->setSocketDescriptor( inboundConnections.takeFirst() );
    return s;
}


QT_END_NAMESPACE

#endif  //QT_NO_QWS_MULTIPROCESS
