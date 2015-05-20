---
author: sonia
comments: true
date: 2011-07-06 03:52:01+00:00
slug: clustering-setup
title: Clustering setup
wordpress_id: 1071
categories:
- Other-Tech
tags:
- Clustering
- Slug
---

A nice [post](http://lists.slug.org.au/archives/slug/2011/06/msg00014.html) from Jake on the SLUG list where he asks about a small clustering setup:


I'm setting up some new hardware for a client of mine. Basically 2 new [Dell PowerEdge R210 IIs](http://www.dell.com/au/business/p/poweredge-r210-2/pd) - nice and small and they seem quiet enough for an office (unlike the original R210). Anyway, quad core xeon, 2x 1Tb 7200RPM drives, 8gb ram (~$1500 each btw). The machines will be used as VM hosts ([kvm](http://www.linux-kvm.org/page/Main_Page)) for a handfull of guests, file/domain server ([ebox](http://www.zentyal.org/)), PBX ([piaf](http://pbxinaflash.net/)), mail server web server, "magic windows only application" server etc. As the guests run everything in the ofice some kind of HA is needed.




I'm thinking [ganeti](http://code.google.com/p/ganeti/) is the way to manage it all as it takes care of [DRBD](http://www.drbd.org/) and failover giving me a nice HA-ish setup without too much work.




The questions. How should I setup my disks?




I'm tossing up between, (all the below assume a small raid 1 partition for /, this is for the storage pool) RAID 1 with mdadm giving me 1 disk read speed but the ability to read 2 streams. RAID 1 with mdadm and fancyness giving me 2x read speed for a single stream, but normal behaviour for multiple streams and 1x write.




RAID 0 with mdadm 2x read, 2x write and trust DRBD to look after my data ;->




no RAID, set up as 2 separate drives use DRBD to look after data and get "more spindles" into the mix (so say file server lives on one disk and mail server on another)




What deb based distro should I use for my host (or present a *really* compelling argument for something else)? I would use ubuntu as i'm most familiar with it but the recent debacle with unity has really hurt my confidence with them.




Should i go to debian and if so which version?




Networking
each server has 2 gbit ports on it.
should I
team the nics, then run a vlan for drbd and another for regular coms
dedicated nic for drbd and one for general coms.




Any other suggestions or gotchas to look out for?




I have my own answers to these questions, but I'd really like to hear any advice from the crowd (its like "the cloud" but open source and P2P ;->)
