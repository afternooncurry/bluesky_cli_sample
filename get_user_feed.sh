#!/bin/bash

# This script retrieves feeds of specific handle

if [ -z "$1" ] ; then
    echo "Enter a handle as first parameter."
    exit
fi

# Resolve DID for handle
ACTOR=`util/resolve_did.sh $1`

# Get a user's feed
LIMIT=4
FEED_URL="https://bsky.social/xrpc/app.bsky.feed.getAuthorFeed"
curl -G \
    -H "Authorization: Bearer ${API_KEY}" \
    --data-urlencode "actor=$ACTOR" \
    --data-urlencode "limit=$LIMIT" \
    "$FEED_URL" | jq -r .feed 
    