---
author: sonia
comments: true
date: 2007-05-16 04:43:05+00:00
slug: mac-osx-startup
title: Mac OSX Startup
wordpress_id: 55
categories:
- Other-Tech
tags:
- OSX
---

Some notes on the startup sequence for Mac OSX 10.4 (Tiger), and troubleshooting the startup process. These will be corrected/expanded as I learn more about the process...


### Links





	
  * ["The Boot Process", Developer Connection](http://developer.apple.com/documentation/MacOSX/Conceptual/BPSystemStartup/index.html)


<!-- more -->


### BootROM





	
  * POST (Power On Self Test) is done - checks hardware and initialises components; errors (eg RAM) will cause varying numbers of beeps (or flashing LEDs on some systems)

	
  * on PPC machines **Open Firmware** is run

	
  * on Intel machines **EFI** (Extended Firmware Interface) is run

	
  * **Command-Option-O-F** will start PPCs and Intels in Open Firmware Mode prompt. Five commands can be used: **mac-boot, shut-down, reset-all, reset-nvram, eject cd**




### BootX





	
  * BootX loads the kernel (similar to **Grub/LILO** in Linux, **ntldr** in Windows) as well as drivers needed to access I/O busses

	
  * various icons are displayed (Metallic Apple, Circle with Slash, Globe, etc) indicating whether Open Firmware has found BootX or had problems, or is looking for BootX over the network. See **KB 58042**

	
  * device drivers are loaded from a previously built cache, or from** System/Library/Extensions** if cache is missing/corrupt




### Kernel





	
  * the kernel file is **mach_kernel**

	
  * the kernel launches **I/O kit**, which loads drivers for I/O devices

	
  * the kernel launches launchd - similar to **init** in Linux




### launchd





	
  * **launchd** manages both _system_ and _user_ daemons, and is configured using plist (xml) files. It also replaces the functionality of **crond **on Linux systems ie it can be used to periodically launch daemons

	
  * these locations are searched:

	
    * **/System/Library/LaunchAgents**

	
    * **/System/Library/LaunchDaemons**

	
    * **/Library/LaunchDaemons**

	
    * **/Library/LaunchAgents**

	
    * **~/Library/LaunchAgents**




	
  * during **Safe Boot** (Shift key), only items in **/System/Library** are started

	
  * launchd then runs any scripts in **/etc/rc **- one of which is **SystemStarter **, which starts items in **/System/Library/StartupItems **and **/Library/StartupItems **(below)

	
  * launchd then starts **loginwindow**




### Startup Scripts, Startup Items





	
  * items here are being replaced by **launchd**

	
  * **/System/Library/StartupItems **- when troubleshooting, rename rather than delete things from here

	
  * **/Library/StartupItems **- can use this to for example manually map a drive. When troubleshooting, this should _usually_ be empty - move items to Desktop rather than deleting




### loginwindow




### User Environment Setup
