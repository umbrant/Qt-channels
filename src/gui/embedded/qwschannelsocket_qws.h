
/* Modified by andrew */

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

#ifndef QWSCHANNELSSOCKET_QWS_H
#define QWSCHANNELSSOCKET_QWS_H

#include <QtCore/qconfig.h>
#include <QtGui/qwsutils_qws.h>

#include "qchannelsocket_p.h"

#ifndef QT_NO_QWS_MULTIPROCESS

#include <QtCore/qmutex.h>

#ifndef QT_NO_SXEd
#include <QtGui/private/qunixsocketserver_p.h>
#include <QtGui/private/qunixsocket_p.h>
#else
#include <QtNetwork/qtcpsocket.h>
#include <QtNetwork/qtcpserver.h>
#endif

QT_BEGIN_HEADER

QT_BEGIN_NAMESPACE

QT_MODULE(Gui)

class QWSChannelSocket;
class QWSChannelServerSocket;

#if 0
class QChannelServer : public QObject
{
    Q_OBJECT
public:
    QChannelServer(QObject *parent=0);
    QChannelServer(const QString& file, QObject *parent=0);
    ~QChannelServer();

//#ifndef QT_NO_SXE
    virtual QWSChannelSocket *nextPendingConnection();
Q_SIGNALS:
    void newConnection();
protected:
    void incomingConnection(int socketDescriptor);
private:
    QMutex ssmx;
    QList<int> inboundConnections;
//#endif

private:
    //Q_DISABLE_COPY(QWSChannelServerSocket)
    void init(const QString &file);
};
#endif


class QWSChannelSocket : public QChannelSocket
{
    Q_OBJECT
public:
    explicit QWSChannelSocket(QObject *parent=0);
    ~QWSChannelSocket();

    bool connectToLocalFile(const QString &file);

    bool flush();

//#ifndef QT_NO_SXE
    QString errorString();
Q_SIGNALS:
    void connected();
    void disconnected();
    void error(QAbstractSocket::SocketError);
private Q_SLOTS:
    void forwardStateChange(SocketState);
//#endif

private:
    Q_DISABLE_COPY(QWSChannelSocket)
};


class QWSChannelServerSocket : public QObject
{
    Q_OBJECT
public:
    QWSChannelServerSocket(QObject *parent=0);
    QWSChannelServerSocket(const QString& file, QObject *parent=0);
    ~QWSChannelServerSocket();

//#ifndef QT_NO_SXE
    QWSChannelSocket *nextPendingConnection();
    void incomingConnection(int socketDescriptor);
Q_SIGNALS:
    void newConnection();
private:
    QMutex ssmx;
    QList<int> inboundConnections;
//#endif

private:
    Q_DISABLE_COPY(QWSChannelServerSocket)

    void init(const QString &file);
};

QT_END_NAMESPACE

QT_END_HEADER

#endif // QT_NO_QWS_MULTIPROCESS

#endif // QWSCHANNELSSOCKET_QWS_H
