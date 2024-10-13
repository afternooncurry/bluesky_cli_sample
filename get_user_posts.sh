#!/bin/bash

# This script retrieves feeds of specific handle

if [ -z "$1" ] && [ -z "$2" ] ; then
    echo "Enter the domain of PDS as the first parameter."
    echo "Enter a handle as the second parameter."
    exit
fi

# Set the service endpoint: we can't use the resolve_service_endpoint.sh for PDS
SERVICE_ENDPOINT=$1

# Resolve DID for handle
ACTOR=`util/resolve_did.sh $SERVICE_ENDPOINT $2`

# Get a user's feed
LIMIT=10
FEED_URL="https://$SERVICE_ENDPOINT/xrpc/app.bsky.feed.getAuthorFeed"
curl -G \
    -H "Authorization: Bearer ${API_KEY}" \
    --data-urlencode "actor=$ACTOR" \
    --data-urlencode "limit=$LIMIT" \
    "$FEED_URL" | jq -r .feed 
    