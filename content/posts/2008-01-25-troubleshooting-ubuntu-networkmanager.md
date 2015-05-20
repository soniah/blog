---
author: sonia
comments: true
date: 2008-01-25 20:12:15+00:00
slug: troubleshooting-ubuntu-networkmanager
title: Troubleshooting Ubuntu NetworkManager
wordpress_id: 111
categories:
- Other-Tech
tags:
- Ubuntu
- Wireless
---

NetworkManager: "When I'm good, I'm _really really_ good. But when I'm bad...". Some tricks I've found for troubleshooting NetworkManager:



	
  * no network interfaces (except for lo) should be listed in **/etc/network/interfaces**. Any that are _won't_ be managed by NetworkManager

	
  * remove old wireless configuration information by running **gconf-editor &**, and removing them from **/system/networking/wireless/networks**. Or, from the shell run this command to unset all at once: **gconftool-2 --recursive-unset /system/networking/wireless/networks**.


Some useful links:

	
  * help.ubuntu.com: [Advanced Network Troubleshooting in GConf](https://help.ubuntu.com/community/WifiDocs/NetworkManager#head-d2b310228dc887b6cddf4465b6a53cdc4dc9be28)


