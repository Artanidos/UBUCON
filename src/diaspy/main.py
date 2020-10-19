# https://tovari.ch/
# https://diaspora.github.io/api-documentation/index.html
# https://requests.readthedocs.io/en/master/
# Artanidos def6c690f2c301385a270242c0a80004

import diaspy


c = diaspy.connection.Connection(pod='https://tovari.ch',
                                 username='crowdware',
                                 password='1234567890')
c.login()
user_guid = diaspy.people.User(c, guid='def6c690f2c301385a270242c0a80004')
print(user_guid["diaspora_id"])

stream = diaspy.streams.Stream(c)
for post in stream:
    print(post)
#stream.post('My new post')
