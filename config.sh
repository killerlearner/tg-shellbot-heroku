#!/bin/sh
cat > config.json <<EOF
{
    "authToken": "$BOT_TOKEN",
    "owner": $OWN_ID
}
