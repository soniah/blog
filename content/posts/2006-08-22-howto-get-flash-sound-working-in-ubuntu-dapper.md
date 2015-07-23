---
title: howto get Flash sound working in Ubuntu Dapper
author: Sonia Hamilton
date: 2006-08-23
url: /2006/08/22/howto-get-flash-sound-working-in-ubuntu-dapper/
categories:
  - Other-Tech
tags:
  - Flash
  - Sound
  - Ubuntu
---
When I upgraded to Ubuntu Dapper, Flash sound stopped working in Firefox -- oh no, no more YouTube!
<!--more-->


An easy fix:

<pre>sudo aptitude install alsa-oss
 sudo vi /etc/firefox/firefoxrc
 FIREFOX_DSP=u201daossu201d</pre>

Thanks to [macewan.org][1]

 [1]: http://www.macewan.org/2006/06/01/howto-firefox-flash-video-sound-on-ubuntu-linux-dapper
