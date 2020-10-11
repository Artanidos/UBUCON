import asyncio
import os
import sys
import uuid
from tinydb import TinyDB, Query


DEFAULT_PORT = 3113

async def handle_request(reader, writer):
    data = await reader.read(100)
    message = data.decode()
    addr = writer.get_extra_info('peername')

    print(f"Received {message!r} from {addr!r}")
    feeds = db.table('feeds')
    feeds.insert({'message': message})
    
    print(f"Send: {message!r}")
    writer.write(data)
    await writer.drain()

    print("Close the connection")
    writer.close()

async def server(port):
    server = await asyncio.start_server(handle_request, '127.0.0.1', port)
    addr = server.sockets[0].getsockname()
    print(f'Listening on {addr}')

    async with server:
        await server.serve_forever()


if __name__ == "__main__":
    print("UBUCON")
    
    if len(sys.argv) > 1:
        port = int(sys.argv[1])
    else:
        port = DEFAULT_PORT

    db_file_name = os.path.join(os.getcwd(), 'db.json')
    db_exists = os.path.exists(db_file_name)

    # we are opening or creating a local database
    db = TinyDB(db_file_name)

    if not db_exists:
        print("Creating a new acount")
        # if this app opens for the first time, we are going to create an account
        uuid = uuid.uuid5(uuid.NAMESPACE_DNS, 'ubucon.at')
        accounts = db.table('accounts')
        accounts.insert({'uuid': uuid.hex})

    # now we will start a listening process
    asyncio.run(server(port))