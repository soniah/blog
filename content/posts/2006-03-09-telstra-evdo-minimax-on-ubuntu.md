---
title: Telstra evdo MiniMax on Ubuntu
author: Sonia Hamilton
date: 2006-03-10
url: /2006/03/09/telstra-evdo-minimax-on-ubuntu/
categories:
  - Linux
tags:
  - Ubuntu
  - Wireless
---
A while ago I bought a [account][1] from Telstra for roaming wireless on my laptop -- it uses a Maxon MiniMax [MM-5500U][2] to connect on the CDMA phone network. I got this rather than other wireless products as I was going to be doing some work in Perth, and this was the only network that had coverage.
<!--more-->
Getting it going on Ubuntu Breezy was really easy, thanks to Quozl's Maxon [page][3]:<!--more-->

  * I plugged it in, and the **cdc_acm** module was automatically loaded
  * I ran **sudo pppconfig**, entered these settings: 
      * connection name: evdo (or whatever you prefer)
      * static dns: 203.50.2.71, 139.130.4.4 (more reliable -- sometimes dynamic doesn't work&#8230;)
      * authentication: pap
      * user: user@telstra.pcpack
      * password: telstra
      * speed: default, tone
      * phone number: 777
      * config method: manual
      * tty: /dev/ttyACM0
  * in pppconfig, I went into the advanced settings: 
      * modem initialisation string of **AT+CRM=150**
      * add-user: sonia (or whoever can **pon** connect without sudo)
  * saved my config, typed in **pon evdo**, and was on

A few things to be aware of:

  * I've found the MiniMax works best with the extra USB powerboost cable, even in the middle of a suburban area
  * the default route setting in ppp didn't work when I had an existing ethernet connection -- I don't know if this is a *feature* of ppp

Written using my laptop connected over Telstra Evdo :-)

### IP Configuration Under Windows

<pre>Windows IP Configuration

Ethernet adapter VMware Network Adapter VMnet8:

    Connection-specific DNS Suffix  . :
    IP Address. . . . . . . . . . . . : 192.168.133.1
    Subnet Mask . . . . . . . . . . . : 255.255.255.0
    Default Gateway . . . . . . . . . :

Ethernet adapter VMware Network Adapter VMnet1:

    Connection-specific DNS Suffix  . :
    IP Address. . . . . . . . . . . . : 192.168.186.1
    Subnet Mask . . . . . . . . . . . : 255.255.255.0
    Default Gateway . . . . . . . . . :

PPP adapter Maxon MiniMax Connection:

    Connection-specific DNS Suffix  . :
    IP Address. . . . . . . . . . . . : 10.244.62.222
    Subnet Mask . . . . . . . . . . . : 255.255.255.255
    Default Gateway . . . . . . . . . : 10.244.62.222</pre>

### Route Under Windows

<pre>===========================================================================
Interface List
0x1 ........................... MS TCP Loopback interface
0x2 ...00 50 56 c0 00 08 ...... VMware Virtual Ethernet Adapter for VMnet8
0x3 ...00 50 56 c0 00 01 ...... VMware Virtual Ethernet Adapter for VMnet1
0x4 ...00 12 f0 b6 e2 02 ...... Intel(R) PRO/Wireless
  2915ABG Network Connection - Packet Scheduler Miniport
0x10006 ...00 0f b0 77 5f 41 ...... Broadcom NetXtreme
  Gigabit Ethernet - Packet Scheduler Miniport
0x20007 ...00 53 45 00 00 00 ...... WAN (PPP/SLIP) Interface
===========================================================================
===========================================================================
Active Routes:
Network Destination        Netmask          Gateway       Interface  Metric
          0.0.0.0          0.0.0.0    10.244.62.222   10.244.62.222	  1
    10.244.62.222  255.255.255.255        127.0.0.1       127.0.0.1	  50
   10.255.255.255  255.255.255.255    10.244.62.222   10.244.62.222	  50
        127.0.0.0        255.0.0.0        127.0.0.1       127.0.0.1	  1
    144.135.83.69  255.255.255.255    10.244.62.222   10.244.62.222	  1
    192.168.133.0    255.255.255.0    192.168.133.1   192.168.133.1	  20
    192.168.133.1  255.255.255.255        127.0.0.1       127.0.0.1	  20
  192.168.133.255  255.255.255.255    192.168.133.1   192.168.133.1	  20
    192.168.186.0    255.255.255.0    192.168.186.1   192.168.186.1	  20
    192.168.186.1  255.255.255.255        127.0.0.1       127.0.0.1	  20
  192.168.186.255  255.255.255.255    192.168.186.1   192.168.186.1	  20
        224.0.0.0        240.0.0.0    192.168.133.1   192.168.133.1	  20
        224.0.0.0        240.0.0.0    192.168.186.1   192.168.186.1	  20
        224.0.0.0        240.0.0.0    10.244.62.222   10.244.62.222	  1
  255.255.255.255  255.255.255.255    10.244.62.222               4	  1
  255.255.255.255  255.255.255.255    10.244.62.222           10006	  1
  255.255.255.255  255.255.255.255    10.244.62.222   10.244.62.222	  1
  255.255.255.255  255.255.255.255    192.168.133.1   192.168.133.1	  1
  255.255.255.255  255.255.255.255    192.168.186.1   192.168.186.1	  1
Default Gateway:     10.244.62.222
===========================================================================
Persistent Routes:
  None</pre>

 [1]: http://www.telstra.com/countrywide/telstramobility/default.asp?sn=9&vp=1322&SMSESSION=NO
 [2]: http://www.maxon.com.au/products/consumers/consumers-minimax-home.asp
 [3]: http://quozl.linux.org.au/mm-5100/
