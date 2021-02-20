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

#include "backend.h"
#include <QGuiApplication>
#include <QDateTime>
#include <QFile>
#include <QCryptographicHash>
#include <QStandardPaths>
#include <QDataStream>
#include <QBuffer>
#include <QNetworkAccessManager>
#include <QNetworkRequest>
#include <QUuid>
#include <QJsonObject>
#include <QJsonDocument>
#include <QJsonParseError>
#include <QJsonDocument>
#include <QMap>
#include <QJsonArray>
#include <QDir>
#include <QQmlComponent>
#include <QQmlEngine>
#include "plugin.h"


BackEnd::BackEnd(QObject *parent) :
    QObject(parent)
{   
    m_lastError = "";
    m_message = "Willkommen, berühre bitte das Symbol um weiter zu machen.";
}

MenuModel *BackEnd::getMenuModel()
{
    return &m_menuModel;
}

bool BackEnd::getWritepermission()
{
    return m_writepermission;
}

bool BackEnd::checkPermission()
{
    m_writepermission = false;
    QString msg_text = "Willkommen, bitte öffne die Systemeinstellungen und schalte der Speicherzugriff für UBUCON frei.<br><br>Du findest diese Einstellungen unter: Einstellungen -> Apps -> Apps -> UBUCON -> Berechtigungen -> Speicher";
            
    QString path = QStandardPaths::writableLocation(QStandardPaths::GenericDataLocation) + "/crowdware/ubucon/plugins";
    QDir dir(path);
    if (!dir.exists())
    {
        if (!dir.mkpath(path))
        {
            m_message = msg_text;
            return false;
        }
    }
    path.append("/test.txt");
    QFile file(path);
    if(file.open(QIODevice::WriteOnly))
    {
        file.close();
        file.remove();
        m_writepermission = true;
        return true;
    }
    else
    {   
        m_message = msg_text;
        return false;
    }
}

QString BackEnd::getVersion()
{
    return QGuiApplication::applicationVersion();
}

QString BackEnd::getMessage()
{
    return m_message;
}

QString BackEnd::lastError()
{
    return m_lastError;
} 

void BackEnd::setLastError(const QString &lastError)
{
    if (m_lastError.length() < 200)
    {
        m_lastError += lastError + "\n";
        emit lastErrorChanged();
    }
}

void BackEnd::loadMenu()
{
    m_menuModel.append(new Menu("Home", "qrc:/Home.qml"));
}

void BackEnd::loadPlugins()
{
    QString path = QStandardPaths::writableLocation(QStandardPaths::GenericDataLocation) + "/crowdware";
    QDir dir(path + "/ubucon/plugins");
    dir.setFilter(QDir::Dirs | QDir::NoDotAndDotDot);
    if (dir.exists())
    {
        QFileInfoList list = dir.entryInfoList();
        for (int i = 0; i < list.size(); ++i) 
        {
            QFileInfo fileInfo = list.at(i);
            QQmlEngine engine;
            QQmlComponent component(&engine);
            QString fileName = path + "/ubucon/plugins/" + fileInfo.fileName() + "/plugin.qml";
            QFile file(fileName);
            if (file.exists())
            {
                component.loadUrl(QUrl::fromLocalFile(fileName));
                QObject *obj = component.create();
                Plugin *plugin = qobject_cast<Plugin *>(obj);
                m_menuModel.append(new Menu(plugin->title(), plugin->source()));
            }
        }
    }
}

int BackEnd::saveChain()
{
    QString path = QStandardPaths::writableLocation(QStandardPaths::GenericDataLocation) + "/crowdware";
    QDir dir(path);
    if (!dir.exists())
        dir.mkpath(path);

    path.append("/ubucon.db");
    QFile file(path);
    if(!file.open(QIODevice::WriteOnly))
    {
        if (file.error() != QFile::NoError) 
        {
            setLastError(file.errorString() + ":" + path);
            return FILE_COULD_NOT_OPEN;
        }
    }
    QDataStream out(&file);
    out << (quint16)0x3113; // magic number
    out << (quint16)100;    // version
    out << m_uuid;
    
    file.close();
    return CHAIN_SAVED;
}

int BackEnd::loadChain()
{
    quint16 magic;
    quint16 version;
    int count;

    QString path = QStandardPaths::writableLocation(QStandardPaths::GenericDataLocation) + "/crowdware";
    QFile file(path.append("/ubucon.db"));
    if(!file.exists())
    {
        // create a new account on the first time 
        m_uuid = QUuid::createUuid().toByteArray().toBase64();
        saveChain();
    }
    if(!file.open(QIODevice::ReadOnly))
    {
        if (file.error() != QFile::NoError) 
        {
            setLastError(file.errorString());
            return FILE_COULD_NOT_OPEN;
        }
    }
    QDataStream in(&file);
    in >> magic;
    if (magic != 0x3113)
    {
        file.close();
        return BAD_FILE_FORMAT;
    }
    // check the version
    in >> version;
    if (version < 100)
    {
        file.close();
        return UNSUPPORTED_VERSION;
    }
    in >> m_uuid;
    m_message = "Willkommen zurück";
    emit messageChanged();
    file.close();
    return CHAIN_LOADED;
}
