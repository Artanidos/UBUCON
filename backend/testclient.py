import socket
from _thread import *
import sys

class Client():
	def __init__(self):
		super(Client,self).__init__()
		self.host = "127.0.0.1"
		self.port = 3113
		self.un = input("Username : ")
		self.client()
	def client(self):
		with socket.socket(socket.AF_INET,socket.SOCK_STREAM) as s:
			s.connect((self.host,self.port))
			print(s.recv(2048).decode("utf8").replace("###USERNAME###",self.un))
			start_new_thread(self.receiving,(s,))
			while True:
				msg = input(f"\n{self.un} > ")
				s.sendall(f"{self.un}: {msg}".encode())
			s.sendall(f"{self.un} disconnected from server")
			s.close()
	def receiving(self,s):
		while True:
			data = s.recv(2048).decode("utf8")
			if data:
				print(data)
			else:
				break

if __name__ == "__main__":
	client = Client()