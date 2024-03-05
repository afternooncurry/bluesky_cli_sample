#!/bin/bash

# This script retrieves post of specified

if [ -z "$1" ] ; then
    echo "Enter a DID of post as first parameter."
    echo "See a result of 'get_custom_feed.sh'."
    exit
fi

# Get a user's post
FEED_URL="https://bsky.social/xrpc/app.bsky.feed.getPosts"
curl -G \
    -H "Authorization: Bearer ${API_KEY}" \
    --data-urlencode "uris=$1" \
    "$FEED_URL" | jq -r .
