#!/bin/bash

# This script resolves DID for handle

if [ -z "$1" ] && [ -z "$2" ] ; then
    echo "Enter the domain of PDS as the first parameter."
    echo "Enter a handle as the second parameter."
    exit
fi

# Set service endpoint: we can't use the resolve_service_endpoint.sh for PDS
SERVICE_ENDPOINT=$1

# Resolve DID for handle
HANDLE=$2
DID_URL="https://$SERVICE_ENDPOINT/xrpc/com.atproto.identity.resolveHandle"
DID=$(curl -G \
    --data-urlencode "handle=$HANDLE" \
    "$DID_URL" | jq -r .did)
echo "DID=$DID" 1>&2
echo $DID
