---
author: sonia
comments: true
date: 2008-10-13 23:13:43+00:00
slug: shutdown-does-not-power-off-eeepc
title: Shutdown does not power off EeePC
wordpress_id: 174
categories:
- Linux
tags:
- EeePC
- Ubuntu
---

I've noticed that issuing a **sudo halt** on my [EeePC 701](http://www.asus.com/news_show.aspx?id=7317) shuts down the operating system ([eeeXubuntu](http://www.eeeuser.com/)), but doesn't power down the system. So I'd be watching videos on my way home from work, sudo halt, get home, and pull a red-hot E out of my bag - ouch!

**Solution** ([Bug #239145](https://bugs.launchpad.net/ubuntu-eee/+bug/239145)) - add **rmmod snd-hda-intel** to the stop section of **/etc/init.d/halt**.
