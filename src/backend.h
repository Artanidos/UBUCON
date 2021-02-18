/****************************************************************************
# Copyright (C) 2021 CrowdWare
#
# This file is part of UBUCON.
#
#  UBUCON is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 3 of the License, or
#  (at your option) any later version.
#
#  UBUCON is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with UBUCON.  If not, see <http://www.gnu.org/licenses/>.
#
****************************************************************************/

#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>
#include <QString>
#include <QSettings>
#include <QDate>
#include <qqml.h>
#include <QNetworkReply>
#include <QAbstractListModel>
#include <QColor>
#include "menumodel.h" 


class BackEnd : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString lastError READ lastError WRITE setLastError NOTIFY lastErrorChanged)
    Q_PROPERTY(MenuModel *menuModel READ getMenuModel CONSTANT)
    Q_PROPERTY(QString version READ getVersion CONSTANT)
    Q_PROPERTY(QString message READ getMessage CONSTANT)
    Q_PROPERTY(bool writepermission READ getWritepermission CONSTANT)
    
public:
    explicit BackEnd(QObject *parent = nullptr);

    QString lastError();
    void setLastError(const QString &lastError);
    QString getVersion();
    QString getMessage();
    bool getWritepermission();
    bool checkPermission();
    void loadMenu();
    void loadPlugins();
    void loadMessage();
    MenuModel *getMenuModel();

signals:
    void lastErrorChanged();
    void messageChanged();

private:
    QString m_lastError;
    MenuModel m_menuModel;
    QString m_check;
    int m_mates;
    bool m_writepermission;
    QString m_message;
};
#endif // BACKEND_H