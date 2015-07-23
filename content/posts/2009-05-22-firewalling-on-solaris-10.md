---
title: Firewalling on Solaris 10
author: Sonia Hamilton
date: 2009-05-22
url: /2009/05/22/firewalling-on-solaris-10/
categories:
  - Other-Tech
tags:
  - Iptables
  - Solaris
---
Firewalling on Solaris 10:

<!--more-->

  * config file: /etc/ipf/ipf.conf
  * flush all rules: ipf -Fa
  * reload: ipf -f /etc/ipf/ipf.conf

**Email from Julian:**

The native firewall that comes with Solaris is "ipf".

Configuration files are in the directory /etc/ipf and the file is "ipf.conf", NAT rules in "ipnat.conf". Unlike iptables, where the configuration file is a series of "iptable" commands, "ipf.conf" is purely a configuration file. Traffiic must be enabled on each interface, so you have "pass in" to allow traffic in on interface A and a "pass out" to allow traffic out on interface B, if it is acting as a firewall, obviously this is not.

As of Solaris 10, processes are started via service manager. To check if ipf is running, you can:

\# svcs -a |grep ipf  
online May_05 svc:/network/ipfilter:default

"online" status tells you that it is running.

Commands to see what is happening.

"ipfstat": show statistics, bytes in, bytes out etc.

"ipfstat -i" to display input running rule set

"ipfstat -o" to display output running rule set

"ipf -f /etc/ipf/ipf.conf" to load rules from config file.

"ipmon -s [file]" to have ipf log to "file"

To restart using service manager

"svcadm restart svc:/network/ipfilter:default"

See man page for "ipnat" for options to display NAT options.

Link from Rusty's blog: http://ozlabs.org/~rusty/index.cgi/2006/08/15

Last word: Solaris's version of tcpdump is "snoop". So to monitor traffic: "snoop -d e1000g0 not port 22" you can add "-v" etc.
