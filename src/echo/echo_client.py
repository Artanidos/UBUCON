import asyncio
import sys

async def tcp_echo_client(message):
    reader, writer = await asyncio.open_connection('127.0.0.1', 3113)

    print(f'Send: {message!r}')
    writer.write(message.encode())

    data = await reader.read(100)
    print(f'Received: {data.decode()!r}')

    print('Close the connection')
    writer.close()


if (len(sys.argv) <2 ):
    print("python3 echo_client.py <message>")
    exit()
asyncio.run(tcp_echo_client(sys.argv[1]))