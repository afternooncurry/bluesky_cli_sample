#!/bin/bash

#This script resolves a service endpoint

if [ -z "$1" ] ; then
    echo "Enter a DID."
    exit
fi

# Resolve DID service endpoint
DID=$1
if [[ $DID == did:web:* ]] ; then
    DID_DOMAIN=`echo $DID | sed -s 's/did:web://'`
fi

if [ -z $DID_DOMAIN ] ; then
    echo "This type of DID is not supported."
    echo $DID
    exit
fi

echo "DID_DOMAIN=$DID_DOMAIN" 1>&2

DID_URL="https://$DID_DOMAIN/.well-known/did.json"
SERVICE_ENDPOINT=$(curl -G \
    "$DID_URL" | jq -r .service[].serviceEndpoint)
echo "SERVICE_ENDPOINT=$SERVICE_ENDPOINT" 1>&2
echo $SERVICE_ENDPOINT
