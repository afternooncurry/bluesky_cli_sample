#!/bin/bash

if [ -z "$1" ] ; then
    echo "Enter a message to be posted as first parameter."
    exit
fi

# Post "Hello, world" to your feed
POST_FEED_URL='https://bsky.social/xrpc/com.atproto.repo.createRecord'
POST_RECORD="{ \"collection\": \"app.bsky.feed.post\", \"repo\": \"${DID}\", \"record\": { \"text\": \"$*\", \"createdAt\": \"$(date +%Y-%m-%dT%H:%M:%S.%3NZ)\", \"\$type\": \"app.bsky.feed.post\" } }"
curl -X POST \
    -H "Authorization: Bearer ${API_KEY}" \
    -H 'Content-Type: application/json' \
    -d "$POST_RECORD" \
    "$POST_FEED_URL" | jq -r
