---
author: sonia
comments: true
date: 2009-03-14 01:16:48+00:00
slug: apt-cache-policy
title: apt-cache policy
wordpress_id: 304
categories:
- Linux
tags:
- Apt
- PalmPilot
- Ubuntu
---

It's years since I've dealt with apt-pinning, so all my knowledge on it has paged-out. But I want to use it again because I've backgraded to Ubuntu Gutsy to get my Palm Treo syncing, but I want a few new packages from Hardy or Intrepid. (It seems that Palm syncing using the visor module and JPilot [_still_ isn't working](https://bugs.launchpad.net/ubuntu/intrepid/+source/pilot-link/+bug/282491), due to an unfixed regression in the kernel. Or maybe I just didn't look hard enough. Bah - I dislike Hardy and Intrepid anyway).

Anyway, on my (ongoing) apt-pinning travels, I came across a good post on [Simple Pinning](http://shallowsky.com/blog/linux/install/pinning.html), and somewhere else read about a neat command I never knew about - **apt-cache policy** - it shows what apt thinks the current pinning levels are:

    
    Package files:
     100 /var/lib/dpkg/status
         release a=now
     500 http://au.archive.ubuntu.com gutsy-backports/universe Packages
         release v=7.10,o=Ubuntu,a=gutsy-backports,l=Ubuntu,c=universe
         origin au.archive.ubuntu.com
     500 http://au.archive.ubuntu.com gutsy-backports/multiverse Packages
         release v=7.10,o=Ubuntu,a=gutsy-backports,l=Ubuntu,c=multiverse
         origin au.archive.ubuntu.com
     500 http://au.archive.ubuntu.com gutsy-backports/main Packages
         release v=7.10,o=Ubuntu,a=gutsy-backports,l=Ubuntu,c=main
         origin au.archive.ubuntu.com
     500 http://au.archive.ubuntu.com gutsy-backports/restricted Packages
         release v=7.10,o=Ubuntu,a=gutsy-backports,l=Ubuntu,c=restricted
         origin au.archive.ubuntu.com
     500 http://au.archive.ubuntu.com gutsy-updates/universe Packages
         release v=7.10,o=Ubuntu,a=gutsy-updates,l=Ubuntu,c=universe
         origin au.archive.ubuntu.com
     500 http://au.archive.ubuntu.com gutsy-updates/restricted Packages
         release v=7.10,o=Ubuntu,a=gutsy-updates,l=Ubuntu,c=restricted
         origin au.archive.ubuntu.com
     500 http://au.archive.ubuntu.com gutsy-updates/main Packages
         release v=7.10,o=Ubuntu,a=gutsy-updates,l=Ubuntu,c=main
         origin au.archive.ubuntu.com
     500 http://au.archive.ubuntu.com gutsy/universe Packages
         release v=7.10,o=Ubuntu,a=gutsy,l=Ubuntu,c=universe
         origin au.archive.ubuntu.com
     500 http://au.archive.ubuntu.com gutsy/restricted Packages
         release v=7.10,o=Ubuntu,a=gutsy,l=Ubuntu,c=restricted
         origin au.archive.ubuntu.com
     500 http://au.archive.ubuntu.com gutsy/main Packages
         release v=7.10,o=Ubuntu,a=gutsy,l=Ubuntu,c=main
         origin au.archive.ubuntu.com
    Pinned packages:
         vinagre -> (not found)


Nice! Now, armed with this command I'll start tinkering with **/etc/apt/preferences** to get Hardy and Intrepid in with proper preferences. TODO: RTFM **man apt_preferences** :-)
