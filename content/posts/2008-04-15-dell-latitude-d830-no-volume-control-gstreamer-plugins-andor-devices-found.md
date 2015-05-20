---
author: sonia
comments: true
date: 2008-04-15 02:17:31+00:00
slug: dell-latitude-d830-no-volume-control-gstreamer-plugins-andor-devices-found
title: 'Dell Latitude D830 No volume control GStreamer plugins and/or devices found '
wordpress_id: 123
categories:
- Linux
tags:
- Audio
- Ubuntu
---

**Solution:**

[Gutsy Intel HD Audio Controller](https://wiki.ubuntu.com/Gutsy_Intel_HD_Audio_Controller), "Method G"

In a nutshell:



	
  * enable backports

	
  * **sudo aptitude install linux-backports-modules-generic**

	
  * **sudo vi /etc/modprobe.d/alsa-base**

	
  * add  **options snd-hda-intel model=dell-m42** to end of file

	
  * reboot ($DEITY, that sounds so Window$)


