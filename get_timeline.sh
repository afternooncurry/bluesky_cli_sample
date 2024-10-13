#!/bin/bash

# This script retrieves contents of the specified custom feed

if [ -z "$1" ] ; then
    echo "Enter the domain of PDS as the first parameter."
    exit
fi

# Set service endpoint: we can't use the resolve_service_endpoint.sh for PDS
SERVICE_ENDPOINT=$1

# Get 10 posts of custom feed
LIMIT=10
FEED_URL="https://$SERVICE_ENDPOINT/xrpc/app.bsky.feed.getTimeline"
curl -G \
    -H "Authorization: Bearer ${API_KEY}" \
    --data-urlencode "limit=$LIMIT" \
    "$FEED_URL" |jq
