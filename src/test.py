import asyncio
import logic.config
import logic.net as net
import threading
import json
import os


the_loop = asyncio.get_event_loop()

async def main(secr):
    net.init(secr.id, None)
    host = "localhost"
    #host = "scuttle.space"
    port = 8008
    pubID = secr.id
    #pubID = "@skBzPazHliOXCWLwloGvHYki0wPLOUeJpvW10U7MOJ4=.ed25519~Se9GO9kK+Vt8SYsH5APvrXT12jK3WbS5mNH6GliFQ28="
    
    try:
        api = await net.connect(host, port, pubID, secr.keypair)
    except Exception as e:
        print("error")
        #raise e
        return
    asyncio.ensure_future(api)
    print("Logged in as:", secr.id)
    print("Connected to:", host)
    
    start = 1
    async for mstr in net.get_msgs([secr.id, start], 4):
        print(mstr)
        print()

print("UBUCON")
fname = os.path.expanduser('~/.ssb/secret')
# create a new account, if no one be found on the platform
if not os.path.exists(fname):
    logic.config.create_new_user_secret(fname)
secr = logic.config.SSB_SECRET()
x = threading.Thread(target=the_loop.run_forever)
asyncio.ensure_future(main(secr))
x.start()
