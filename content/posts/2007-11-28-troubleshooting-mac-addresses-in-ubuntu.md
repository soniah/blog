---
title: Troubleshooting mac addresses in Ubuntu
author: Sonia Hamilton
date: 2007-11-29
url: /2007/11/28/troubleshooting-mac-addresses-in-ubuntu/
categories:
  - Other-Tech
tags:
  - Networking
  - Ubuntu
---
As far as /etc/iftab goes, this is not used in Ubuntu 7.10  
anymore&#8230;.this functionality is moved to hotplug,. and maybe causing  
your prob.<!--more-->

As you said, the NIC was in when Ubuntu was installed. However, some  
NICs for some curious reason do sometimes change MAC address between  
powerups.

Checkout the file /etc/udev/rules.d/70-persistent-net.rules . If there  
are lots of entries in their for different MAC addresses, there is  
your problem.

This file is generated during bootup by  
/etc/udev/rules.d/75-persistent-net-generator.rules. The suggestion at  
http://ubuntuforums.org/showthread.php?p=3816892 suggests to backup  
and delete these two files. The system will then just assign ethernet  
devices numbers in the order it finds them, and if it only every finds  
one NIC then it will always be eth0

*Copied verbatim from Martin&#8217;s post on SLUG.*
