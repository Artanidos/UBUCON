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
import asyncio
import logic.config
import logic.net as net
import threading
import json

import lib.main_rc
from PyQt5.QtGui import QGuiApplication
from PyQt5.QtQml import QQmlApplicationEngine
from PyQt5.QtCore import QObject, pyqtProperty, pyqtSignal, pyqtSlot


the_loop = asyncio.get_event_loop()

async def main(secr, bridge):
    net.init(secr.id, None)
    #host = "localhost"
    #host = "scuttle.space"
    port = 8008
    #pubID = secr.id
    #pubID = "@skBzPazHliOXCWLwloGvHYki0wPLOUeJpvW10U7MOJ4=.ed25519~Se9GO9kK+Vt8SYsH5APvrXT12jK3WbS5mNH6GliFQ28="
    
    host = "eu-west.ssbpeer.net"
    pubID = "@4TG/WLESyhThgTvmi5W3baX//tbF0HyskFprREqHbyc=.ed25519~rLtaOp1E5eac4kfij9E1avcj8/gk97EgD+RA+8r9HJk="

    try:
        api = await net.connect(host, port, pubID, secr.keypair)
    except Exception as e:
        print("error")
        raise e
    asyncio.ensure_future(api)
    bridge.message("Logged in as: " + secr.id)
    #print("Logged in as:", secr.id)
    #print("Connected to:", host)
    
    start = 1
    async for mstr in net.get_msgs([secr.id, start], 4):
        print(mstr)
        print()


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
        self.x = threading.Thread(target=the_loop.run_forever)
        asyncio.set_event_loop(the_loop)
        asyncio.ensure_future(main(secr, self))
        self.x.start()

    def message(self, text):
        print(text)
        #self._root.message(text)


if __name__ == "__main__":
    fname = os.path.expanduser('~/.ssb/secret')
    # create a new account, if no one will be found on the platform
    if not os.path.exists(fname):
        logic.config.create_new_user_secret(fname)
    secr = logic.config.SSB_SECRET()
    
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
        engine = QQmlApplicationEngine("src/view.qml")
        if not engine.rootObjects():
            sys.exit(-1)
    
    bridge = Bridge()
    engine.rootContext().setContextProperty("bridge", bridge)
    roots = engine.rootObjects()
    bridge.setRoot(roots[0])
    bridge.init()
    sys.exit(app.exec())