import logging
import asyncio
import os
import time
import operator
import pickledb 

from itertools import takewhile
from collections import OrderedDict
from kademlia.network import Server
from kademlia.storage import IStorage


class TinyStorage(IStorage):
    def __init__(self, ttl=604800):
        """
        By default, max age is a week.
        """
        self.data = OrderedDict()
        self.ttl = ttl
        self.db = pickledb.load('example.db', False) 

    def __setitem__(self, key, value):
        if key in self.data:
            del self.data[key]
        self.data[key] = (time.monotonic(), value)
        self.cull()
        self.db.set(key, value) 

    def cull(self):
        for _, _ in self.iter_older_than(self.ttl):
            self.data.popitem(last=False)

    def get(self, key, default=None):
        #self.cull()
        #if key in self.data:
        #    return self[key]
        #return default

        return db.search(Query()[str(key)] == 'value')

    def __getitem__(self, key):
        self.cull()
        return self.data[key][1]

    def __repr__(self):
        self.cull()
        return repr(self.data)

    def iter_older_than(self, seconds_old):
        min_birthday = time.monotonic() - seconds_old
        zipped = self._triple_iter()
        matches = takewhile(lambda r: min_birthday >= r[1], zipped)
        return list(map(operator.itemgetter(0, 2), matches))

    def _triple_iter(self):
        ikeys = self.data.keys()
        ibirthday = map(operator.itemgetter(0), self.data.values())
        ivalues = map(operator.itemgetter(1), self.data.values())
        return zip(ikeys, ibirthday, ivalues)

    def __iter__(self):
        self.cull()
        ikeys = self.data.keys()
        ivalues = map(operator.itemgetter(1), self.data.values())
        return zip(ikeys, ivalues)

handler = logging.StreamHandler()
formatter = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s')
handler.setFormatter(formatter)
log = logging.getLogger('kademlia')
log.addHandler(handler)
log.setLevel(logging.DEBUG)


loop = asyncio.get_event_loop()
loop.set_debug(True)

server = Server(storage=TinyStorage())
loop.run_until_complete(server.listen(3113))

try:
    loop.run_forever()
except KeyboardInterrupt:
    pass
finally:
    server.stop()
    loop.close()