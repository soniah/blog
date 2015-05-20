---
author: sonia
comments: true
date: 2007-09-10 00:48:42+00:00
slug: usrsharefonts-failed-to-write-cache
title: '/usr/share/fonts: failed to write cache'
wordpress_id: 73
categories:
- Other-Tech
tags:
- Ubuntu
---

After doing a fresh install of Ubuntu 7.04 and installing all pending updates via Update Manager, I get an error that starts like this:
`
Setting up ttf-opensymbol (2.2.0-1ubuntu4) ...
Updating fontconfig cache...
/usr/share/fonts: failed to write cache
/usr/share/fonts/X11: failed to write cache
`<!-- more -->
I've had this occur on several machines, and the md5 on the .iso checks out ok, so it's a bug ([Bug 104553](https://bugs.launchpad.net/ubuntu/+source/fontconfig/+bug/104553), [Bug 122976](https://bugs.launchpad.net/ubuntu/+source/openoffice.org/+bug/122976)) caused by incorrect dates on the font cache.  There's a solution documented [here](http://ubuntuforums.org/showpost.php?p=2401087&postcount=4), but it needs a bit of fixing:
`
$ sudo bash
# wget -O folder_list.txt http://ubuntuforums.org/attachment.php?attachmentid=28956&d=1175696100
# cat folder_list.txt | xargs touch
# cd /usr/share/fonts/truetype
# for i in * ; do touch ${i}; done
# cd /var/lib/defoma/fontconfig.d
# for i in * ; do touch ${i}; done
# apt-get dist-upgrade
`
Another post suggests this simpler solution:
`
$ sudo bash
# find /usr/share/fonts /usr/local/share/fonts /var/lib/defoma/fontconfig.d -type d -print0 | xargs --null touch
`
