---
title: "Rules of thumb for Go"
date: 2023-10-30T00:00:00+01:00
draft: false
tags: [software]
---
> In English, the phrase "rule of thumb" refers to an approximate method for doing something, based on practical experience rather than theory.

[Github link][github_link].

This project's aim is simple. To provide some rough baseline measurements for common decisions you have to do every day as a software engineer:

```
Do I use map or a slice here?

TL;DR: use map when len(haystack) > 100 && len(needles) > 100
```

```
I need to deduplicate this, do I use map[T]struct{} or just deduplicate the slice?

TL;DR: use map when len(haystack) > 100. Use slice when the elements are pre-sorted.
```

There is many more in the [repository][github_link]. There are so many discussions like these in every
engineering team. It often comes up in code reviews - "you should use *struct here instead of copying". OK, but why? At what point is it beneficial? 

This is what I'm trying to provide some data for.


[github_link]: https://github.com/lunemec/go-rule-of-thumb
