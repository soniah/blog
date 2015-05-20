---
title: network monitoring tools
author: Sonia Hamilton
date: 2008-03-21
url: /2008/03/21/network-monitoring-tools/
categories:
  - Linux
tags:
  - Networking
---
(27-July-2007) A list of useful tools for network monitoring on Linux:

  * **iptraf** &#8211; console tool with updating display
  * **tcpdump**
  * **trafshow**
  * **ngrep** &#8211; good for getting user agent strings in HTTP headers
  * **ntop** &#8211; though has been reported as unstable over longer periods
  * **ethereal** for protocal analysis
  * **ettercap** for arp cache spoofing &#8211; force traffic to come via your machine for analysis

Thanks to Andy and AndrewMc for these pointers.

(21-Mar-2008) Here are some more tools I&#8217;ve come across since then, some for network troubleshooting, some for general troubleshooting:

  * **mrt** &#8211; an ncurses program that combines the functionality of the &#8216;traceroute&#8217; and &#8216;ping&#8217; programs in a single network diagnostic tool
  * **sysstat** package &#8211; contains sar, iostat, mpstat, sadf and sa. The **sar** command collects and reports system activity information. The **iostat** command reports CPU utilization and I/O statistics for disks. The **mpstat** command reports global and per-processor statistics. The **sadf** command is used to display data collected by sar in various formats
  * **lsof** &#8211; list open files/sockets/etc for a process
  * **inotify-tools** &#8211; can be used to programatically monitor and act upon filesystem events