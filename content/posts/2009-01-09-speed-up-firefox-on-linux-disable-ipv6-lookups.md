---
title: Speed up Firefox on Linux – Disable IPv6 Lookups
author: Sonia Hamilton
date: 2009-01-09
url: /2009/01/09/speed-up-firefox-on-linux-disable-ipv6-lookups/
categories:
  - Linux
tags:
  - Firefox
  - Networking
---
A post a stumbled upon &#8211; [Speed up Firefox on Linux &#8211; Disable IPv6 Lookups][1]. I don&#8217;t know if it works but I&#8217;m trying it now.

In a nutshell:

  * about:config
  * in the filter field, type “DNS” and hit enter
  * double-click on “network.dns.disableIPv6″, changing its value from False to True

See also my other post [pdnsd on Ubuntu for faster dns][2]

 [1]: http://rojs-techcorner.com/blog/2007/07/27/speed-up-firefox-on-linux-disable-ipv6-lookups/trackback/
 [2]: http://blog.snowfrog.net/2008/01/21/pdnsd-on-ubuntu-for-faster-dns/
