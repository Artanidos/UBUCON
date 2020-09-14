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

import lib.main_rc
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

    def message(self, text):
        print(text)


if __name__ == "__main__":
    fname = os.path.expanduser('~/.ssb/secret')
    
    sys_argv = sys.argv
    sys_argv += ['--style', 'material']
    
    app = QGuiApplication(sys.argv)
    view =  "/storage/emulated/0/view.qml"
    if os.path.exists(view):
        # we are trying to load the view dynamically from the root of the storage
        engine = QQmlApplicationEngine(view)
        if not engine.rootObjects():
            sys.exit(-1)
    else:
        # if the attempt to load the local file fails, we load the fallback
        engine = QQmlApplicationEngine("view.qml")
        if not engine.rootObjects():
            sys.exit(-1)
    
    bridge = Bridge()
    engine.rootContext().setContextProperty("bridge", bridge)
    roots = engine.rootObjects()
    bridge.setRoot(roots[0])
    sys.exit(app.exec())