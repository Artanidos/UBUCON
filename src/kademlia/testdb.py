import pickledb 

db = pickledb.load('example.db', False) 
db.set('key', 'value') 
v = db.get('key')
print(v)