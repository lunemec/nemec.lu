---
title: "Birkana in Rust with HTTP"
date: 2018-11-11T00:00:00+01:00
draft: false
tags: [software]
---
![Birkana representation of "Lukáš Němec"](1-myname.svg)

Recently I read [this awesome article][article] about representing hexadecimal numbers using runic system. So I created this little program that takes hexadecimal string on stdin and spits out SVG data on stdout.

[Github link][github_link].

To make it easier, and also to learn about state of Rust's HTTP frameworks, I wrote a small HTTP server
for this, and it is [open to the public][birkana_http_link].

[Github link][github_link2].

Lessons learned:
- SVG in Rust.
- How to create library and binary in single repo (its not as straight forward as you might think).
- How to work with Rocket.rs (that was the first version).
- Migration to Actix-web and Terra templates.
- Dockerized while keeping image relatively small (90MB), from M1 mac to linux/amd64 (oh this is not as easy as one might think either!).

[article]: https://yawar.blogspot.com/2016/10/the-birkana-hexadecimal-number-symbols.html
[github_link]: https://github.com/lunemec/rust-birkana
[github_link2]: https://github.com/lunemec/rust-birkana-http
[birkana_http_link]: https://birkana.nemec.lu
