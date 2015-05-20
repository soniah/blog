---
author: sonia
comments: true
date: 2008-01-22 00:48:56+00:00
slug: pdnsd-on-ubuntu-for-faster-dns
title: pdnsd on Ubuntu for faster dns
wordpress_id: 110
categories:
- Other-Tech
tags:
- Networking
- Ubuntu
---

Whilst traveling through Mexico and Guatemala, I've had various problems with slow and/or faulty dns resolution. Here's how to install pdnsd, in order to cache dns entries locally and speed up internet access in general (whether or not you're in Guatemala...):<!-- more -->



	
  * **LANG= ; sudo apt-get update; sudo aptitude install pdnsd**

	
  * **sudo vi /etc/pdnsd.conf**, add the following lines:

`
server {
label=OpenDNS;
ip=208.67.222.222;
ip=208.67.220.220;
timeout=30;
interval=30;
uptest=ping;
ping_timeout=50;
purge_cache=off;
}
`
	
  * in the same file, comment out the resolvconf server:

`
/*
server {
label="resolvconf";
}
*/
`
	
  * **sudo vi /etc/dhcp3/dhclient.conf**, and uncomment the line that says **prepend domain-name-servers 127.0.0.1**;

	
  * to prevent rebooting, **sudo vi /etc/resolv.conf** and insert as the first line **nameserver 127.0.0.1**. Otherwise just reboot

	
  * **sudo /etc/init.d/pdnsd restart** (if not rebooting)

	
  * check name resolution using the host command eg **host google.com** should return about 6 lines of output - 3 lines saying google.com has address... and 3 lines saying google.mail is handled by...


Taken initially from bmt's excellent [article](http://ubuntuforums.org/showthread.php?t=331850) on Ubuntu Forums; I've written my own article as I want to add my own customisation as I understand the interactions between dhclient, resolvconf and NetworkManager. See also [Steve's article](http://www.debian-administration.org/articles/390) on Debian Administration.
