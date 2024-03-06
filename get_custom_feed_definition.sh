#!/bin/bash

# This script retrieves feeds of specific handle

if [ -z "$1" ] ; then
    echo "Enter a DID of custom feed as first parameter."
    echo "See a result of get_user_created_feed_list.sh"
    exit
fi

# Get a list of user's feeds
FEED_URL="https://bsky.social/xrpc/app.bsky.feed.getFeedGenerator"
curl -G \
    -H "Authorization: Bearer ${API_KEY}" \
    --data-urlencode "feed=$1" \
    "$FEED_URL" | jq .
