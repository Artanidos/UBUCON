

var ssbClient = require('ssb-client')
ssbClient(function (err, sbot) {
  if (err)
    throw err

  // sbot is now ready. when done:
  sbot.close()
})

