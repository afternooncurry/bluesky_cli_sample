#!/bin/bash

# This script resolves a service endpoint from DID document

if [ -z "$1" ] ; then
    echo "Enter a DID of the service such as feed."
    exit
fi

# Resolve DID service endpoint
DID=$1
if [[ $DID == did:web:* ]] ; then
    DID_DOMAIN=`echo $DID | sed 's/did:web://'`
    echo "DID_DOMAIN=$DID_DOMAIN" 1>&2

    DID_URL="https://$DID_DOMAIN/.well-known/did.json"
    SERVICE_ENDPOINT=$(curl -G \
        "$DID_URL" | jq -r .service[].serviceEndpoint)
elif [[ $DID == did:plc:* ]] ; then
    DID_URL="https://plc.directory/$DID"
    SERVICE_ENDPOINT=$(curl \
        $DID_URL | jq .service[].serviceEndpoint)
else
    echo "This type of DID is not supported." 1>&2
    echo $DID 1>&2
    exit
fi

echo "SERVICE_ENDPOINT=$SERVICE_ENDPOINT" 1>&2
echo $SERVICE_ENDPOINT
