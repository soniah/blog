---
title: The RAID5 Write Hole
author: Sonia Hamilton
date: 2011-01-14
url: /2011/01/14/the-raid5-write-hole/
categories:
  - Other-Tech
tags:
  - High Availability
  - Solaris
  - SQL
---
The latest edition of the venerable [UNIX and Linux System Administration Handbook][1] (Nemeth et al) has a good section discussing the &#8220;RAID5 Write Hole&#8221;:


<!--more-->

*Finally, RAID 5 is vulnerable to corruption in certain circumstances. Its incremental updating of parity data is more efficient than reading the entire stripe and recalculating the stripe’s parity based on the original data. On the other hand, it means that at no point is parity data ever validated or recalculated. If any block in a stripe should fall out of sync with the parity block, that fact will never become evident in normal use; reads of the data blocks will still return the correct data.*

***Only when a disk fails does the problem become apparent. The parity block will likely have been rewritten many times since the occurrence of the original desynchronization. Therefore, the reconstructed data block on the replacement disk will consist of essentially random data.*

Further reading on the [BAARF][2] archive (Battle Against Any Raid 5), including why RAID10 and RAID3 should be chosen over RAID5. And then there's [ZFS and RAID-Z][3].

 [1]: http://www.amazon.com/UNIX-Linux-System-Administration-Handbook/dp/0131480057/ref=sr_1_1?s=books&ie=UTF8&qid=1294981909&sr=1-1
 [2]: http://www.miracleas.com/BAARF/BAARF2.html
 [3]: http://blogs.sun.com/bonwick/entry/raid_z
