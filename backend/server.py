import socket
import sqlite3
import pathlib
import string
import random
import uuid
import glob
import datetime

class Server():
	def __init__(self):
		
		super(Server, self).__init__()
		self.name = ""
		# Run & Check if functions return any errors if true the program raise an error , if not it checks the other one until done
		cderesp = self.cde()
		if cderesp["status"] == "ok":

			cdtresp = self.cdt()
			
			if cdtresp["status"] == "ok":
				cduresp = self.cdu(ID=str(uuid.uuid4()),USERNAME="root",DATE=str(datetime.datetime.now().strftime("%c")),ISBLOCKED=False)
				if cduresp["status"] == "ok":
					pass
				else:
					raise cduresp["err"]
			else:
				raise cdtresp["err"]

		else:
			self.name = "".join(random.choice(string.ascii_letters+string.digits) for i in range(16))
			
			cdbresp = self.cdb(self.name+".db")
			if cdbresp["status"] == "ok":

					cdtresp = self.cdt()
				
					if cdtresp["status"] == "ok":
						cduresp = self.cdu(ID=str(uuid.uuid4()),USERNAME="root",DATE=str(datetime.datetime.now().strftime("%c")),ISBLOCKED=False)
						if cduresp["status"] == "ok":
							pass
						else:
							raise cduresp["err"]
					else:
						raise cdtresp["err"]
			else:
				raise cdbresp["err"]


	# Checking if a database already exists
	def cde(self):
		globresp = glob.glob("*.db")
		if not globresp:
			return {"status":"bad"}
		else:
			self.name = globresp[0]
			return {"status":"ok"}

	# Creating a Database
	def cdb(self,name):
		try:
			if not name.endswith(".db"):
				self.name = name+".db"
			else:
				self.name = name

			with open(name,'w') as d:
				d.write("")
			
			return {"status":"ok"}
		except Exception as e:
			return {"status":"bad","err":e}

	# Creating DB Table
	def cdt(self):
		try:
			conn = sqlite3.connect(self.name)
			print(self.name+" Connection established")
			conn.execute("CREATE TABLE USERS(ID TEXT NOT NULL,USERNAME TEXT NOT NULL, DATE TEXT NOT NULL ,ISBLOCKED INT NOT NULL);")
			conn.close()
			return {"status":"ok"}
		except Exception as e:
			
			return {"status":"bad","err":e}
	# Add Users
	def cdu(self,ID : str,USERNAME : str,DATE : str,ISBLOCKED:bool):
		# Check args types
		if not isinstance(ID,str):
			return {"status":"bad","err":TypeError("ID not str")}

		elif not isinstance(USERNAME,str):
			return {"status":"bad","err":TypeError("USERNAME not str")}
		
		elif not isinstance(DATE,str):
			return {"status":"bad","err":TypeError("DATE not str")}
		
		elif not isinstance(ISBLOCKED,bool):
			return {"status":"bad","err":TypeError("ISBLOCKED not bool")}

		else:
			try:
				conn = sqlite3.connect(self.name)
				print("Connection 2 established")
				conn.execute("INSERT INTO USERS(ID,USERNAME,DATE,ISBLOCKED) VALUES(?,?,?,?);",(ID,USERNAME,DATE,ISBLOCKED))
				print("Data inserted successfly")
				conn.commit()
				conn.close()
				return {"status":"ok","id":ID,"username":USERNAME,"date":DATE,"isblocked":ISBLOCKED}
			except Exception as e:
				raise e

if __name__ == "__main__":
	server = Server()

