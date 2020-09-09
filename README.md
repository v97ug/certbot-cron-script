# certbot-cron-script

This is a cron script in order to execute certbot regularly. We need to install [certbot](https://certbot.eff.org/) in advance.

# How it works?

```
$ ./certbot-cron-script.sh
```

# How to set cron?

Run `sudo crontab -e`, then add link the following command.

```
# m h  dom mon dow   command
28 22 15 * * /home/ubuntu/cron-script/cron-script.sh >> /home/ubuntu/cron_script.log
53 10 28 * * /home/ubuntu/cron-script/cron-script.sh >> /home/ubuntu/cron_script.log
```

# Option

| option | description | example |
| ---- | ---- | ---- |
| WEBHOOK_URL | Slack webhook url | https://hooks.slack.com/services/xxxxxx/yyyyyyy/zzzzzzzz |
| CHANNEL | Slack channel name | "#xxxx" |
| SERVER_NAME | arbitrary server name | 'watched-server' |
| LOG_OUTPUT_PATH | file path to output log file of cron script | /home/ubuntu/cron-script/result.log |