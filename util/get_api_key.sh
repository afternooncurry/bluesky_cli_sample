#!/bin/bash

# This script retrieves an API key

if [ -z "$1" ] && [ -z "$2" ] ; then
    echo "Enter a handle as first parameter and a password as second parameter."
fi

# Resolve DID for handle
DID=`util/resolve_did.sh $1`

# Get an app password from here: https://bsky.app/settings/app-passwords
APP_PASSWORD=$2

# Get API key with the app password
API_KEY_URL='https://bsky.social/xrpc/com.atproto.server.createSession'
POST_DATA="{ \"identifier\": \"${DID}\", \"password\": \"${APP_PASSWORD}\" }"
export API_KEY=$(curl -X POST \
    -H 'Content-Type: application/json' \
    -d "$POST_DATA" \
    "$API_KEY_URL" | jq -r .accessJwt)

echo API_KEY=$API_KEY 1>&2
echo $API_KEY
