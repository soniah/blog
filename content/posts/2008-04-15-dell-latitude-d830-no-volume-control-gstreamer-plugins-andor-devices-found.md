---
title: Dell Latitude D830 No volume control GStreamer plugins and/or devices found
author: Sonia Hamilton
date: 2008-04-15
url: /2008/04/15/dell-latitude-d830-no-volume-control-gstreamer-plugins-andor-devices-found/
categories:
  - Linux
tags:
  - Audio
  - Ubuntu
---

[Gutsy Intel HD Audio Controller][1], &#8220;Method G&#8221;

<!--more-->

In a nutshell:

  * enable backports
  * **sudo aptitude install linux-backports-modules-generic**
  * **sudo vi /etc/modprobe.d/alsa-base**
  * add **options snd-hda-intel model=dell-m42** to end of file
  * reboot ($DEITY, that sounds so Window$)

 [1]: https://wiki.ubuntu.com/Gutsy_Intel_HD_Audio_Controller
