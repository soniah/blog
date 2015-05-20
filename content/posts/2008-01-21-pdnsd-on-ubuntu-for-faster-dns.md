---
title: pdnsd on Ubuntu for faster dns
author: Sonia Hamilton
date: 2008-01-22
url: /2008/01/21/pdnsd-on-ubuntu-for-faster-dns/
categories:
  - Other-Tech
tags:
  - Networking
  - Ubuntu
---
Whilst traveling through Mexico and Guatemala, I&#8217;ve had various problems with slow and/or faulty dns resolution. Here&#8217;s how to install pdnsd, in order to cache dns entries locally and speed up internet access in general (whether or not you&#8217;re in Guatemala&#8230;):<!--more-->

  * **LANG= ; sudo apt-get update; sudo aptitude install pdnsd**
  * **sudo vi /etc/pdnsd.conf**, add the following lines:
`<br />
server {<br />
label=OpenDNS;<br />
ip=208.67.222.222;<br />
ip=208.67.220.220;<br />
timeout=30;<br />
interval=30;<br />
uptest=ping;<br />
ping_timeout=50;<br />
purge_cache=off;<br />
}<br />
`

  * in the same file, comment out the resolvconf server:
`<br />
/*<br />
server {<br />
label="resolvconf";<br />
}<br />
*/<br />
`

  * **sudo vi /etc/dhcp3/dhclient.conf**, and uncomment the line that says **prepend domain-name-servers 127.0.0.1**;
  * to prevent rebooting, **sudo vi /etc/resolv.conf** and insert as the first line **nameserver 127.0.0.1**. Otherwise just reboot
  * **sudo /etc/init.d/pdnsd restart** (if not rebooting)
  * check name resolution using the host command eg **host google.com** should return about 6 lines of output &#8211; 3 lines saying google.com has address&#8230; and 3 lines saying google.mail is handled by&#8230;

Taken initially from bmt&#8217;s excellent [article][1] on Ubuntu Forums; I&#8217;ve written my own article as I want to add my own customisation as I understand the interactions between dhclient, resolvconf and NetworkManager. See also [Steve&#8217;s article][2] on Debian Administration.

 [1]: http://ubuntuforums.org/showthread.php?t=331850
 [2]: http://www.debian-administration.org/articles/390
