---
title: howto reverse ssh tunnel
author: Sonia Hamilton
date: 2006-12-17
url: /2006/12/16/howto-reverse-ssh-tunnel/
categories:
  - Other-Tech
tags:
  - Ssh
---
I recently (15-Dec-06) asked this question on the [SLUG email list][1] &#8211; thanks to everyone for all the replies I got, especially Dave, The Reverend, Michael K, Erik, Tongmaster, Alex S, Tigger, David K&#8230;

<pre>&gt; Is there a way of configuring ssh, so that if someone ssh's into my
 &gt; machine, I can connect back and get into their machine? (Linux to
 &gt; Linux).<!--more--></pre>

  * get him to ssh to you: **ssh -R 2222:localhost:22 <your server>**. Once he&#8217;s logged in, you can just **ssh -p 2222 localhost**. You may have trouble binding to ports 1024 or lower on the other side (which is why I used 2222 as an example), and you may have to enable an option in the sshd config of the other side. There&#8217;s an article on TechRepublic [Setting up a reverse SSH tunnel][2].

  * once he&#8217;s ssh&#8217;d to me, I could get him to run apps and display on my machine ie **type export DISPLAY=xxx.xxx.xxx.xxx:0.0**, then run **xterm &** (or another program if it needed configuring)

  * him ssh&#8217;ing to me could be made easier by setting up an icon on their desktop that has **ssh -R 1200:localhost:22 foo@bar.com** (install his public key on bar.com). This can also be setup to access the ADSL modem: **ssh -p 1234 -R 1201:192.168.1.254:80 foo@bar.com**, then browse **localhost:1201** to get the modem setup page.

  * [autossh][3] is your friend. Just get it to set up *permanent* tunnels to your box, so you can always get through whenever you need to.

  * use [OpenVPN][4] or [Hamachi][5] to setup a VPN, then just ssh to the local vpn endpoint. Samba shares could also be setup across the vpn, allowing easy filesharing.

  * VNC can also be run over ssh &#8211; see [VNC over SSH2 &#8211; A TightVNC Tutorial][6]

  * if they run windows, I find [logmein][7] as the best remote support thing by far, penetrates nat etc pretty well. See [here][8]. Client runs on linux, but server (on target PC) is windows only unfortunately.

(28/Jan/2007)

  * [Debian Administration][9] has an article entitled [SMTP via an SSH tunnel][10], which also links thru to [HOWTO: Sending Email from a Laptop][11] and J. Franken&#8217;s excellent [SSH-tunneling HOWTO][12].

 [1]: http://lists.slug.org.au/listinfo/slug
 [2]: http://articles.techrepublic.com.com/5100-10879-5779944.html?tag=nl.e011
 [3]: http://www.harding.motd.ca/autossh/
 [4]: http://openvpn.net/
 [5]: http://www.hamachi.cc/
 [6]: http://www.vanemery.com/Linux/VNC/vnc-over-ssh.html
 [7]: https://secure.logmein.com/home.asp
 [8]: https://secure.logmein.com/go.asp?page=support_faq#basics-04
 [9]: http://www.debian-administration.org
 [10]: http://www.debian-administration.org/articles/487
 [11]: http://cg.scs.carleton.ca/~morin/misc/laptopmail/
 [12]: http://www.jfranken.de/homepages/johannes/vortraege/ssh2_inhalt.en.html
