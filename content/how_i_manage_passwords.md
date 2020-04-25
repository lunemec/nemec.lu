---
title: "How I manage passwords without loosing sanity"
date: 2019-12-02T10:00:20+01:00
draft: false
tags: [tech, software]
---

[A lot](1) [has been said](2) [about passwords](3) [being bane](4) [of our society](5). [And it is true](6). However, with some not-so-hard setup of software, it can be made bearable.

The setup starts with [**KeePass2*](keepass) password safe. This is a program that allows you
to store arbitrary data, but also specifically usernames, passwords and URLs that can be matched to find your saved password.

It can also generate safe random passwords, set expiration, and a lot more. Oh, and it is
multiplatform - it works on GNU Linux, and there is MacOS program ([MacPass](macpass)) that is compatible
with the keepass database.

Then comes the second part - connecting this password database with your browser. Depending on your browser, there are plugins. I use *KeePassHttp-Connector* for Firefox. Chrome has same plugin, just named differently.

Then you also need the plugin within the [*KeePass* itself](keepasshttp) (or the MacPass - MacPassHttp).

Now, you create password database, that is encrypted with a private key and a password. Singular master password that unlocks all your other passwords. Needless to say - this password must be very strong, and not used anywhere else - to avoid leaking it from some unsecure webapp.

With this, you can now start filling your password database, and have all the passwords in one place without risking any leaks from services like LastPass or OnePass or what have you.

But now when you loose the 2 files - **.kbdx** and **.key** - you loose everything! That is not something you want.

This is easy. You simply save the **.kbdx** file on your dropbox (**DO NOT SAVE THE .key FILE THERE TOO - INSECURE**). Then distribute the **.key** file via flashdrive to all your computers (or ssh, or whatever secure transfer - not mail!).

Now any change made to your password database is automatically synced to all your devices, even a iPhone (I use KeePassTouch, which supports loading from Dropbox).

And Violá! You now have personal, safe, distributed password system. And in case you don't want to rely on services like Dropbox, you can use Syncthing personal synchronization program, but its a bit more complicated.

[1]: https://blog.codinghorror.com/passwords-vs-pass-phrases/
[2]: https://blog.codinghorror.com/youre-probably-storing-passwords-incorrectly/
[3]: https://blog.codinghorror.com/the-dirty-truth-about-web-passwords/
[4]: https://blog.codinghorror.com/your-password-is-too-damn-short/
[5]: https://blog.codinghorror.com/password-rules-are-bullshit/
[6]: https://twitter.com/codinghorror/status/631238409269309440
[keepass]: https://keepass.info
[macpass]: https://macpassapp.org
[keepasshttp]: https://keepass.info/plugins.html#keepasshttp