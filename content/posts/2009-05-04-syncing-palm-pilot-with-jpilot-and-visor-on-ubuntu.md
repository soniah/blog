---
author: sonia
comments: true
date: 2009-05-04 06:24:48+00:00
slug: syncing-palm-pilot-with-jpilot-and-visor-on-ubuntu
title: Syncing Palm Pilot with JPilot and visor on Ubuntu
wordpress_id: 34
categories:
- Linux
tags:
- PalmPilot
- Ubuntu
---

(Updated May/09 for Ubuntu 8.10/Ibex): for a long time I couldn't get JPilot syncing with my Palm Pilot on Ubuntu 8.04 and 8.10. Turns out I wasn't reading my own instructions... here's the cleaned up version:



	
  * load visor module **sudo modprobe visor** and check loaded **lsmod | grep visor**

	
  * add visor module to **/etc/modules**

	
  * click sync button on Palm Pilot and check USB devices are being created:

	
    * in one terminal, **tail -f /var/log/syslog /var/log/messages**

	
    * in a second terminal, check the ownership of links **ls -al /dev/ttyUSB*** and check you are a member of the appropriate group (usually dialout) **grep dialout /etc/group**




	
  * **sudo aptitude install jpilot** and start JPilot

	
  * _read this step carefully:_ no need to change the Serial Port setting in Preferences - JPilot will pick up the correct one on the first sync (which is now unexpectedly _Other_ rather than _/dev/ttyUSBO_ or _usb:_)

	
  * _read this step carefully:_ from jpilot **File > Install User**, click sync button on Palm Pilot, count to 5, then click **Install User** button in JPilot dialog box

	
  * click sync button on Palm Pilot, count to 5, then click **Sync** in JPilot

	
  * if syncing isn't working (especially on a machine that's been upgraded from an older version of Ubuntu), try closing JPilot, **mv .jpilot .jpilot.bak**, restarting JPilot, then doing the **Install User** steps again




### See also:





	
  * (totally off-topic): [HOWTO: Import iCalendar (ics) Appointments Into JPilot](http://www.computechgroup.com/?p=381)

	
  * some pages mention installing pilot-link - this isn't required

	
  * some pages mention modifying files in**/etc/udev/rules.d** - this no longer seems required


[http://www.linuxquestions.org/questions/showthread.php?t=79965](http://www.linuxquestions.org/questions/showthread.php?t=79965)

[http://ask.slashdot.org/article.pl?sid=05/05/13/0234225](http://ask.slashdot.org/article.pl?sid=05/05/13/0234225)

[http://www.linuxmuse.com/articles.php?action=printerf&article=29](http://www.linuxmuse.com/articles.php?action=printerf&article=29)

[http://www.linuxquestions.org/questions/showthread.php?t=177780](http://www.linuxquestions.org/questions/showthread.php?t=177780)

[http://www.linuxquestions.org/questions/showthread.php?t=221854](http://www.linuxquestions.org/questions/showthread.php?t=221854)

[http://www.rockhopper.dk/linux/hardware/pda.html#chap5_sect1](http://www.rockhopper.dk/linux/hardware/pda.html#chap5_sect1)

[http://archives.mandrivalinux.com/expert/2003-02/msg02508.php](http://archives.mandrivalinux.com/expert/2003-02/msg02508.php)

[http://www.faqs.org/docs/Linux-HOWTO/PalmOS-HOWTO.html#PC-CONNECT-USB](http://www.faqs.org/docs/Linux-HOWTO/PalmOS-HOWTO.html#PC-CONNECT-USB)

[http://pilot-link.org/README.usb](http://pilot-link.org/README.usb)

[Carsten Clasohm's Blog : USB Palm and Fedora Core 3](http://www.clasohm.com/blog/one-entry?entry%5fid=12096)

[Writing udev rules by Daniel Drake](http://www.reactivated.net/writing_udev_rules.html)

[Linux Magazine - The Linux Device Model](http://www.linux-mag.com/id/2617)
