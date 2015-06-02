---
title: Resetting ALOM password on Solaris
author: Sonia Hamilton
date: 2010-08-18
url: /2010/08/18/resetting-alom-password-on-solaris/
categories:
  - Other-Tech
tags:
  - Solaris
---
Or, after RTFM'ing, an easier way: [SunDocs Recovering ALOM passwords][1]:

<!--more-->

  * connect to serial console, remove power cords, wait a few seconds
  * plugin, press escape repeatedly until it drops to the &#8220;ALOM <esc> menu&#8221;
  * e to erase ALOM NVRAM (will return everything to defaults)
  * r to return to boot process
  * machine will then reboot, drop into ALOM prompt as admin with no password

~ ~ ~

Some notes on how to reset the ALOM password on Solaris (done on a VT240).

**ALOM** has sc> prompt. Get to OBP using &#8220;console -f&#8221;

**OBP** (Open Boot Prompt) has ok prompt. Get to ALOM using &#8220;#.&#8221;

**Power switch** has 4 positions: Normal (|), Locked (padlock), Diagnostics (wave), Forced Off (circle-bar). Ensure powerswitch is in Normal position.

Replace disks with disks from another system that has a known password, then boot. (Also, try a boot cd). At root prompt:

<pre><tt># cd /usr/platform/`uname -i`/sbin
# ./scadm userpassword admin         (set to default ie sun123)
# #.                                 (return to ALOM)
sc&gt;resetsc
sc&gt;poweroff -f</tt></pre>

Remove power cords, return old hard disks, turn back on. These last steps aren't necessary, but it's good to check that the ALOM password has indeed been reset.

Some good links:

  * [Softpanorama][2]
  * [Sun Docs, Common ALOM Tasks][3]
  * [Tek-tips, reset V240 ALOM][4]

 [1]: http://docs.sun.com/source/819-6672-10/trouble_appx.html#53290
 [2]: http://www.softpanorama.org/Solaris/Startup_and_shutdown/serial_console_on_solaris.shtml
 [3]: http://docs.sun.com/source/819-6672-10/common_tasks.html
 [4]: http://www.tek-tips.com/viewthread.cfm?qid=1455772&page=1
