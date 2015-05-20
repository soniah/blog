---
title: sfdisk, RAID
author: Sonia Hamilton
date: 2008-12-04
url: /2008/12/04/sfdisk-raid/
categories:
  - Linux
---
A useful tool I came across last night (thanks Rodrigo) &#8211; **sfdisk** &#8211; &#8220;Partition table manipulator for Linux&#8221;.  Good for copying partition tables when replacing a failed hard disk in a (md Linux Software Raid) RAID. For example, to copy the partition table from sdb to sda:

<pre>sfdisk –d /dev/sdb | sed –e s/sdb/sda/ |  sfdisk /dev/sda</pre>

Of course you&#8217;d also be doing the usual **mdadm &#8211;fail, &#8211;remove, physically swap disk, &#8211;add, cat /proc/mdstat, &#8211;detail, **and installing grub on the new hard drive:

<pre>grub&gt; device (hd0)  /dev/sdb
grub&gt; root (hd0,0)
grub&gt; setup (hd0)
grub&gt; quit</pre>

(Unmercifully plagiarised from Rodrigo&#8217;s notes).
