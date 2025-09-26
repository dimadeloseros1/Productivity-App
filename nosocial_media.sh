#!/bin/bash

social_media=(
    twitter.com
    www.twitter.com
    api.twitter.com
    youtube.com
    www.youtube.com
    x.com
    www.x.com
    reddit.com
    www.reddit.com
)

# Windows hosts file location
HOSTS_FILE="/c/Windows/System32/drivers/etc/hosts"

for i in "${social_media[@]}"; do
    echo "127.0.0.1 $i" | tee -a "$HOSTS_FILE" > /dev/null
done
