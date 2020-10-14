#!/bin/sh
echo Configuring Bot....
cat > config.json <<EOF
{
    "authToken": "$BOT_TOKEN",
    "owner": "$OWN_ID"
}
EOF

echo Configuring RClone....
mkdir -p $HOME/.config/rclone/
echo $RCLONE_CONFIG | base64 -d > rclone.conf
cp rclone.conf $HOME/.config/rclone/rclone.conf
