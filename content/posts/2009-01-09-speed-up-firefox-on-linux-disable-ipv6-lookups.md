---
author: sonia
comments: true
date: 2009-01-09 00:01:47+00:00
slug: speed-up-firefox-on-linux-disable-ipv6-lookups
title: Speed up Firefox on Linux - Disable IPv6 Lookups
wordpress_id: 207
categories:
- Linux
tags:
- Firefox
- Networking
---

A post a stumbled upon - [Speed up Firefox on Linux - Disable IPv6 Lookups](http://rojs-techcorner.com/blog/2007/07/27/speed-up-firefox-on-linux-disable-ipv6-lookups/trackback/). I don't know if it works but I'm trying it now.

In a nutshell:



	
  * about:config

	
  * in the filter field, type “DNS” and hit enter

	
  * double-click on “network.dns.disableIPv6″, changing its value from False to True


See also my other post [pdnsd on Ubuntu for faster dns](http://blog.snowfrog.net/2008/01/21/pdnsd-on-ubuntu-for-faster-dns/)
