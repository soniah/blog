---
author: sonia
comments: true
date: 2006-02-24 03:36:52+00:00
slug: atheros-wireless
title: atheros wireless
wordpress_id: 19
categories:
- Other-Tech
tags:
- Networking
- Ubuntu
- Wireless
---



  * install linux-restricted-modules-*

  * edit /etc/network/interfaces



    
    
    
    auto ath0
      iface ath0 inet dhcp
      wireless_essid network_name
    
