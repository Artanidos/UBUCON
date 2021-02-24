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


#define BAD_FILE_FORMAT -1
#define UNSUPPORTED_VERSION -2
#define FILE_COULD_NOT_OPEN -3
#define CRYPTO_ERROR -4
#define CHAIN_NOT_LOADED_BEFORE_SAVE -5
#define FILE_NOT_EXISTS -6
#define CHAIN_LOADED 0
#define CHAIN_SAVED 0


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

    Q_INVOKABLE QString CreateUuid();
    Q_INVOKABLE QString GetPluginDir();

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
    int loadChain();
    int saveChain();

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
    QString m_uuid;
    QString m_pluginDir;
};
#endif // BACKEND_H