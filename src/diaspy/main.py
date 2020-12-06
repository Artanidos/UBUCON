# https://tovari.ch/
# https://diaspora.github.io/api-documentation/index.html
# https://requests.readthedocs.io/en/master/
# Artanidos def6c690f2c301385a270242c0a80004


import diaspy
import time

start = time.time()

c = diaspy.connection.Connection(pod='https://diasporing.ch',
                                 username='Artananda',
                                 password='2Silly4U$')
c.login()
end = time.time()
print(end - start)

#user_guid = diaspy.people.User(c, guid='def6c690f2c301385a270242c0a80004')
#print(user_guid["diaspora_id"])

# https://diasporing.ch/stream.json
# https://diasporing.ch/posts/6680081/comments.json
start = time.time()

stream = diaspy.streams.Stream(c)
for post in stream:
    print(post,"\n")
    pass
#stream.post('My new post')
end = time.time()
print(end - start)
