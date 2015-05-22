---
title: Troubleshooting Linux HA (High Availability)
author: Sonia Hamilton
date: 2009-02-25
url: /2009/02/25/troubleshooting-linux-ha-high-availability/
categories:
  - Other-Tech
tags:
  - High Availability
---
When Linux HA (High Availability) is setup, each machine will have a physical address, and one machine should also have the virtual address.

<!--more-->

This can be checked via **ip addr**:

<pre>machine 1
2: eth0: &lt;BROADCAST,MULTICAST,UP&gt; mtu 1500 qdisc pfifo_fast qlen 1000
    link/ether 00:09:3d:12:af:77 brd ff:ff:ff:ff:ff:ff
    inet 999.99.133.12/23 brd 211.29.133.255 scope global eth0

machine 2
2: eth0: &lt;BROADCAST,MULTICAST,UP&gt; mtu 1500 qdisc pfifo_fast qlen 1000
    link/ether 00:09:3d:12:ba:ef brd ff:ff:ff:ff:ff:ff
    inet 999.99.133.13/23 brd 211.29.133.255 scope global eth0
    inet 999.99.133.19/23 brd 211.29.133.255 scope global secondary eth0:1</pre>

If this isn&#8217;t the case, do a **hb_takeover** on the appropriate machine (depending on the status of the underlying application). Eg **/usr/lib64/heartbeat/hb_takeover**
