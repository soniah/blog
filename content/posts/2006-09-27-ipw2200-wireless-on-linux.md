---
title: ipw2200 wireless on linux
author: Sonia Hamilton
date: 2006-09-28
url: /2006/09/27/ipw2200-wireless-on-linux/
categories:
  - Linux
tags:
  - Wireless
---
ipw2200 wireless on linux
<!--more-->
Useful link <http://www.de-brauwer.be/wiki/wikka.php?wakka=LinuxTecraS2>

Most importantly -- how to deal with wireless hardware switch

$ cat /sys/bus/pci/drivers/ipw2200/0000:06:02.0/rf_kill

<pre>This code has the following meaning:

  0 = RF kill not enabled (radio on)
  1 = SW based RF kill active (radio off)
  2 = HW based RF kill active (radio off)
  3 = Both HW and SW RF kill active (radio off)</pre>

To fix

  * sudo rmmod ipw2200
  * press hardware radio switch
  * sudo insmod /lib/modules/./ipw2200.ko
  * cat /sys/./rf_kill -- should have a value of 0
