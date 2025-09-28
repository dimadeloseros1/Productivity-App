#!/usr/bin/env bash

# Sites to block
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

if [[ $1 == "block" ]]; then
	for i in "${social_media[@]}"; do
		sed -i "/^127.0.0.1 $i/d" /c/Windows/System32/drivers/etc/hosts
		echo "127.0.0.1 $i" >> /c/Windows/System32/drivers/etc/hosts
	done
fi


if [[ $1 == "unblock" ]]; then
	for i in "${social_media[@]}"; do
		sed -i "/^127.0.0.1 $i/d" /c/Windows/System32/drivers/etc/hosts
	done
fi
