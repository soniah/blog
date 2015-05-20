---
title: ssh – DISPLAY is not set – Failed to allocate internet-domain X11 display socket
author: Sonia Hamilton
date: 2011-11-06
url: /2011/11/06/ssh-display-is-not-set-failed-to-allocate-internet-domain-x11-display-socket/
jabber_published:
  - 1320574480
categories:
  - Linux
tags:
  - Ssh
  - Ubuntu
---
A little ssh error I came across while trying to work remotely on an Ubuntu machine. [ssh X Display Forwarding][1] wasn&#8217;t working, and I was getting an error:

<pre>DISPLAY is not set</pre>

Digging through /var/log/auth.log, I also noticed this error:

<pre>Failed to allocate internet-domain X11 display socket</pre>

After much Googling, it seems that IPv6 was causing the problem. It was solved by adding:

<pre>AddressFamily inet</pre>

to **/etc/ssh/sshd_config**, and restarting the ssh server.

 [1]: http://tldp.org/HOWTO/XDMCP-HOWTO/ssh.html
