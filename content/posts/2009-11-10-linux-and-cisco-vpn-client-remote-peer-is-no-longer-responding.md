---
title: Linux and Cisco VPN Client “Remote peer is no longer responding”
author: Sonia Hamilton
date: 2009-11-10
url: /2009/11/10/linux-and-cisco-vpn-client-remote-peer-is-no-longer-responding/
categories:
  - Linux
tags:
  - Networking
---
I'm using the Cisco VPN client, and it seems unreliable on Linux -- it occasionally connects but often just gives up with "Remote peer is no longer responding".

<!--more-->

Apart from the obvious firewall/nat checks [[1][1]][[2][2]], a solution seems to be to edit the .pcf file, bump up the timeout and force keepalives:

<pre>PeerTimeout=180
ForceKeepAlive=1</pre>

&nbsp;

&nbsp;

 [1]: http://www.lamnk.com/blog/vpn/cisco-vpn-client-reason-412-the-remote-peer-is-no-longer-responding/
 [2]: http://www.cisco.com/en/US/products/sw/secursw/ps2308/products_qanda_item09186a00801c2dbe.shtml
