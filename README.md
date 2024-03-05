# bluesky_cli_sample

## Samples to use Bluesky API from shell scripts.

### How to use

1. Execute the comamnd to get API_KEY: `source util/get_api_key.sh ${handle} ${app_password}`
2. Execute any command. Ex.
    1. Get posts of the specified user:  `./get_user_profile_feed.sh afternooncurry.net`
    2. Publish a post:  `./post_message.sh Hello world!`
    3. Get a list of custom feed of the user: `./get_user_feed_list.sh afternooncurry.net`
    4. Get posts of the specified custom feed: `./get_custom_feed.sh afternooncurry.net owls did:web:afternooncurry.net`
    5. Get a specified post: `/.get_user_post.sh at://did:plc:a2xwwhapu62gfsy4rdnlxgfy/app.bsky.feed.post/3kmx4s3fm3t2i`
