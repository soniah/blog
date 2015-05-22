---
title: Solaris IP Multipathing – an example
author: Sonia Hamilton
date: 2010-11-09
url: /2010/11/09/solaris-ip-multipathing-an-example/
categories:
  - Other-Tech
tags:
  - Networking
  - Solaris
---
An example of Solaris IP Multipathing, for future reference:

<pre># cat /etc/hostname.bge2
10.888.999.133 netmask + broadcast + mtu 1380 deprecated -failover group inner-prod up 
 addif 10.888.999.132 netmask + broadcast + mtu 1380 group inner-prod up
# cat /etc/hostname.bge3
10.888.999.134 netmask + broadcast + mtu 1380 deprecated -failover standby group inner-prod up</pre>

giving:

<pre># ifconfig bge2
bge2: flags=9040843&lt;UP,BROADCAST,RUNNING,MULTICAST,DEPRECATED,IPv4,NOFAILOVER&gt; mtu 1380 index 4
 inet 10.888.999.133 netmask fffffff0 broadcast 10.225.228.143
 groupname inner-prod
 ether 0:xx:xx:xx:xx:xx
# ifconfig bge3
bge3: flags=69040843&lt;UP,BROADCAST,RUNNING,MULTICAST,DEPRECATED,IPv4,NOFAILOVER,STANDBY,INACTIVE&gt; mtu 1380 index 5
 inet 10.888.999.134 netmask fffffff0 broadcast 10.888.999.143
 groupname inner-prod
 ether 0:xx:xx:xx:xx:xx
</pre>
