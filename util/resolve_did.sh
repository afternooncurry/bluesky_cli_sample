if [ -z "$1" ] ; then
    echo "Enter a handle as first parameter."
    exit
fi

# Resolve DID for handle
HANDLE=$1
DID_URL="https://bsky.social/xrpc/com.atproto.identity.resolveHandle"
DID=$(curl -G \
    --data-urlencode "handle=$HANDLE" \
    "$DID_URL" | jq -r .did)
echo $DID
