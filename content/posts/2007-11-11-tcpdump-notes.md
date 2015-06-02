---
title: tcpdump notes
author: Sonia Hamilton
date: 2007-11-12
url: /2007/11/11/tcpdump-notes/
categories:
  - Other-Tech
tags:
  - Cheatsheets
  - Networking
  - Ssh
---
Examples:

<!--more-->

<pre class="brush: bash; title: ; notranslate" title="">tcpdump host 172.26.24.58 and (port 20 or port 21)
tcpdump host 172.26.24.58 and not arp
tcpdump -s0 -w foo -i eth0 # whole packet not 96 bytes, write to file foo, listen on eth0)
tcpdump -s 0 -i eth6 -w snmpget.pcap host 1.2.3.4 and port 161 # capture snmp traffic
</pre>

Three Way Handshake (from 

[Wikipedia][1]):

  1. The initiating host (client) sends a synchronization packet (SYN flag set to 1) to initiate a connection. It sets the packet's sequence number to a random value <span class="texhtml"><em>x</em></span>.
  2. The other host receives the packet, records the sequence number <span class="texhtml"><em>x</em></span> from the client, and replies with an acknowledgment and synchronization (SYN-ACK). The Acknowledgment is a 32-bit field in TCP segment header. It contains the next sequence number that this host is expecting to receive <span class="texhtml">(<em>x</em> + 1)</span>. The host also initiates a return session. This includes a TCP segment with its own initial Sequence Number of value <span class="texhtml"><em>y</em></span>.
  3. The initiating host responds with the next Sequence Number <span class="texhtml">(<em>x</em> + 1)</span> and a simple Acknowledgment Number value of <span class="texhtml"><em>y</em> + 1</span>, which is the Sequence Number value of the other host + 1.

This ssh example:

soniah.local.36126 > 172.31.144.98.ssh: S **4193395019**:4193395019(0)  
win 5840 <mss 1460,sackOK,timestamp 3073372 0,nop,wscale 6>

172.31.144.98.ssh > soniah.local.36126: S 4235467031:4235467031(0)  
ack **4193395020** win 5792 <mss 1460,sackOK,timestamp 1343461014 3073372,nop,wscale 2>

soniah.local.36126 > 172.31.144.98.ssh: . ack 1 win 92 <nop,nop,timestamp 3073372 1343461014>

The first line contains a SYN (S) followed by a sequence number of **&#8230;19**. The second line contains a SYN **S** followed by an **ack** incremented by 1 to **&#8230;20**. The third line contains an **ack**, but tcpdump has renumbered it to 1 to make the subsequent packets easier to follow.

 [1]: http://en.wikipedia.org/wiki/Transmission_Control_Protocol#Connection_establishment
