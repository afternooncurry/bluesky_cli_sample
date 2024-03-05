#!/bin/bash

if [ -z "$1" ] ; then
    echo "Enter a handle as first parameter."
    exit
fi

# Resolve DID for handle
ACTOR=`util/resolve_did.sh $1`

# Get a user's feed
LIMIT=4
FEED_URL="https://bsky.social/xrpc/app.bsky.feed.getAuthorFeed"
curl -G \
    -H "Authorization: Bearer ${API_KEY}" \
    --data-urlencode "actor=$ACTOR" \
    --data-urlencode "limit=$LIMIT" \
    "$FEED_URL" | jq -r .feed # Or if you want to return only a user's own posts: jq '.feed | .[] | select((.post.record."$type" == "app.bsky.feed.post") and (.post.record.reply.parent? | not) and (.reason? | not)) | {text: .post.record.text, createdAt: .post.record.createdAt, replyCount: .post.replyCount, repostCount: .post.repostCount, likeCount: .post.likeCount, author: {handle: .post.author.handle, displayName: .post.author.displayName, avatar: .post.author.avatar}}'
