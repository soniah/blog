---
title: iAudio mp3 player mount errors Ubuntu Gutsy
author: Sonia Hamilton
date: 2008-01-30
url: /2008/01/29/iaudio-mp3-player-mount-errors-ubuntu-gutsy/
categories:
  - Other-Tech
tags:
  - Audio
  - Ubuntu
---
  * gconf-editor
  * /system/storage/default\_options/vfat/mount\_options
  * remove the "usefree" option from the list

See [Launchpad Bug 151025][1].

 [1]: https://bugs.launchpad.net/ubuntu/+source/gnome-mount/+bug/151025
