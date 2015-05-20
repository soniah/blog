---
author: sonia
comments: true
date: 2008-12-19 05:50:25+00:00
slug: udev-hal-dbus
title: udev, HAL, DBUS
wordpress_id: 203
categories:
- Linux
tags:
- Networking
---

A good post from Glen Turner on SLUG about udev, HAL, DBUS (in the context of GSM modems):

    
     - you insert the device
     - UDEV tells HAL that it has been inserted
     - HAL looks up a XML-based "information" file. These are where the
       rubber hits the road.  The system files are in
         /usr/share/hal/fdi/
       and any files you may write go into
         /etc/hal/fdi/
     - HAL determines from the USB vendor/model codes it was handed
       that you've got a GSM modem. The policy files contain related
       details like which USB Serial port to use for PPP, what dialing
       algorithm to use, etc.
     - HAL pumps these details to NetworkManager, probably via DBUS
     - NetworkManager daemon chats with the NetworkManager applet to
       grab other data, such as PIN numbers
     - NetworkManager kicks off PPP using the combined information
       from HAL and the NM applet.
