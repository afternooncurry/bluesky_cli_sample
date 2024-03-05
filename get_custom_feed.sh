#!/bin/bash

# This script retrieves contents of the specified custom feed

if [ -z "$1" ] && [ -z "$2" ] && [ -z "$3" ] ; then
    echo "Enter an actor (handle) as first parameter, custom feedName as second paramter and DID as third parameter."
    echo "See a result of 'get_user_feed_list.sh'"
    exit
fi

# Resolve DID for handle
ACTOR=`util/resolve_did.sh $1`

FEED=$2

SERVICE_ENDPOINT=`util/resolve_service_endpoint.sh $3`

# Get 10 posts of custom feed
LIMIT=10
FEED_URL="$SERVICE_ENDPOINT/xrpc/app.bsky.feed.getFeedSkeleton"
curl -G \
    -H "Authorization: Bearer ${API_KEY}" \
    --data-urlencode "feed=at://$ACTOR/app.bsky.feed.generator/$FEED" \
    --data-urlencode "limit=$LIMIT" \
    "$FEED_URL" |jq .feed
