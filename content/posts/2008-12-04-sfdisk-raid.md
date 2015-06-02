---
title: sfdisk, RAID
author: Sonia Hamilton
date: 2008-12-04
url: /2008/12/04/sfdisk-raid/
categories:
  - Linux
---
A useful tool I came across last night (thanks Rodrigo) -- **sfdisk** -- "Partition table manipulator for Linux".

<!--more-->

Good for copying partition tables when replacing a failed hard disk in a (md Linux Software Raid) RAID. For example, to copy the partition table from sdb to sda:

<pre>sfdisk –d /dev/sdb | sed –e s/sdb/sda/ |  sfdisk /dev/sda</pre>

Of course you'd also be doing the usual **mdadm --fail, --remove, physically swap disk, --add, cat /proc/mdstat, --detail, **and installing grub on the new hard drive:

<pre>grub&gt; device (hd0)  /dev/sdb
grub&gt; root (hd0,0)
grub&gt; setup (hd0)
grub&gt; quit</pre>

(Unmercifully plagiarised from Rodrigo's notes).
