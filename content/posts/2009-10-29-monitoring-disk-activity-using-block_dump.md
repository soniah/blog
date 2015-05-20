---
author: sonia
comments: true
date: 2009-10-29 01:52:16+00:00
slug: monitoring-disk-activity-using-block_dump
title: Monitoring disk activity using block_dump
wordpress_id: 594
categories:
- Other-Tech
tags:
- Monitoring
---

A couple of good links [[1](http://ubuntuforums.org/archive/index.php/t-369759.html)][[2](http://sprocket.io/blog/2006/05/monitoring-filesystem-activity-under-linux-with-block_dump/)] came up on the [Axxs collective](http://axxs.org/) email list about monitoring disk activity under Linux using block_dump.

In a nutshell:

    
    kern.debug setup in syslog.conf (it often is; if sync is used disk activity will obviously be greater)
    
    echo 1 >/proc/sys/vm/block_dump
    wait n seconds
    echo 0 >/proc/sys/vm/block_dump
    
    Do various grep'ing on /var/log/debug for READ, WRITE, inode, block, etc
    


Thanks to Andrew Mc & Torrance.
