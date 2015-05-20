---
author: sonia
comments: true
date: 2006-12-17 02:32:53+00:00
slug: howto-reverse-ssh-tunnel
title: howto reverse ssh tunnel
wordpress_id: 58
categories:
- Other-Tech
tags:
- Ssh
---

I recently (15-Dec-06) asked this question on the [SLUG email list](http://lists.slug.org.au/listinfo/slug) - thanks to everyone for all the replies I got, especially Dave, The Reverend, Michael K, Erik, Tongmaster, Alex S, Tigger, David K...

    
    
     > Is there a way of configuring ssh, so that if someone ssh's into my
     > machine, I can connect back and get into their machine? (Linux to
     > Linux).<!-- more -->





	
  * get him to ssh to you: **ssh -R 2222:localhost:22 <your server>**. Once he's logged in, you can just **ssh -p 2222 localhost**. You may have trouble binding to ports 1024 or lower on the other side                                                        (which is why I used 2222 as an example), and you may have to enable                                                         an option in the sshd config of the other side. There's an article on TechRepublic [Setting up a reverse SSH tunnel](http://articles.techrepublic.com.com/5100-10879-5779944.html?tag=nl.e011).



	
  * once he's ssh'd to me, I could get him to run apps and display on my machine ie **type export DISPLAY=xxx.xxx.xxx.xxx:0.0**, then run **xterm &** (or another program if it needed configuring)



	
  * him ssh'ing to me could be made easier by setting up an icon on their desktop that has **ssh -R 1200:localhost:22 foo@bar.com** (install his public key on bar.com). This can also be setup to access the ADSL modem: **ssh -p 1234 -R 1201:192.168.1.254:80 foo@bar.com**, then browse **localhost:1201** to get the modem setup page.



	
  * [autossh](http://www.harding.motd.ca/autossh/) is your friend. Just get it to set up _permanent_ tunnels to your box, so you can always get through whenever you need to.



	
  * use [OpenVPN](http://openvpn.net/) or [Hamachi](http://www.hamachi.cc/) to setup a VPN, then just ssh to the local vpn endpoint. Samba shares could also be setup across the vpn, allowing easy filesharing.



	
  * VNC can also be run over ssh - see [VNC over SSH2 - A TightVNC Tutorial](http://www.vanemery.com/Linux/VNC/vnc-over-ssh.html)



	
  * if they run windows, I find [logmein](https://secure.logmein.com/home.asp) as the best remote support                                                          thing by far, penetrates nat etc pretty well. See [here](https://secure.logmein.com/go.asp?page=support_faq#basics-04). Client runs on linux, but server (on target PC) is windows only unfortunately.


(28/Jan/2007)

	
  * [Debian Administration](http://www.debian-administration.org) has an article entitled [SMTP via an SSH tunnel](http://www.debian-administration.org/articles/487), which also links thru to [HOWTO: Sending Email from a Laptop](http://cg.scs.carleton.ca/~morin/misc/laptopmail/) and J. Franken's excellent [SSH-tunneling HOWTO](http://www.jfranken.de/homepages/johannes/vortraege/ssh2_inhalt.en.html).


