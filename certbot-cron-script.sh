#!/bin/bash

WEBHOOK_URL=https://hooks.slack.com/services/xxxxxxx/yyyyyyy/zzzzzzzzzzzzzzzzzz
CHANNEL="#slack-channel-name"
SERVER_NAME='監視するサーバの名前'
LOG_OUTPUT_PATH=/home/ubuntu/cron-script/result.log

DT=`date "+%Y年%m月%d日%H時%M分%S秒"`

# RESULT=`/home/ubuntu/wget-files/certbot/certbot-auto renew | sed ':a;N;$!ba;s/\n/ /g' | sed -e 's/[()]/ /g' | sed -e 's/-/ /g'`
RESULT=`certbot-auto renew | sed -e 's/[()]/ /g'`
MESSAGE=`printf %q $RESULT`
cat << EOS
curl -X POST --data-urlencode 'payload={"channel": "'$CHANNEL'", "username": "CURLさん", "text": "'$DT' : '$MESSAGE'", "icon_emoji": ":desktop_computer:"}' $WEBHOOK_URL
EOS
CURL_RESULT=`curl -X POST --data-urlencode 'payload={"channel": "'$CHANNEL'", "username": "CURLさん", "text": "'$DT' : '${SERVER_NAME}のSSL証明書の更新処理をしました'", "icon_emoji": ":desktop_computer:"}' $WEBHOOK_URL`
echo $CURL_RESULT

echo $DT | tee -a $LOG_OUTPUT_PATH
echo $RESULT | tee -a $LOG_OUTPUT_PATH
