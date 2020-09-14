import sys
import os
import lib.main_rc
from PyQt5.QtGui import QGuiApplication
from PyQt5.QtQml import QQmlApplicationEngine
from PyQt5.QtCore import QUrl, qInstallMessageHandler, qDebug, QtInfoMsg, QtWarningMsg, QtCriticalMsg, QtFatalMsg

root = None
def qt_message_handler(mode, context, message):
    if mode == QtInfoMsg:
        mode = 'INFO'
    elif mode == QtWarningMsg:
        mode = 'WARNING'
    elif mode == QtCriticalMsg:
        mode = 'CRITICAL'
    elif mode == QtFatalMsg:
        mode = 'FATAL'
    else:
        mode = 'DEBUG'

    root.errorMessage(mode + ": " + message)
    #print('qt_message_handler: line: %d, func: %s(), file: %s' % (
    #      context.line, context.function, context.file))
    #print('  %s: %s\n' % (mode, message))

if __name__ == "__main__":
    qInstallMessageHandler(qt_message_handler)

    sys_argv = sys.argv
    sys_argv += ['--style', 'material']
    app = QGuiApplication(sys.argv)
    
    engine = QQmlApplicationEngine()
    engine.addImportPath( "qrc:/ui" )
    engine.load(QUrl("qrc:/view.qml"))

    roots = engine.rootObjects()
    root = roots[0]
    #qDebug('something informative')
    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec())

