import socket,sys
from _thread import *

class Server():
	def __init__(self):
		super(Server, self).__init__()
		self.host = "127.0.0.1"
		self.port = 3113
		self.users = list()
		self.server()
		print(self.users)

	def clients_thread(self,c):
		c.send(f"Welcome to server ###USERNAME###".encode())
		self.users.append(c)
		print(self.users)
		while True:
			resp = c.recv(2048)
			if not resp:
				break
			sys.stdout.write(f"{resp.decode('utf-8')}")
			sys.stdout.flush()
			# The error is Here
			self.s.sendall(resp)
			
			
		c.close()


	def server(self):

		self.s = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
		try:
			self.s.bind((self.host,self.port))
			self.s.listen()
			print("Server Listening...")
			while True:
				c,addr = self.s.accept()
				start_new_thread(self.clients_thread,(c,))
			s.close()
		except Exception as e:
			self.s.close()
			raise e



if __name__ == "__main__":
	try:
		server = Server()
	except Exception as e:
		raise e