#!/bin/bash

# This script retrieves post of specified

if [ -z "$1" ] && [ -z "$2" ] ; then
    echo "Enter the domain of PDS as the first parameter."
    echo "Enter an at-uri of the post as the second parameter."
    echo "See a result of 'get_custom_feed_contents.sh' for the value of at-uri."
    exit
fi

# Set the service endpoint: : we can't use the resolve_service_endpoint.sh for PDS
SERVICE_ENDPOINT=$1

# Get a user's post
FEED_URL="https://$SERVICE_ENDPOINT/xrpc/app.bsky.feed.getPosts"
curl -G \
    -H "Authorization: Bearer ${API_KEY}" \
    --data-urlencode "uris=$2" \
    "$FEED_URL" | jq -r .
