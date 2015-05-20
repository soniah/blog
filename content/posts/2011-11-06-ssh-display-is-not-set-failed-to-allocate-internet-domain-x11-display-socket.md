---
author: sonia
comments: true
date: 2011-11-06 10:14:40+00:00
slug: ssh-display-is-not-set-failed-to-allocate-internet-domain-x11-display-socket
title: ssh - DISPLAY is not set - Failed to allocate internet-domain X11 display socket
wordpress_id: 1216
categories:
- Linux
tags:
- Ssh
- Ubuntu
---

A little ssh error I came across while trying to work remotely on an Ubuntu machine. [ssh X Display Forwarding](http://tldp.org/HOWTO/XDMCP-HOWTO/ssh.html) wasn't working, and I was getting an error:

    
    DISPLAY is not set


Digging through /var/log/auth.log, I also noticed this error:

    
    Failed to allocate internet-domain X11 display socket


After much Googling, it seems that IPv6 was causing the problem. It was solved by adding:

    
    AddressFamily inet


to **/etc/ssh/sshd_config**, and restarting the ssh server.
