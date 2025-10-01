
#!/bin/bash

# Path to hosts file 
HOSTS="/c/Windows/System32/drivers/etc/hosts"

# Social media sites to block
SITES="twitter.com www.twitter.com api.twitter.com youtube.com www.youtube.com x.com www.x.com reddit.com www.reddit.com"

blocks() {
    echo "Blocking social media sites..."
    for site in $SITES; do
        # Check if already blocked
        if ! grep -q "127.0.0.1 $site" "$HOSTS" 2>/dev/null; then
            echo "127.0.0.1 $site" >> "$HOSTS"
            echo "Blocked: $site"
        else
            echo "Already blocked: $site"
        fi
    done
    echo "Done blocking!"
}

unblocks() {
    echo "Unblocking social media sites..."
    for site in $SITES; do
        sed -i "/127.0.0.1 $site/d" "$HOSTS"
        echo "Unblocked: $site"
    done
    echo "Done unblocking!"
}

case "$1" in
    block)
        blocks ;;
    unblock)
        unblocks ;;
    *)
        echo "Usage: $0 block | unblock"
        exit 1 ;;
esac
