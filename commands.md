# start server
ssb-server start

# publish a message
ssb-server publish --type post --text "My First Post!"

# stream all messages in all feeds, ordered by publish time
ssb-server feed

# stream all messages in all feeds, ordered by receive time
ssb-server log

# stream all messages by one feed, ordered by sequence number
ssb-server hist --id $FEED_ID