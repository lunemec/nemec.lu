---
title: "Nanny"
date: 2018-06-29T00:00:00+01:00
draft: false
tags: [software]
---
Nanny is a monitoring tool that monitors the absence of activity.

Nanny runs an API server, which expects to be called every N seconds, and if no such call is made, Nanny notifies you.

Nanny can notify you via these channels (for now):
- print text to stderr
- email
- sentry
- sms (twilio)
- slack (webhook)
- generic webhook (HTTP POST callback)
- xmpp (jabber)

## Usecase?
Ever wrote invalid crontab record? Ever had it call bash script that failed silently without doing what you wanted, and you noticed months later? Thats why.

## Example

Run API server:
```bash
$ LOGXI=* ./nanny
14:21:07.969059 INF ~ Using config file
   path: nanny.toml
14:21:07.977322 INF ~ Nanny listening addr: localhost:8080
```
Call it via curl:
```bash
curl http://localhost:8080/api/v1/signal --data '{ "name": "my awesome program", "notifier": "stderr", "next_signal": "5s", "all_clear": false }'
```
With this call, you tell Nanny that if program named `my awesome program` does not call again within `next_signal` period (5s), it should notify you using `stderr` notifier. 

Additionally, Nanny appends the IP or `X-Forwarded-For` HTTP header to the program name. You can disable this behaviour by sending a `X-Dont-Modify-Name` along with the request. If you activate `all_clear` you will get an additional notification when the program sends a signal to Nanny for the first time after an alert was sent.

After 5s pass, Nanny prints to *stderr*:
```bash
2018-06-26T14:24:29+02:00: Nanny: I haven't heard from "my awesome program@127.0.0.1" in the last 5s! (Meta: map[])
```

[Github link](https://github.com/lunemec/nanny).
