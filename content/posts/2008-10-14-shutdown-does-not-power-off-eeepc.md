---
title: Shutdown does not power off EeePC
author: Sonia Hamilton
date: 2008-10-13
url: /2008/10/14/shutdown-does-not-power-off-eeepc/
categories:
  - Linux
tags:
  - EeePC
  - Ubuntu
---
I've noticed that issuing a **sudo halt** on my [EeePC 701][1] shuts down the operating system ([eeeXubuntu][2]), but doesn't power down the system.

<!--more-->

So I'd be watching videos on my way home from work, sudo halt, get home, and pull a red-hot E out of my bag -- ouch!

**Solution** ([Bug #239145][3]) -- add **rmmod snd-hda-intel** to the stop section of **/etc/init.d/halt**.

 [1]: http://www.asus.com/news_show.aspx?id=7317
 [2]: http://www.eeeuser.com/
 [3]: https://bugs.launchpad.net/ubuntu-eee/+bug/239145
