---
author: sonia
comments: true
date: 2011-07-14 04:09:30+00:00
slug: ssh-sudo-tty-shell
title: ssh, sudo, tty, shell
wordpress_id: 1077
categories:
- Other-Tech
tags:
- Shell
---

A nice little script snippet I like to remember for automating quick stuff across multiple hosts. **-t** forces tty (so sudo will work); **-q** quiet - disable banners; **-c** script ("command") to su. Presumes sudo doesn't prompt for a password; otherwise, see [Expect](http://www.nist.gov/el/msid/expect.cfm) and [Exploring Expect](http://oreilly.com/catalog/9781565920903) :-)

    
    for h in $hosts ; do
      echo -e "nnhost: $hn------------------------------------"
      ssh -t -q $h "sudo su - -c "magic_stuff" "
    done
