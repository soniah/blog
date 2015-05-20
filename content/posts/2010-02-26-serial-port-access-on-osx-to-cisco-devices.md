---
author: sonia
comments: true
date: 2010-02-26 00:28:24+00:00
slug: serial-port-access-on-osx-to-cisco-devices
title: Serial Port Access on OSX to Cisco devices
wordpress_id: 660
categories:
- Other-Tech
tags:
- Cisco
- Gnu Screen
- OSX
- Solaris
---

How to connect to a Cisco device (or other serial devices) using OSX and a USB to Serial converter (eg ATEN). Googling, everyone says to use zterm, but I couldn't get it to work (and zterm looks and feels like a toy).

This probably isn't the "Mac way" of doing things, but </whatever>...

Install [PL2303 USB to Serial Driver for Mac OS X](http://sourceforge.net/projects/osx-pl2303/), restart :-(

    
    sudo port selfupdate
    sudo port upgrade outdated
    sudo port install minicom


Work out tty of USB-Serial converter:

    
    ls /dev/tty* > pre


Plug in USB-Serial converter.

    
    ls /dev/tty* > pst
    % diff pre pst
    3a4
    > /dev/tty.PL2303-00002006


Link up to make life easier:

    
    cd /dev
    sudo ln -s tty.PL2303-00002006 ttyusb


Setup minicom, and use colour:

    
    sudo minicom -s -c on


Setup defaults to:



	
  * /dev/ttyusb (ctrl-A, O, Serial Port Setup)

	
  * 8N1

	
  * 9600

	
  * no hardware or software flow control

	
  * init string empty (so garbage doesn't appear on screen when you connect) - ctrl-A, O, Init string

	
  * save settings as default (ctrl-A, O, Save setup as dfl)


Always use colour:

	
  * add export MINICOM="-c on" to shell rc file (~/.bashrc, .~/zshrc, etc)


Connect (sudo minicom), hit enter a few times, and you should be on the device.
