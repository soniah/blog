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

The native firewall that comes with Solaris is &#8220;ipf&#8221;.

Configuration files are in the directory /etc/ipf and the file is &#8220;ipf.conf&#8221;, NAT rules in &#8220;ipnat.conf&#8221;. Unlike iptables, where the configuration file is a series of &#8220;iptable&#8221; commands, &#8220;ipf.conf&#8221; is purely a configuration file. Traffiic must be enabled on each interface, so you have &#8220;pass in&#8221; to allow traffic in on interface A and a &#8220;pass out&#8221; to allow traffic out on interface B, if it is acting as a firewall, obviously this is not.

As of Solaris 10, processes are started via service manager. To check if ipf is running, you can:

\# svcs -a |grep ipf  
online May_05 svc:/network/ipfilter:default

&#8220;online&#8221; status tells you that it is running.

Commands to see what is happening.

&#8220;ipfstat&#8221;: show statistics, bytes in, bytes out etc.

&#8220;ipfstat -i&#8221; to display input running rule set

&#8220;ipfstat -o&#8221; to display output running rule set

&#8220;ipf -f /etc/ipf/ipf.conf&#8221; to load rules from config file.

&#8220;ipmon -s [file]&#8221; to have ipf log to &#8220;file&#8221;

To restart using service manager

&#8220;svcadm restart svc:/network/ipfilter:default&#8221;

See man page for &#8220;ipnat&#8221; for options to display NAT options.

Link from Rusty&#8217;s blog: http://ozlabs.org/~rusty/index.cgi/2006/08/15

Last word: Solaris&#8217;s version of tcpdump is &#8220;snoop&#8221;. So to monitor traffic: &#8220;snoop -d e1000g0 not port 22&#8243; you can add &#8220;-v&#8221; etc.
