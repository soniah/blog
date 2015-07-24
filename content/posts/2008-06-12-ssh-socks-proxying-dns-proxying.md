---
title: Ssh SOCKS proxying, DNS proxying, Tunnelling
author: Sonia Hamilton
date: 2008-06-12
url: /2008/06/12/ssh-socks-proxying-dns-proxying/
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
[Mary Gardiner][1] [answered][2] one of Voytek Eymont's questions on the [SLUG list][3] by referring to the [ssh socks proxying][4] post on Ubuntu Blog.

<!--more-->

I was already familiar with ssh socks proxying, but that page has a good set of comments and links. A summary of that post, plus some other notes:

  * setup via `$ssh -D 9999 username@ip-address-of-ssh-server`, configure web browser **socks 5 host **(not http proxy) to localhost:9999 (On Firefox: Preferences, Advanced, Network, Settings, Manual, SOCKS Host. [FoxyProxy][5] really helps with this -- you can setup wildcards to send certain URLs via certain proxies eg for when connecting via a VPN to work)
  * http proxying can be setup at the command line (for use by wget, apt, etc) with the **http_proxy** environment variable. For example *export http\_proxy='http://user:password@1.2.3.4:3128/'; cmd1; cmd2; export http\_proxy="*
  * configure apt to use a proxy via **/etc/apt/apt.conf** by using **Acquire::http::Proxy "http://username:password@proxyserver:port/";** See [Using apt-get behind a proxy][6].
  * there's also [corkscrew][7] (preferred), connect.c, and [proxychains][8] to secure other traffic or setup tunnels automagically in ~/.ssh/config. For example:

<pre>% sudo aptitude install corkscrew

% cat ~/.ssh/config
Host foo.bar.com
    User me
    Port 443
    ProxyCommand corkscrew 1.2.3.4 8080 %h %p ~/.ssh/proxyauth

% cat ~/.ssh/proxyauth
username:password</pre>

  * [Transparent Multi-hop SSH][9] -- using ProxyCommand and netcat to automate double ssh hops (also, my [SLUG question][10])
  * non socks-ifiable programs can use socks via [tsocks][11]. This is really handy for getting **apt** to work -- remember ssh is acting as a *socks* proxy and not as an *http* proxy. For example *sudo tsocks aptitude install foo  
    *
  * lots of good tunnelling ideas on the [Tor Wiki HOWTO][12] and [How to tunnel everything through ssh][13]
  * also secure your dns traffic by setting **network.proxy.socks\_remote\_dns = true** in Firefox's about:config
  * [cvs + socks][14] using connect.c (similar to my post on [svn over an ssh tunnel][15])
  * another similar article [Secure your Wi-Fi traffic using FOSS utilities][16]

**Jan/2011:**

  * the [FoxyProxy website][17] has some good tutorials, and links to other material
  * Linux Magazine has an article called [Tunnelling Data][18]
  * PaulDotCom -- [SSH gymnastics with proxychains][19]

<div id="_mcePaste" class="mcePaste" style="position:absolute;left:-10000px;top:0;width:1px;height:1px;overflow:hidden;">
  <pre><code>export http_proxy='http://219.93.2.113:3128/'</code></pre>
</div>

 [1]: http://puzzling.org/
 [2]: http://lists.slug.org.au/archives/slug/2008/06/msg00135.html
 [3]: http://lists.slug.org.au/listinfo/slug
 [4]: http://ubuntu.wordpress.com/2006/12/08/ssh-tunnel-socks-proxy-forwarding-secure-browsing/
 [5]: http://foxyproxy.mozdev.org/
 [6]: http://blogs.oracle.com/avinashjoshi/entry/using_apt_get_behind_a
 [7]: http://www.mtu.net/~engstrom/ssh-proxy.php
 [8]: http://proxychains.sourceforge.net/
 [9]: http://sshmenu.sourceforge.net/articles/transparent-mulithop.html
 [10]: http://www.mail-archive.com/slug@slug.org.au/msg62991.html
 [11]: http://tsocks.sourceforge.net/
 [12]: https://trac.torproject.org/projects/tor/wiki/TheOnionRouter/TorifyHOWTO/Misc
 [13]: http://fooninja.net/2010/09/06/how-to-tunnel-everything-through-ssh/
 [14]: http://lbolla.wordpress.com/2008/04/21/cvs-behind-a-firewall-through-an-http-proxy/
 [15]: http://www.snowfrog.net/2007/12/04/svn-over-an-ssh-tunnel/
 [16]: http://www.linux.com/articles/56945
 [17]: http://getfoxyproxy.org/
 [18]: http://www.linux-mag.com/id/2062/
 [19]: http://pauldotcom.com/2010/03/ssh-gymnastics-with-proxychain.html
