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
#include "qwssocket_qws.h"

// Include the .c file for now.
// TODO: Integrate NBB into Qt
#include "nbb.h"
#include "nbb.c"

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

// Assume there is only one server socket, we keep track of it to be notified
// of new incoming connection.
static QWSChannelServerSocket *g_serverSocket = 0;
static void on_new_connection(int slot_id)
{
    assert(g_serverSocket != 0);
    g_serverSocket->incomingConnection(slot_id);
}


/***********************************************************************
 *
 * QWSChannelSocket
 *
 **********************************************************************/
QWSChannelSocket::QWSChannelSocket(QObject *parent)
    : QChannelSocket(parent)
{
#ifndef QT_NO_SXE
    QObject::connect( this, SIGNAL(stateChanged(SocketState)),
            this, SLOT(forwardStateChange(SocketState)));
#endif
}

QWSChannelSocket::~QWSChannelSocket()
{
}

#ifndef QT_NO_SXE
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
void QWSChannelSocket::forwardStateChange(QUnixSocket::SocketState st  )
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
#endif

bool QWSChannelSocket::connectToLocalFile(const QString &file)
{
    if (connect_service(GUI) < 0) {
        cout << "QWSChannelSocket::connectToLocalFile(): "
             << "Cannot connect to " << GUI << " service!" << endl;
        return false;
    }

    cout << "QWSChannelSocket::connectToLocalFile(): "
         << "Connected to " << GUI << " service!" << endl;

    return true;
/*
#ifndef QT_NO_SXE
    bool result = QUnixSocket::connect( file.toLocal8Bit() );
    if ( !result )
    {
        perror( "QWSChannelSocketAuth::connectToLocalFile could not connect:" );
        emit error(QAbstractSocket::ConnectionRefusedError);
        return false;
    }
    return true;
#else
    // create socket
    int s = ::socket(PF_LOCAL, SOCK_STREAM, 0);

    // connect to socket
    struct sockaddr_un a;
    memset(&a, 0, sizeof(a));
    a.sun_family = PF_LOCAL;
    strncpy(a.sun_path, file.toLocal8Bit().constData(), sizeof(a.sun_path) - 1);
    int r = ::connect(s, (struct sockaddr*)&a, SUN_LEN(&a));
    if (r == 0) {
        setSocketDescriptor(s);
    } else {
        perror("QWSChannelSocket::connectToLocalFile could not connect:");
        ::close(s);
        emit error(ConnectionRefusedError);
        return false;
    }
#endif
*/
    return true;
}


/***********************************************************************
 *
 * QWSChannelServerSocket
 *
 **********************************************************************/
QWSChannelServerSocket::QWSChannelServerSocket(const QString& file, QObject *parent)
/*
#ifndef QT_NO_SXE
    : QUnixSocketServer(parent)
#else
    : QTcpServer(parent)
#endif
*/
{
    init(file);
}

void QWSChannelServerSocket::init(const QString &file)
{
    assert(g_serverSocket == 0);
    g_serverSocket = this;

    if (init_service(SERVICE_MAX_CHANNELS, GUI)) {
        cout << "QWSChannelServerSocket::init(): Failed to init service!"
             << endl;
        exit(-1);
    }

/*
#ifndef QT_NO_SXE
    QByteArray fn = file.toLocal8Bit();
    bool result = QUnixSocketServer::listen( fn );
    if ( !result )
    {
        QUnixSocketServer::ServerError err = serverError();
        switch ( err )
        {
            case InvalidPath:
                qWarning("QWSChannelServerSocket:: invalid path %s", qPrintable(file));
                break;
            case ResourceError:
            case BindError:
            case ListenError:
                qWarning("QWSChannelServerSocket:: could not listen on path %s", qPrintable(file));
                break;
            default:
                break;
        }
    }
#else
    int backlog = 16; //#####

// create socket
    int s = ::socket(PF_LOCAL, SOCK_STREAM, 0);
    if (s == -1) {
        perror("QWSChannelServerSocket::init");
        qWarning("QWSChannelServerSocket: unable to create socket.");
        return;
    }

    QByteArray fn = file.toLocal8Bit();
    unlink(fn.constData()); // doesn't have to succeed

    // bind socket
    struct sockaddr_un a;
    memset(&a, 0, sizeof(a));
    a.sun_family = PF_LOCAL;
    strncpy(a.sun_path, fn.constData(), sizeof(a.sun_path) - 1);
    int r = ::bind(s, (struct sockaddr*)&a, SUN_LEN(&a));
    if (r < 0) {
        perror("QWSChannelServerSocket::init");
        qWarning("QWSChannelServerSocket: could not bind to file %s", fn.constData());
        ::close(s);
        return;
    }

    if (chmod(fn.constData(), 0600) < 0) {
        perror("QWSChannelServerSocket::init");
        qWarning("Could not set permissions of %s", fn.constData());
        ::close(s);
        return;
    }

    // listen
    if (::listen(s, backlog) == 0) {
        if (!setSocketDescriptor(s))
            qWarning( "QWSChannelServerSocket could not set descriptor %d : %s", s, errorString().toLatin1().constData());
    } else {
        perror("QWSChannelServerSocket::init");
        qWarning("QWSChannelServerSocket: could not listen to file %s", fn.constData());
        ::close(s);
    }
#endif
*/
}

QWSChannelServerSocket::~QWSChannelServerSocket()
{
}

#ifndef QT_NO_SXE

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

#endif // QT_NO_SXE

QT_END_NAMESPACE

#endif  //QT_NO_QWS_MULTIPROCESS
