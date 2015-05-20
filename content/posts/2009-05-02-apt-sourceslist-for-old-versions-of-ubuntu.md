---
title: apt sources.list for old versions of Ubuntu
author: Sonia Hamilton
date: 2009-05-01
url: /2009/05/02/apt-sourceslist-for-old-versions-of-ubuntu/
categories:
  - Linux
tags:
  - Ubuntu
---
Discontinued versions of Ubuntu are mirrored under <http://old-releases.ubuntu.com/ubuntu/>, which can be used to setup apt&#8217;s sources.list.

For example, for Gutsy (7.10), **sources.list** would look like:

<pre>deb http://old-releases.ubuntu.com/ubuntu/ gutsy main restricted
deb http://old-releases.ubuntu.com/ubuntu/ gutsy-updates main restricted
deb http://old-releases.ubuntu.com/ubuntu/ gutsy universe
deb http://old-releases.ubuntu.com/ubuntu/ gutsy-updates universe
deb http://old-releases.ubuntu.com/ubuntu/ gutsy multiverse
deb http://old-releases.ubuntu.com/ubuntu/ gutsy-updates multiverse
deb http://old-releases.ubuntu.com/ubuntu/ gutsy-security main restricted
deb http://old-releases.ubuntu.com/ubuntu/ gutsy-security universe
deb http://old-releases.ubuntu.com/ubuntu/ gutsy-security multiverse</pre>

Thanks to Marty, JohnF, and others on the SLUG list.

**Update August/2012**

You can also use [http://archive.ubuntu.com/ubuntu/][1] and country specific repos like <http://au.archive.ubuntu.com/ubuntu/>

 [1]: http://au.archive.ubuntu.com/ubuntu/
