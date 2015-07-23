---
author: sonia
date: 2012-11-22
url: /2012/11/22/network-access-with-exetel-hspa-and-antenna/
title: Network access with Exetel HSPA and Antenna
categories:
- Linux
tags:
- Ubuntu
- Wireless
---

I got a Huawei HSPA E1762 USB stick a few months ago for 3G network access, together with [Exetel's $5/month Zero Gig plan](http://www.exetel.com.au/residential-hspa-pricing.php) (uses the Optus network). Great for when I'm out and about and can't find a wireless signal to jump onto, or I'm at some client who doesn't allow laptops onto their network.

<!--more-->

**Update November 2012**

On Ubuntu Precise (12.04.1) mobile broadband now "just works". Plug in the device, right click on Network Manager, follow the configuration wizard for "New Mobile Connection", choose your provider (eg Exetel) and the correct APN will be filled in (exetel1).


**Original Article 2009
**

I got a Huawei HSPA E1762 USB stick a few months ago for 3G network access, together with [Exetel's $5/month Zero Gig plan](http://www.exetel.com.au/residential-hspa-pricing.php) (uses the Optus network). Great for when I'm out and about and can't find a wireless signal to jump onto, or I'm at some client who doesn't allow laptops onto their network. I've been using it regularly and still haven't gone over about 100M usage, so it's worked out to be very cheap.

Using Network Manager on Ubuntu Jaunty it mostly "just works" - all I needed to do was set the APN to 'exetel1'. I've also bought an antenna for it from [The Antenna Shop](http://www.antennashop.com.au/home.html) - gives me better coverage in shadows in the CBD and out in the country. There's also other bigger antennas available, as well as car antennas.

[caption id="attachment_600" align="alignnone" width="372"]![antenna](http://blog2.snowfrog.net/wp-content/uploads/2009/11/antenna.jpg) antenna[/caption]

All-in-all a good buy - thanks Dean for the tip.

**Addendum**

As per Matt's comment below, Huawei modems currently have problems on Ubuntu Karmic - [Problem with Huawei E1762 Mobile Broadband in Karmic](http://ubuntuforums.org/showthread.php?t=1311021), [Bug #413989](https://bugs.launchpad.net/network-manager/+bug/413989), [Bug # 446146](https://bugs.launchpad.net/ubuntu/+source/linux/+bug/446146).

Also, if you're ever prompted to enter an "SP CODE" (ie Mac & Windows), enter "BROADBAND"
