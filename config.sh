#!/bin/sh
cat > config.json <<EOF
{
    "authToken": "$BOT_TOKEN",
    "owner": $OWN_ID
}

echo $RCLONE_CONFIG | base64 -d > rclone.conf
