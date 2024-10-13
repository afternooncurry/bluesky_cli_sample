#!/bin/bash

# This script posts message

if [ -z "$1" ] && [ -z "$2" ]; then
    echo "Enter the domain of PDS as the first parameter."
    echo "Enter a message to be posted as second parameter."
    exit
fi

# Set the service endpoint: we can't use the resolve_service_endpoint.sh for PDS
SERVICE_ENDPOINT=$1

# Post the specified message
POST_FEED_URL="https://$SERVICE_ENDPOINT/xrpc/com.atproto.repo.createRecord"
POST_RECORD="{ \"collection\": \"app.bsky.feed.post\", \"repo\": \"${DID}\", \"record\": { \"text\": \"$*\", \"createdAt\": \"$(date +%Y-%m-%dT%H:%M:%S.%3NZ)\", \"\$type\": \"app.bsky.feed.post\" } }"
curl -X POST \
    -H "Authorization: Bearer ${API_KEY}" \
    -H 'Content-Type: application/json' \
    -d "$POST_RECORD" \
    "$POST_FEED_URL" | jq -r
