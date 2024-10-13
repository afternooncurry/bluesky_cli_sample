#!/bin/bash

# This script retrieves an API key

if [ -z "$1" ] && [ -z "$2" ] ; then
    echo "Enter only the domain of PDS as the first parameter."
    echo "Enter a handle as the second parameter."
    echo "Enter a password as third parameter."
fi

# Set the service endpoint: we can't use the resolve_service_endpoint.sh for PDS
SERVICE_ENDPOINT=$1

# Resolve DID for handle
DID=`util/resolve_did.sh $SERVICE_ENDPOINT $2`

# Get an app password from here: https://bsky.app/settings/app-passwords
APP_PASSWORD=$3

# Get API key with the app password
API_KEY_URL="https://$SERVICE_ENDPOINT/xrpc/com.atproto.server.createSession"
POST_DATA="{ \"identifier\": \"${DID}\", \"password\": \"${APP_PASSWORD}\" }"
RESPONSE=$(curl -X POST \
    -H 'Content-Type: application/json' \
    -d "$POST_DATA" \
    "$API_KEY_URL")
#echo RESPONSE=$RESPONSE 1>&2
export API_KEY=$(echo $RESPONSE | jq -r .accessJwt)

echo API_KEY=$API_KEY 1>&2
echo $API_KEY
