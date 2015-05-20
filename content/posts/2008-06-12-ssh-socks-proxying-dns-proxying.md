---
author: sonia
comments: true
date: 2008-06-12 00:53:36+00:00
slug: ssh-socks-proxying-dns-proxying
title: Ssh SOCKS proxying, DNS proxying, Tunnelling
wordpress_id: 129
categories:
- Other-Tech
tags:
- Apt
- cvs
- dns
- Firefox
- socks
- Ssh
- svn
- Wireless
---

[Mary Gardiner](http://puzzling.org/) [answered](http://lists.slug.org.au/archives/slug/2008/06/msg00135.html) one of Voytek Eymont's questions on the [SLUG list](http://lists.slug.org.au/listinfo/slug) by referring to the [ssh socks proxying](http://ubuntu.wordpress.com/2006/12/08/ssh-tunnel-socks-proxy-forwarding-secure-browsing/) post on Ubuntu Blog. I was already familiar with ssh socks proxying, but that page has a good set of comments and links. A summary of that post, plus some other notes:



	
  * setup via `$ssh -D 9999 username@ip-address-of-ssh-server`, configure web browser **socks 5 host **(not http proxy) to localhost:9999 (On Firefox: Preferences, Advanced, Network, Settings, Manual, SOCKS Host. [FoxyProxy](http://foxyproxy.mozdev.org/) really helps with this - you can setup wildcards to send certain URLs via certain proxies eg for when connecting via a VPN to work)

	
  * http proxying can be setup at the command line (for use by wget, apt, etc) with the **http_proxy** environment variable. For example _export http_proxy='http://user:password@1.2.3.4:3128/'; cmd1; cmd2; export http_proxy=''_

	
  * configure apt to use a proxy via **/etc/apt/apt.conf** by using **Acquire::http::Proxy "http://username:password@proxyserver:port/";** See [Using apt-get behind a proxy](http://blogs.oracle.com/avinashjoshi/entry/using_apt_get_behind_a).

	
  * there's also [corkscrew](http://www.mtu.net/~engstrom/ssh-proxy.php) (preferred), connect.c, and [proxychains](http://proxychains.sourceforge.net/) to secure other traffic or setup tunnels automagically in ~/.ssh/config. For example:



    
    % sudo aptitude install corkscrew
    
    % cat ~/.ssh/config
    Host foo.bar.com
        User me
        Port 443
        ProxyCommand corkscrew 1.2.3.4 8080 %h %p ~/.ssh/proxyauth
    
    % cat ~/.ssh/proxyauth
    username:password





	
  * [Transparent Multi-hop SSH](http://sshmenu.sourceforge.net/articles/transparent-mulithop.html) - using ProxyCommand and netcat to automate double ssh hops (also, my [SLUG question](http://www.mail-archive.com/slug@slug.org.au/msg62991.html))

	
  * non socks-ifiable programs can use socks via [tsocks](http://tsocks.sourceforge.net/). This is really handy for getting **apt** to work - remember ssh is acting as a _socks_ proxy and not as an _http_ proxy. For example _sudo tsocks aptitude install foo
_

	
  * lots of good tunnelling ideas on the [Tor Wiki HOWTO](https://trac.torproject.org/projects/tor/wiki/TheOnionRouter/TorifyHOWTO/Misc) and [How to tunnel everything through ssh](http://fooninja.net/2010/09/06/how-to-tunnel-everything-through-ssh/)

	
  * also secure your dns traffic by setting **network.proxy.socks_remote_dns = true** in Firefox's about:config

	
  * [cvs + socks](http://lbolla.wordpress.com/2008/04/21/cvs-behind-a-firewall-through-an-http-proxy/) using connect.c (similar to my post on [svn over an ssh tunnel](http://blog.snowfrog.net/2007/12/04/svn-over-an-ssh-tunnel/))

	
  * another similar article [Secure your Wi-Fi traffic using FOSS utilities](http://www.linux.com/articles/56945)


**Jan/2011:**



	
  * the [FoxyProxy website](http://getfoxyproxy.org/) has some good tutorials, and links to other material

	
  * Linux Magazine has an article called [Tunnelling Data](http://www.linux-mag.com/id/2062/)

	
  * PaulDotCom - [SSH gymnastics with proxychains](http://pauldotcom.com/2010/03/ssh-gymnastics-with-proxychain.html)






    
    <code>export http_proxy='http://219.93.2.113:3128/'</code>



