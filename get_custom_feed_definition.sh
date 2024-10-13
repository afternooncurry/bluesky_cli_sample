#!/bin/bash

# This script retrieves feeds of specific handle

if [ -z "$1" ] && [ -z "$2" ] ; then
    echo "Enter the domain of PDS as the first parameter."
    echo "Enter the at-URI of custom feed as the second parameter."
    echo "See a result of get_user_created_feed_list.sh for at-URI"
    exit
fi

# Set the service endpoint
SERVICE_ENDPOINT=$1

# Set the DID of custom feed
CUSTOM_FEED_DID=$2

# Get a list of user's feeds
FEED_URL="https://$SERVICE_ENDPOINT/xrpc/app.bsky.feed.getFeedGenerator"
curl -G \
    -H "Authorization: Bearer ${API_KEY}" \
    --data-urlencode "feed=$CUSTOM_FEED_DID" \
    "$FEED_URL" | jq .
