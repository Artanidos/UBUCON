#############################################################################
# Copyright (C) 2020 Olaf Japp
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
#############################################################################

import sys
import os

from PyQt5.QtGui import QGuiApplication
from PyQt5.QtQml import QQmlApplicationEngine
from PyQt5.QtCore import QObject, pyqtProperty, pyqtSignal, pyqtSlot


class Bridge(QObject):
    textChanged = pyqtSignal()

    def __init__(self, parent=None):
        QObject.__init__(self, parent)
        self._root = None
        self.x = None

    def setRoot(self, root):
        self._root = root
    
    def init(self):
        self._root.init()
        self._root.message("Init")

    @pyqtSlot()
    def queryServer(self):
        pass

    def message(self, text):
        print(text)
        #self._root.message(text)


if __name__ == "__main__":
    sys_argv = sys.argv
    sys_argv += ['--style', 'material']
    
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine("view.qml")
    if not engine.rootObjects():
        sys.exit(-1)
    
    bridge = Bridge()
    engine.rootContext().setContextProperty("bridge", bridge)
    roots = engine.rootObjects()
    bridge.setRoot(roots[0])
    bridge.init()
    sys.exit(app.exec())