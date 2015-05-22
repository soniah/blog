---
title: Troubleshooting Ubuntu NetworkManager
author: Sonia Hamilton
date: 2008-01-25
url: /2008/01/25/troubleshooting-ubuntu-networkmanager/
categories:
  - Other-Tech
tags:
  - Ubuntu
  - Wireless
---
NetworkManager: &#8220;When I&#8217;m good, I&#8217;m *really really* good. But when I&#8217;m bad&#8230;&#8221;. Some tricks I&#8217;ve found for troubleshooting NetworkManager:

<!--more-->

  * no network interfaces (except for lo) should be listed in **/etc/network/interfaces**. Any that are *won&#8217;t* be managed by NetworkManager
  * remove old wireless configuration information by running **gconf-editor &**, and removing them from **/system/networking/wireless/networks**. Or, from the shell run this command to unset all at once: **gconftool-2 &#8211;recursive-unset /system/networking/wireless/networks**.

Some useful links:

  * help.ubuntu.com: [Advanced Network Troubleshooting in GConf][1]

 [1]: https://help.ubuntu.com/community/WifiDocs/NetworkManager#head-d2b310228dc887b6cddf4465b6a53cdc4dc9be28
