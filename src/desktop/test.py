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
import threading
import json

from PyQt5.QtGui import QGuiApplication
from PyQt5.QtQml import QQmlApplicationEngine
from PyQt5.QtCore import QObject, pyqtProperty, pyqtSignal, pyqtSlot

sys.path.append("..")
import common.logic.config as config
import common.logic.net as net

the_loop = asyncio.get_event_loop()

async def main(secr):
    net.init(secr.id, None)
    #host = "localhost"
    host = "scuttle.space"
    port = 8008
    #pubID = secr.id
    pubID = "@skBzPazHliOXCWLwloGvHYki0wPLOUeJpvW10U7MOJ4=.ed25519~Se9GO9kK+Vt8SYsH5APvrXT12jK3WbS5mNH6GliFQ28="
    
    #host = "eu-west.ssbpeer.net"
    #pubID = "@4TG/WLESyhThgTvmi5W3baX//tbF0HyskFprREqHbyc=.ed25519~rLtaOp1E5eac4kfij9E1avcj8/gk97EgD+RA+8r9HJk="

    try:
        api = await net.connect(host, port, pubID, secr.keypair)
    except Exception as e:
        print("error")
        raise e
    asyncio.ensure_future(api)
    print("connected")
    start = 1
    async for mstr in net.get_msgs([secr.id, start], 4):
        print(mstr)
        print()

if __name__ == "__main__":
    fname = os.path.expanduser('~/.ssb/secret')
    # create a new account, if no one will be found on the platform
    if not os.path.exists(fname):
        lconfig.create_new_user_secret(fname)
    secr = config.SSB_SECRET()
    x = threading.Thread(target=the_loop.run_forever)
    asyncio.set_event_loop(the_loop)
    asyncio.ensure_future(main(secr))
    x.start()