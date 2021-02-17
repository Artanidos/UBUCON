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
    m_message = "Welcome, wait a few seconds to load the database";
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
    QString msg_text = "Welcome, please set the permission to write to external storage in the settings of your mobile phone and restart the app.<br><br>You will find it under: Settings -> Apps -> Apps -> UBUCON -> Permission -> Memory";
            
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
    //m_menuModel.append(new Menu("Mates", "qrc:/gui/Friends.qml"));
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

void BackEnd::HttpGet(QString url)
{
    QNetworkRequest request;
    request.setUrl(QUrl(url));
    request.setRawHeader("User-Agent", "Shift 1.0");
    request.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");
    QNetworkAccessManager* networkManager = new QNetworkAccessManager(this);
    QObject::connect(networkManager, SIGNAL(finished(QNetworkReply*)), this, SLOT(onGetReply(QNetworkReply*)));
    networkManager->get(request);
}

void BackEnd::onGetReply(QNetworkReply* reply)
{
    if(reply->error() == QNetworkReply::NoError)
    {
    	int httpstatuscode = reply->attribute(QNetworkRequest::HttpStatusCodeAttribute).toUInt();
    	switch(httpstatuscode)
    	{
    		case 200:
    		    if (reply->isReadable()) 
    		    {
                    m_result = reply->readAll().data();
                    emit resultChanged();
    		    }
                else
                {
                    setLastError("Reply not readable");
                }
    		    break;
    		default:
                m_result = "Response error from webserver: " + QString::number(httpstatuscode);
                emit resultChanged();
                break;
    	}
    }
    else
    {
        m_result = "Reply error from webserver: " + QString::number(reply->error());
        emit resultChanged();
    }
     
    reply->deleteLater();
}

QString BackEnd::getResult()
{
    return m_result;
}