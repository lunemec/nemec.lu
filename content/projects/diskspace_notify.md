---
title: "Diskspace Notify"
date: 2018-06-18T00:00:00+01:00
draft: false
tags: [software]
---
Checks periodically for free disk space and alerts user via email when there is not enough free space (threshold set in config).

It does not aim to replace any large monitoring tools, origin of this tool is pretty simple. I ran out of disk space on my root partition, which caused it to break. 

I was suprised initially, why would you not be able to ssh onto a machine that ran out of space on `/` partition? Turns out, that if `sshd` can't log even 1 byte to syslog, it just stops.

Features:
- Super simple and lightweight.
- Configurable plaintext email messages.
- Check free disk space each X seconds (configurable).
- Send email via Gmail or local SMTP server.
- When free disk space crosses threshold (configurable in %), send notification.
- Asynchronous free space checking.
- Sends email only after all mountpoints are checked.
- Sends email only once in X seconds (configurable).
- Can log to stdout or to logfile.

[Github link](https://github.com/lunemec/diskspace-notify).
