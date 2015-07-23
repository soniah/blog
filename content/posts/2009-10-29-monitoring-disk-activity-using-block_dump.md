---
title: Monitoring disk activity using block_dump
author: Sonia Hamilton
date: 2009-10-29
url: /2009/10/29/monitoring-disk-activity-using-block_dump/
categories:
  - Other-Tech
tags:
  - Monitoring
---
A couple of good links [[1][1]][[2][2]] came up on the [Axxs collective][3] email list about monitoring disk activity under Linux using block_dump.

<!--more-->

In a nutshell:

<pre>kern.debug setup in syslog.conf (it often is; if sync is used disk activity will obviously be greater)

echo 1 &gt;/proc/sys/vm/block_dump
wait n seconds
echo 0 &gt;/proc/sys/vm/block_dump

Do various grep'ing on /var/log/debug for READ, WRITE, inode, block, etc
</pre>

Thanks to Andrew Mc & Torrance.

 [1]: http://ubuntuforums.org/archive/index.php/t-369759.html
 [2]: http://sprocket.io/blog/2006/05/monitoring-filesystem-activity-under-linux-with-block_dump/
 [3]: http://axxs.org/
