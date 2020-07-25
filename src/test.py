import asyncio
import logic.config
import logic.net as net
import threading
import json

the_loop = asyncio.get_event_loop()

async def main(secr):
    net.init(secr.id, None)
    host = "localhost"
    port = 8008
    pubID = secr.id
    
    try:
        api = await net.connect(host, port, pubID, secr.keypair)
    except Exception as e:
        print("error")
        raise e
    asyncio.ensure_future(api)
    
    start = 1
    async for mstr in net.get_msgs([secr.id, start], 4):
        print(mstr)
        print()

secr = logic.config.SSB_SECRET()
x = threading.Thread(target=the_loop.run_forever)
asyncio.ensure_future(main(secr))
x.start()






