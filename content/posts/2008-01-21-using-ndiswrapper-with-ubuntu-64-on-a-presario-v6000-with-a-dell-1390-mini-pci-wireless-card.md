---
title: Using ndiswrapper with Ubuntu 64 on a Presario V6000 with a Dell 1390 mini-PCI wireless card
author: Sonia Hamilton
date: 2008-01-21
url: /2008/01/21/using-ndiswrapper-with-ubuntu-64-on-a-presario-v6000-with-a-dell-1390-mini-pci-wireless-card/
categories:
  - Other-Tech
tags:
  - Ubuntu
  - Wireless
---
My first *task* in Guatemala was to get Jesus's wireless going.

<!--more-->

He's running Ubuntu Feisty 64 on a Compaq Presario V6000 (AMD Turion 64 x2). The wireless card is a *Dell 1390 mini-PCI* (wireless chipset bcm43xx).

Inspired by [these instructions][1] for Ultima Linux, I did the following as root:<!--more-->

  * installed ndiswrapper and ndisgtk -- **aptitude install ndiswrapper-common ndisgtk**
  * blacklisted the built-in bcm43xx driver, by adding **blacklist bcm43xx** to **/etc/modprobe.d/blacklist**
  * manually loaded the ndiswrapper module by doing **modprobe ndiswrapper** and forced it to load on every boot by adding the line ndiswrapper to **/etc/modules**
  * downloaded the Dell version of the driver (R174291.exe) [[1] ][2][[2]][3] and unpacked the .exe using wine
  * reloaded the gnome panel -- **killall gnome-panel**
  * ran System, Administration, Windows Wireless Drivers, and loaded the extracted driver from **~/.wine/drive_c/dell/drivers/R174291**
  * after a reboot :-( Network Manager (top right) detected wireless networks, and we were able to connect. If you have any problems, check the driver has loaded by running ndiswrapper -l

 [1]: http://www.ultimalinux.com/wiki/Compaq_Presario_V6000
 [2]: http://forum.notebookreview.com/showthread.php?t=200248
 [3]: http://ftp.us.dell.com/network/R174291.exe
