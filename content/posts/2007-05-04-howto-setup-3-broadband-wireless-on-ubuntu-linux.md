---
title: HowTo Setup 3 Broadband Wireless on Ubuntu Linux
author: Sonia Hamilton
date: 2007-05-05
url: /2007/05/04/howto-setup-3-broadband-wireless-on-ubuntu-linux/
categories:
  - Linux
tags:
  - Networking
  - Ubuntu
  - Wireless
---
**HOWTO setup Novatel Merlin XU870 for 3&#8217;s wireless broadband, on Ubuntu Linux  
**

I&#8217;ve recently bought a wireless broadband modem from 3, which I&#8217;m really happy with &#8211; good speed, reliable, and fairly cheap ($AU50/month for 1G). Here are some instructions on how to get it working on Ubuntu Linux.

Compile the *Airprime* drivers into your kernel, using the instructions at [samat.org][1], or upgrade/install Ubuntu Feisty (7.04) or later &#8211; the drivers are included in the kernel. If you upgrade, check that your kernel has beenupgraded to 2.6.20 or later:  
<!--more-->

  
` $ uname -r<br />
2.6.20-15-386`

Open several terminal windows (see instructions at [novatel][2]). In one of them, follow /var/log/messages:  
`<br />
$ tail -f /var/log/messages`

Insert the modem into your laptop. You should get lines like this showing the airprime driver being loaded (a full log file is included at the end of this howto).

`May  4 13:01:39 localhost kernel: [ 2707.948000] airprime 5-1:1.0: airprime converter detected<br />
May  4 13:01:39 localhost kernel: [ 2707.948000] usb 5-1: airprime converter now attached to ttyUSB0`  
Copy this file to /etc/ppp/peers:

`$ ls -al /etc/ppp/peers/3<br />
-rw-r----- 1 root dip 196 2007-05-04 13:26 /etc/ppp/peers/3<br />
$ cat /etc/ppp/peers/3<br />
debug 10<br />
/dev/ttyUSB0 230400<br />
crtscts<br />
holdoff 1<br />
connect "/usr/sbin/chat -v -f /etc/chatscripts/3"<br />
asyncmap 00000000<br />
user 3netaccess<br />
password 3netaccess<br />
usepeerdns<br />
defaultroute<br />
lcp-echo-interval 0`

Copy this file to /etc/chatscripts/3:

`$ ls -al /etc/chatscripts/3<br />
-rw-r----- 1 root dip 105 2007-05-04 13:24 /etc/chatscripts/3<br />
$ cat /etc/chatscripts/3<br />
ABORT "BUSY"<br />
ABORT "NO CARRIER"<br />
"" "at"<br />
OK 'AT+CGDCONT=1,"IP","3netaccess"'<br />
OK "atd *99#"<br />
CONNECT "dc"`

In another terminal window, connect using pon:

`$ pon 3`

If you connect OK, you&#8217;ll see log messages like this:  
`<br />
May  4 13:27:00 localhost pppd[9247]: Connect: ppp0 <--> /dev/ttyUSB0<br />
May  4 13:27:01 localhost pppd[9247]: CHAP authentication succeeded`

Here&#8217;s a **full set of log messages**, showing the modem being inserted, running pon, then disconnecting using poff:

`May  4 13:01:34 localhost kernel: [ 2703.564000] pccard: CardBus card inserted into slot 0<br />
May  4 13:01:35 localhost kernel: [ 2703.652000] PCI: Enabling device 0000:03:00.0 (0000 -> 0002)<br />
May  4 13:01:35 localhost kernel: [ 2703.652000] ACPI: PCI Interrupt 0000:03:00.0[A] -> GSI 18 (level, low) -> IRQ 18<br />
May  4 13:01:35 localhost kernel: [ 2703.652000] ohci_hcd 0000:03:00.0: OHCI Host Controller<br />
May  4 13:01:35 localhost kernel: [ 2703.652000] ohci_hcd 0000:03:00.0: new USB bus registered, assigned bus number 5<br />
May  4 13:01:35 localhost kernel: [ 2703.652000] ohci_hcd 0000:03:00.0: irq 18, io mem 0x44000000<br />
May  4 13:01:35 localhost kernel: [ 2703.736000] usb usb5: configuration #1 chosen from 1 choice<br />
May  4 13:01:35 localhost kernel: [ 2703.736000] hub 5-0:1.0: USB hub found<br />
May  4 13:01:35 localhost kernel: [ 2703.736000] hub 5-0:1.0: 3 ports detected<br />
May  4 13:01:35 localhost kernel: [ 2703.840000] PCI: Enabling device 0000:03:00.1 (0000 -> 0002)<br />
May  4 13:01:35 localhost kernel: [ 2703.840000] ACPI: PCI Interrupt 0000:03:00.1[B] -> GSI 18 (level, low) -> IRQ 18<br />
May  4 13:01:35 localhost kernel: [ 2703.840000] ohci_hcd 0000:03:00.1: OHCI Host Controller<br />
May  4 13:01:35 localhost kernel: [ 2703.840000] ohci_hcd 0000:03:00.1: new USB bus registered, assigned bus number 6<br />
May  4 13:01:35 localhost kernel: [ 2703.840000] ohci_hcd 0000:03:00.1: irq 18, io mem 0x44001000<br />
May  4 13:01:35 localhost kernel: [ 2703.924000] usb usb6: configuration #1 chosen from 1 choice<br />
May  4 13:01:35 localhost kernel: [ 2703.924000] hub 6-0:1.0: USB hub found<br />
May  4 13:01:35 localhost kernel: [ 2703.924000] hub 6-0:1.0: 2 ports detected<br />
May  4 13:01:38 localhost kernel: [ 2707.580000] usb 5-1: new full speed USB device using ohci_hcd and address 2<br />
May  4 13:01:39 localhost kernel: [ 2707.792000] usb 5-1: configuration #1 chosen from 1 choice<br />
May  4 13:01:39 localhost kernel: [ 2707.896000] usbcore: registered new interface driver usbserial<br />
May  4 13:01:39 localhost kernel: [ 2707.896000] drivers/usb/serial/usb-serial.c: USB Serial support registered for generic<br />
May  4 13:01:39 localhost kernel: [ 2707.896000] usbcore: registered new interface driver usbserial_generic<br />
May  4 13:01:39 localhost kernel: [ 2707.896000] drivers/usb/serial/usb-serial.c: USB Serial Driver core<br />
May  4 13:01:39 localhost kernel: [ 2707.948000] drivers/usb/serial/usb-serial.c: USB Serial support registered for airprime<br />
May  4 13:01:39 localhost kernel: [ 2707.948000] airprime 5-1:1.0: airprime converter detected<br />
May  4 13:01:39 localhost kernel: [ 2707.948000] usb 5-1: airprime converter now attached to ttyUSB0<br />
May  4 13:01:39 localhost kernel: [ 2707.948000] usb 5-1: airprime converter now attached to ttyUSB1<br />
May  4 13:01:39 localhost kernel: [ 2707.948000] usb 5-1: airprime converter now attached to ttyUSB2<br />
May  4 13:01:39 localhost kernel: [ 2707.952000] airprime 5-1:1.1: airprime converter detected<br />
May  4 13:01:39 localhost kernel: [ 2707.952000] usb 5-1: airprime converter now attached to ttyUSB3<br />
May  4 13:01:39 localhost kernel: [ 2707.952000] usb 5-1: airprime converter now attached to ttyUSB4<br />
May  4 13:01:39 localhost kernel: [ 2707.952000] usb 5-1: airprime converter now attached to ttyUSB5<br />
May  4 13:01:39 localhost kernel: [ 2707.952000] usbcore: registered new interface driver airprime<br />
May  4 13:26:57 localhost kernel: [ 4225.860000] PPP generic driver version 2.4.2<br />
May  4 13:26:57 localhost pppd[9247]: pppd 2.4.4 started by root, uid 0<br />
May  4 13:26:58 localhost chat[9250]: abort on (BUSY)<br />
May  4 13:26:58 localhost chat[9250]: abort on (NO CARRIER)<br />
May  4 13:26:58 localhost chat[9250]: send (at^M)<br />
May  4 13:26:58 localhost chat[9250]: expect (OK)<br />
May  4 13:26:58 localhost chat[9250]: at^M^M<br />
May  4 13:26:58 localhost chat[9250]: OK<br />
May  4 13:26:58 localhost chat[9250]:  -- got it<br />
May  4 13:26:58 localhost chat[9250]: send (AT+CGDCONT=1,"IP","3netaccess"^M)<br />
May  4 13:26:58 localhost chat[9250]: expect (OK)<br />
May  4 13:26:58 localhost chat[9250]: ^M<br />
May  4 13:26:58 localhost chat[9250]: AT+CGDCONT=1,"IP","3netaccess"^M^M<br />
May  4 13:26:58 localhost chat[9250]: OK<br />
May  4 13:26:58 localhost chat[9250]:  -- got it<br />
May  4 13:26:58 localhost chat[9250]: send (atd *99#^M)<br />
May  4 13:26:58 localhost chat[9250]: expect (CONNECT)<br />
May  4 13:26:58 localhost chat[9250]: ^M<br />
May  4 13:26:58 localhost chat[9250]: atd *99#^M^M<br />
May  4 13:26:58 localhost chat[9250]: CONNECT<br />
May  4 13:26:58 localhost chat[9250]:  -- got it<br />
May  4 13:26:58 localhost chat[9250]: send (d)<br />
May  4 13:26:59 localhost pppd[9247]: Serial connection established.<br />
May  4 13:27:00 localhost pppd[9247]: Using interface ppp0<br />
May  4 13:27:00 localhost pppd[9247]: Connect: ppp0 <--> /dev/ttyUSB0<br />
May  4 13:27:01 localhost pppd[9247]: CHAP authentication succeeded<br />
May  4 13:27:01 localhost pppd[9247]: CHAP authentication succeeded<br />
May  4 13:27:01 localhost kernel: [ 4229.616000] PPP BSD Compression module registered<br />
May  4 13:27:01 localhost kernel: [ 4229.668000] PPP Deflate Compression module registered<br />
May  4 13:27:03 localhost pppd[9247]: local  IP address 202.124.67.36<br />
May  4 13:27:03 localhost pppd[9247]: remote IP address 202.124.64.162<br />
May  4 13:27:03 localhost pppd[9247]: primary   DNS address 202.124.65.2<br />
May  4 13:27:03 localhost pppd[9247]: secondary DNS address 202.124.68.130<br />
May  4 13:27:04 localhost kernel: [ 4232.552000] ip_tables: (C) 2000-2006 Netfilter Core Team<br />
May  4 13:27:04 localhost pppd[9247]: Connect time 0.1 minutes.<br />
May  4 13:27:04 localhost pppd[9247]: Sent 325 bytes, received 10 bytes.<br />
May  4 13:27:04 localhost pppd[9247]: local  IP address 202.124.67.36<br />
May  4 13:27:04 localhost pppd[9247]: remote IP address 202.124.64.162<br />
May  4 13:27:04 localhost pppd[9247]: primary   DNS address 202.124.65.2<br />
May  4 13:27:04 localhost pppd[9247]: secondary DNS address 202.124.68.130<br />
May  4 13:33:07 localhost pppd[9247]: Terminating on signal 15<br />
May  4 13:33:07 localhost pppd[9247]: Connect time 6.1 minutes.<br />
May  4 13:33:07 localhost pppd[9247]: Sent 69547 bytes, received 68454 bytes.<br />
May  4 13:33:07 localhost pppd[9247]: Connection terminated.<br />
May  4 13:33:07 localhost pppd[9247]: Exit.`

**Update Nov 2007**

(The newer 3 devices use the  HUAWEI chipset)

This is what you need:  
[ http://oozie.fm.interia.pl/pro/huawei-e220/][3]

from the page:

HUAWEI E220 Workaround for kernels < 2.6.20

HUAWEI E220 is supported natively by Linux, over usbserial.ko  
(usbserial-generic) interface. Linux kernel versions prior to 2.6.20  
have some problems with it, as the SCSI CDROM fakevolume with drivers  
for Microsoft systems gets automounted by usbstorage.ko module,  
preventing serial device /dev/ttyUSB0 from working properly. Go ahead  
and try out my workaround-kit!  
&#8212;&#8212;&#8212;-  
I have used it on dapper pretty successfully and even have a script that  
keeps the connection alive quite nicely. it works pretty damn well actually.  
data is a bit expensive though of course.

Thanks to Dave K, SLUG List.

 [1]: http://samat.org/weblog/20070127-high-speed-cellular-wireless-modems-in-ubuntu-linux-6-10.html
 [2]: http://www.novatelwireless.com/support/merlin-xu870-linux.html
 [3]: http://oozie.fm.interia.pl/pro/huawei-e220/
