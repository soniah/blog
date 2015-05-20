---
author: sonia
comments: true
date: 2008-12-04 01:04:07+00:00
slug: sfdisk-raid
title: sfdisk, RAID
wordpress_id: 187
categories:
- Linux
---

A useful tool I came across last night (thanks Rodrigo) - **sfdisk** - "Partition table manipulator for Linux".  Good for copying partition tables when replacing a failed hard disk in a (md Linux Software Raid) RAID. For example, to copy the partition table from sdb to sda:

    
    sfdisk –d /dev/sdb | sed –e s/sdb/sda/ |  sfdisk /dev/sda


Of course you'd also be doing the usual **mdadm --fail, --remove, physically swap disk, --add, cat /proc/mdstat, --detail, **and installing grub on the new hard drive:

    
    grub> device (hd0)  /dev/sdb
    grub> root (hd0,0)
    grub> setup (hd0)
    grub> quit


(Unmercifully plagiarised from Rodrigo's notes).
