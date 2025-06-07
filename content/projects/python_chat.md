---
title: "Python Chat"
date: 2013-06-17T00:00:00+01:00
draft: false
tags: [software]
---
A simple CLI chatserver that uses server-client RSA key based authentication. I added dynamic keypair generation for server and clients (on startup each generates 4096b long key) and exchanges public keys when connected. This way there is no need to create encrypted keys for clients and server.

[Github link](https://github.com/lunemec/python-chat).
