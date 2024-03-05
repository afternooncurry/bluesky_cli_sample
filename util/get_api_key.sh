#!/bin/bash

# This script resolves a DID, retrieves an API key, fetches a user's feed,
# and posts a "Hello, world" message to the user's feed.

if [ -z "$1" ] && [ -z "$2" ] ; then
    echo "Enter a handle as first parameter and a password as second parameter."
    exit
fi

# Resolve DID for handle
DID=`util/resolve_did.sh $1`
echo "DID=$DID"
export DID

# Get an app password from here: https://staging.bsky.app/settings/app-passwords
export APP_PASSWORD=$2

# Get API key with the app password
API_KEY_URL='https://bsky.social/xrpc/com.atproto.server.createSession'
POST_DATA="{ \"identifier\": \"${DID}\", \"password\": \"${APP_PASSWORD}\" }"
export API_KEY=$(curl -X POST \
    -H 'Content-Type: application/json' \
    -d "$POST_DATA" \
    "$API_KEY_URL" | jq -r .accessJwt)

echo "env API_KEY was exported using the following data:"
echo $API_KEY
