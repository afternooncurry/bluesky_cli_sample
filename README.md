# bluesky_cli_sample

## Samples to use Bluesky API from shell scripts.

### Prerequisite
- Bash
- Curl
- jq
- sed

### How to use

1. Execute the comamnd to get an API key:  
    ```export API_KEY=`source util/get_api_key.sh ${pds_domain} ${handle} ${app_password}` ```
    - *Note* Use backquote characters as quotes to get proper result
1. Execute any command. Ex.
    1. Get posts of the specified user:  
        `./get_user_posts.sh ${pds_domain} afternooncurry.net`
    1. Publish a post:  
        `./post_message.sh ${pds_domain} Hello world!`
    1. Get a list of custom feed of the specified user:  
        `./get_user_created_feed_list.sh ${pds_domain} afternooncurry.net`
    1. Get a definition of the specified custom feed:  
        `./get_custom_feed_definition.sh at://did:plc:a2xwwhapu62gfsy4rdnlxgfy/app.bsky.feed.generator/owls
    1. Get posts of the specified custom feed:  
        `./get_custom_feed_contents.sh ${pds_domain} at://did:plc:a2xwwhapu62gfsy4rdnlxgfy/app.bsky.feed.generator/owls did:web:afternooncurry.com`
    1. Get a specified post:  
        `./get_post.sh ${pds_domain} at://did:plc:a2xwwhapu62gfsy4rdnlxgfy/app.bsky.feed.post/3kmx4s3fm3t2i`

*Note* : API key would be expired soon. Please go back to the step 1 to get new API key.
