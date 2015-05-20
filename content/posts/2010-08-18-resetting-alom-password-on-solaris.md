---
author: sonia
comments: true
date: 2010-08-18 08:11:14+00:00
slug: resetting-alom-password-on-solaris
title: Resetting ALOM password on Solaris
wordpress_id: 732
categories:
- Other-Tech
tags:
- Solaris
---

Or, after RTFM'ing, an easier way: [SunDocs Recovering ALOM passwords](http://docs.sun.com/source/819-6672-10/trouble_appx.html#53290):



	
  * connect to serial console, remove power cords, wait a few seconds

	
  * plugin, press escape repeatedly until it drops to the "ALOM <esc> menu"

	
  * e to erase ALOM NVRAM (will return everything to defaults)

	
  * r to return to boot process

	
  * machine will then reboot, drop into ALOM prompt as admin with no password


~ ~ ~

Some notes on how to reset the ALOM password on Solaris (done on a VT240).

**ALOM** has sc> prompt. Get to OBP using "console -f"

**OBP** (Open Boot Prompt) has ok prompt. Get to ALOM using "#."

**Power switch** has 4 positions: Normal (|), Locked (padlock), Diagnostics (wave), Forced Off (circle-bar). Ensure powerswitch is in Normal position.

Replace disks with disks from another system that has a known password, then boot. (Also, try a boot cd). At root prompt:

    
    <tt># cd /usr/platform/`uname -i`/sbin
    # ./scadm userpassword admin         (set to default ie sun123)
    # #.                                 (return to ALOM)
    sc>resetsc
    sc>poweroff -f</tt>


Remove power cords, return old hard disks, turn back on. These last steps aren't necessary, but it's good to check that the ALOM password has indeed been reset.

Some good links:



	
  * [Softpanorama](http://www.softpanorama.org/Solaris/Startup_and_shutdown/serial_console_on_solaris.shtml)

	
  * [Sun Docs, Common ALOM Tasks](http://docs.sun.com/source/819-6672-10/common_tasks.html)

	
  * [Tek-tips, reset V240 ALOM](http://www.tek-tips.com/viewthread.cfm?qid=1455772&page=1)


