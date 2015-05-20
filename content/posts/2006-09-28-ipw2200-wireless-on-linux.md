---
author: sonia
comments: true
date: 2006-09-28 03:15:24+00:00
slug: ipw2200-wireless-on-linux
title: ipw2200 wireless on linux
wordpress_id: 44
categories:
- Linux
tags:
- Wireless
---

Useful link [http://www.de-brauwer.be/wiki/wikka.php?wakka=LinuxTecraS2](http://www.de-brauwer.be/wiki/wikka.php?wakka=LinuxTecraS2)

Most importantly - how to deal with wireless hardware switch

$ cat /sys/bus/pci/drivers/ipw2200/0000:06:02.0/rf_kill

    
    
    
    This code has the following meaning:
    
      0 = RF kill not enabled (radio on)
      1 = SW based RF kill active (radio off)
      2 = HW based RF kill active (radio off)
      3 = Both HW and SW RF kill active (radio off)


To fix



	
  * sudo rmmod ipw2200

	
  * press hardware radio switch

	
  * sudo insmod /lib/modules/.../ipw2200.ko

	
  * cat /sys/.../rf_kill - should have a value of 0


