---
author: sonia
comments: true
date: 2006-08-23 03:22:44+00:00
slug: howto-get-flash-sound-working-in-ubuntu-dapper
title: howto get Flash sound working in Ubuntu Dapper
wordpress_id: 37
categories:
- Other-Tech
tags:
- Flash
- Sound
- Ubuntu
---

When I upgraded to Ubuntu Dapper, Flash sound stopped working in Firefox - oh no, no more YouTube!

An easy fix:

    
     sudo aptitude install alsa-oss
     sudo vi /etc/firefox/firefoxrc
     FIREFOX_DSP=u201daossu201d


Thanks to [macewan.org](http://www.macewan.org/2006/06/01/howto-firefox-flash-video-sound-on-ubuntu-linux-dapper)
