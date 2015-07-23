---
title: atheros wireless
author: Sonia Hamilton
date: 2006-02-24
url: /2006/02/23/atheros-wireless/
categories:
  - Other-Tech
tags:
  - Networking
  - Ubuntu
  - Wireless
---
atheros wireless
<!--more-->
  * install linux-restricted-modules-* 
  * edit /etc/network/interfaces 

<pre>auto ath0
  iface ath0 inet dhcp
  wireless_essid network_name
</pre>
