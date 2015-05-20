---
author: sonia
comments: true
date: 2008-02-02 00:02:49+00:00
slug: setup-a-forwarding-caching-only-dns-server-on-ubuntu
title: Setup a forwarding caching-only DNS Server on Ubuntu
wordpress_id: 116
categories:
- Other-Tech
tags:
- Cheatsheets
- Networking
- Ubuntu
---

A quick cheatsheet for setting up a forwarding, caching-only DNS Server on Ubuntu.<!-- more -->

_Edit  /etc/bind/named.conf.options:_

options {
   directory "/var/cache/bind";

   // prevent firewall problems
   query-source address * port 53;

   forwarders {
       // forward requests to
       1.2.3.4;
       5.6.7.8;
   };

   // don't iterate
   forward only;

   // but DO cache (make it explicit)
   recursion yes;

   auth-nxdomain no;    # conform to RFC1035

   // don't do IPv6
   // listen-on-v6 { any; };
   listen-on-v6 { none; };

   // only listen on internal interfaces
   listen-on { 10.0.0.1; 127.0.0.1; };
};

_Edit /etc/dhcp3/dhclient.conf, add the following lines:_

# sonia: use this server's dns server first!!
interface "eth0" {
   prepend domain-name-servers 127.0.0.1;
}

_Finally, restart services and check work:_

/etc/init.d/bind9 restart
netstat -tanp | grep named
grep bind /var/log/* | less
/etc/init.d/networking restart
cat /etc/resolv.conf
