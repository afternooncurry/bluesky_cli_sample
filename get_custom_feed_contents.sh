#!/bin/bash

# This script retrieves contents of the specified custom feed

if [ -z "$1" ] && [ -z "$2" ] && [ -z "$3" ] ; then
    echo "Enter the domain of PDS as the first parameter"#
    echo "Enter the at-uri of the feed as the second paramter"
    echo "Enter the DID of custom feed as the third parameter."
    echo "See a result of 'get_user_feed_list.sh'"
    exit
fi

FEED=$2

# Resolve the service endpoint from the DID of custom feed
SERVICE_ENDPOINT=`util/resolve_service_endpoint.sh $3`

# Get 10 posts of custom feed
LIMIT=10
FEED_URL="$SERVICE_ENDPOINT/xrpc/app.bsky.feed.getFeedSkeleton"
curl -G \
    -H "Authorization: Bearer ${API_KEY}" \
    --data-urlencode "feed=$FEED" \
    --data-urlencode "limit=$LIMIT" \
    "$FEED_URL" |jq .feed
