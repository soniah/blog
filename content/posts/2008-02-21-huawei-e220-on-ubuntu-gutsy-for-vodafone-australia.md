---
title: Huawei E220 on Ubuntu Gutsy for Vodafone Australia
author: Sonia Hamilton
date: 2008-02-21
url: /2008/02/21/huawei-e220-on-ubuntu-gutsy-for-vodafone-australia/
categories:
  - Other-Tech
tags:
  - Wireless
---
If running a recent kernel, just plugin and check **option** module is being loaded

<!--more-->

<pre>$ lsmod | grep option</pre>

  * also look in /var/log/messages
<pre>$ less /var/log/messages</pre>

<pre>option 5-2:1.0: GSM modem (1-port) converter detected</pre>

<pre>usb 5-2: GSM modem (1-port) converter now attached to ttyUSB0</pre>

<pre>option 5-2:1.1: GSM modem (1-port) converter detected</pre>

<pre>usb 5-2: GSM modem (1-port) converter now attached to ttyUSB1</pre>

  * use this /etc/wvdial.conf
<pre>[Dialer hsdpa]</pre>

<pre>Phone = *99***1#</pre>

<pre>Username = vodafone</pre>

<pre>Password = vodafone</pre>

<pre>Stupid Mode = 1</pre>

<pre>Dial Command = ATDT</pre>

<pre>Modem = /dev/ttyUSB0</pre>

<pre>Baud = 460800</pre>

<pre>Init2 = ATZ</pre>

<pre>Init3 = ATE0V1&D2&C1S0=0+IFC=2,2</pre>

<pre>ISDN = 0</pre>

<pre>Modem Type = Analog Modem</pre>

<pre>Init5 =AT+CGDCONT=1,"IP","vfinternet.au";</pre>

  * connect using this command (check you&#8217;re in the
<pre>wvdial hsdpa</pre>
