---
title: "Wallpaper Changer"
date: 2014-04-26T00:00:00+01:00
draft: false
tags: [software]
---
Python application for dynamic changing of wallpapers depending on certain conditions (time of day, date, wheather, cpu temperature, etc...).

This tool comes with some pre-tested images that work pretty well. It will run on background and update the wallpaper based on the time of day. It does this by merging few of the images together, so you can have nice sunny day as wallpaper during the day, and darker starry one during the night.

```
Folder containing images should have images that represent time of day passing - by leaves falling, sun setting, nightsky showing etc...

Folder names should be numbers .jpg/png so it will correspond to this:

HOURS --- 00 --- 01 --- 02 --- 03 --- 04 --- 05 --- 06 --- 07 --- 08 --- 09 --- 10 --- 11 --- 12 --- 13 --- 14 --- 15 --- 16 --- 17 --- 18 --- 19 --- 20 --- 21 --- 22 --- 23 ---
IMAGES      0.jpg           02.jpg            03.jpg           04.jpg          05.jpg           06.jpg          07.jpg          08.jpg            09.jpg          10.jpg

You can have more images than this of course, but note that wpchanger changes images each 5 mins, so there would be no sense in having more than 24*60*5 images
At the end of the day, images 10 and 00 will be merged and loop starts again the other day
```

[Github link][github_link].

[github_link]: https://github.com/lunemec/wpchanger
