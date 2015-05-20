---
title: Ubuntu Linux Compaq nc4200 ipw2200 blue LED
author: Sonia Hamilton
date: 2008-01-16
url: /2008/01/16/ubuntu-linux-compaq-nc4200-ipw2200-blue-led/
categories:
  - Other-Tech
tags:
  - nc4200
  - Ubuntu
  - Wireless
---
A couple of notes on working with the ipw2200 wireless card on a Compaq nc4200 running Ubuntu (7.04 and 7.10), including how to get the blue LED to work:<!--more-->

  * check the module has been loaded: **lsmod | grep ipw** &#8211; should display ipw2200
  * check for any errors on boot, especially &#8216;radio off': **dmesg | grep ipw**
  * also check if radio is off via **iwconfig eth1**
  * remember to turn the radio on via the small hardware switch on the left side (just past the usb slot)
  * get the blue status LED to display by creating a file called **/etc/modprobe.d/ipw2200 **with contents **options ipw2200 led=1** (the blue LED will then display after a reboot)

Notes taken from Ubuntu Forums, &#8220;[Compaq nc4200 ipw2200 wireless card is off][1]&#8220;.

 [1]: http://ubuntuforums.org/showthread.php?t=360735
