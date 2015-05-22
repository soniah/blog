---
title: Setup a forwarding caching-only DNS Server on Ubuntu
author: Sonia Hamilton
date: 2008-02-02
url: /2008/02/01/setup-a-forwarding-caching-only-dns-server-on-ubuntu/
categories:
  - Other-Tech
tags:
  - Cheatsheets
  - Networking
  - Ubuntu
---
A quick cheatsheet for setting up a forwarding, caching-only DNS Server on Ubuntu.

<!--more-->

<u>Edit /etc/bind/named.conf.options:</u>

<tt>options {</tt>  
<tt> directory "/var/cache/bind";</tt>  
<tt></tt>  
<tt> // prevent firewall problems</tt>  
<tt> query-source address * port 53;</tt>  
<tt></tt>  
<tt> forwarders {</tt>  
<tt> // forward requests to</tt>  
<tt> 1.2.3.4;</tt>  
<tt> 5.6.7.8;</tt>  
<tt> };</tt>  
<tt></tt>  
<tt> // don't iterate</tt>  
<tt> forward only;</tt>  
<tt></tt>  
<tt> // but DO cache (make it explicit)</tt>  
<tt> recursion yes;</tt>  
<tt></tt>  
<tt> auth-nxdomain no; # conform to RFC1035</tt>  
<tt></tt>  
<tt> // don't do IPv6</tt>  
<tt> // listen-on-v6 { any; };</tt>  
<tt> listen-on-v6 { none; };</tt>  
<tt></tt>  
<tt> // only listen on internal interfaces</tt>  
<tt> listen-on { 10.0.0.1; 127.0.0.1; };</tt>  
<tt>};</tt>

<u>Edit /etc/dhcp3/dhclient.conf, add the following lines:</u>

<tt># sonia: use this server's dns server first!!</tt>  
<tt>interface "eth0" {</tt>  
<tt> prepend domain-name-servers 127.0.0.1;</tt>  
<tt>}</tt>

<u>Finally, restart services and check work:</u>

<tt>/etc/init.d/bind9 restart</tt>  
<tt>netstat -tanp | grep named</tt>  
<tt>grep bind /var/log/* | less</tt>  
<tt>/etc/init.d/networking restart</tt>  
<tt>cat /etc/resolv.conf</tt>
