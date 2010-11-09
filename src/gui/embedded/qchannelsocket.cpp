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

#include "qchannelsocket_p.h"

// #define QUNIXSOCKET_DEBUG 1

/*
#include <QtCore/qsocketnotifier.h>
#include <QtCore/qqueue.h>
#include <QtCore/qdatetime.h>
#include "private/qcore_unix_p.h" // overrides QT_OPEN

#ifdef QUNIXSOCKET_DEBUG
#include <QtCore/qdebug.h>
#endif

extern "C" {
#include <unistd.h>
#include <string.h>
#include <errno.h>
#include <sys/socket.h>
#include <sys/un.h>
};
*/


QT_BEGIN_NAMESPACE

/*!
  Construct a QChannelSocket instance, with \a parent.

  The read buffer is initially set to 1024 bytes, and the rights buffer to 0
  entries.

  \sa QChannelSocket::readBufferSize() QChannelSocket::rightsBufferSize()
  */
QChannelSocket::QChannelSocket(QObject * parent)
: QIODevice(parent)/*, d(new QChannelSocketPrivate(this))*/
{
    // TODO
}

/*!
  Destroys the QChannelSocket instance.  Any unsent data is discarded.
  */
QChannelSocket::~QChannelSocket()
{
    // TODO
}

/*!
  Returns the number of bytes available for immediate retrieval through a call
  to \l QChannelSocket::read().
  */
qint64 QChannelSocket::bytesAvailable() const
{
    return 0;
}

/*!
  Returns the number of enqueued bytes still to be written to the socket.
  */
qint64 QChannelSocket::bytesToWrite() const
{
    return 0;
}

/*! \internal */
qint64 QChannelSocket::readData(char * data, qint64 maxSize)
{
	return 0;
}

/*! \internal */
qint64 QChannelSocket::writeData(const char * data, qint64 maxSize)
{
	return 0;
}

QT_END_NAMESPACE
