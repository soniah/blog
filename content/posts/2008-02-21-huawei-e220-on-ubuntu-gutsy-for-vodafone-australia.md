---
author: sonia
comments: true
date: 2008-02-21 10:00:20+00:00
slug: huawei-e220-on-ubuntu-gutsy-for-vodafone-australia
title: Huawei E220 on Ubuntu Gutsy for Vodafone Australia
wordpress_id: 124
categories:
- Other-Tech
tags:
- Wireless
---

* if running a recent kernel, just plugin and check **option** module is being loaded


    
    $ lsmod | grep option


	
* also look in /var/log/messages


    
    $ less /var/log/messages



    
    option 5-2:1.0: GSM modem (1-port) converter detected



    
    usb 5-2: GSM modem (1-port) converter now attached to ttyUSB0



    
    option 5-2:1.1: GSM modem (1-port) converter detected



    
    usb 5-2: GSM modem (1-port) converter now attached to ttyUSB1


	
* use this /etc/wvdial.conf


    
    [Dialer hsdpa]



    
    Phone = *99***1#



    
    Username = vodafone



    
    Password = vodafone



    
    Stupid Mode = 1



    
    Dial Command = ATDT



    
    Modem = /dev/ttyUSB0



    
    Baud = 460800



    
    Init2 = ATZ



    
    Init3 = ATE0V1&D2&C1S0=0+IFC=2,2



    
    ISDN = 0



    
    Modem Type = Analog Modem



    
    Init5 =AT+CGDCONT=1,"IP","vfinternet.au";


	
* connect using this command (check you're in the


    
    wvdial hsdpa
