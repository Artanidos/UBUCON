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

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QSettings>
#include <QQuickStyle>
#include <QStandardPaths>
#include <QIcon>
#include <QList>
#include <QQuickView>
#include <QUuid>
#include "backend.h"
#include "plugin.h"

BackEnd backend;
    
void myMessageOutput(QtMsgType type, const QMessageLogContext &context, const QString &msg)
{
    QByteArray localMsg = msg.toLocal8Bit();
    QString typ = "Undefined";
    const char *file = context.file ? context.file : "undefined";
    const char *function = context.function ? context.function : "undefined";

    switch (type) 
    {
    case QtDebugMsg:
        typ = "Debug";
        break;
    case QtInfoMsg:
        typ = "Info";
        break;
    case QtWarningMsg:
        typ = "Warning";
        break;
    case QtCriticalMsg:
        typ = "Critical";
        break;
    case QtFatalMsg:
        typ = "Fatal";
        break;
    }
    backend.setLastError(typ + ":" + QString(localMsg.constData()) + " (" + file + ":" + QString(context.line) + "," + function + ")");
}

int main(int argc, char *argv[])
{
    QGuiApplication::setApplicationName("UBUCON");
    QGuiApplication::setOrganizationName("CrowdWare");
    QGuiApplication::setApplicationVersion("1.0.0");
    QGuiApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    qInstallMessageHandler(myMessageOutput);
    QGuiApplication app(argc, argv);
    qmlRegisterType<BackEnd>("at.crowdware.backend", 1, 0, "BackEnd");
    qmlRegisterType<Plugin>("at.crowdware.backend", 1, 0, "Plugin");
    QQuickStyle::setStyle("Material");
    QIcon::setThemeName("ubucon");
    
    if (backend.checkPermission())
    {
        backend.loadMenu();
        backend.loadPlugins();
    }

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("backend", &backend);
    engine.load(QUrl("qrc:/ubucon.qml"));
    if (engine.rootObjects().isEmpty())
        return -1;
    return app.exec();
}
