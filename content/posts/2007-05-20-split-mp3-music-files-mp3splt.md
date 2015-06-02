---
title: Split mp3 Music Files – mp3splt
author: Sonia Hamilton
date: 2007-05-21
url: /2007/05/20/split-mp3-music-files-mp3splt/
categories:
  - Linux
tags:
  - Audio
  - Ubuntu
---
A useful tool for splitting mp3 music files on Linux is **mp3splt.** To install it on Ubuntu or Debian based distributions, type:

<!--more-->

`$ sudo aptitude install mp3splt`

Here's an example of using it to split a collection of large mp3 files into 11 minute chunks; the -a option automatically finds silences near the 11 minute mark to split on:

`for i in ../origs/* ; do mp3splt -a -t 11.00 ./${i} ; done`
