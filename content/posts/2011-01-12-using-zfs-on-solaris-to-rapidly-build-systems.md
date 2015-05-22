---
title: Using ZFS on Solaris to rapidly build systems
author: Sonia Hamilton
date: 2011-01-11
url: /2011/01/12/using-zfs-on-solaris-to-rapidly-build-systems/
categories:
  - Other-Tech
tags:
  - Solaris
---
A work colleagues used an interesting technique to rapidly build some Solaris systems. We usually use Jumpstart but due to the large number of identical systems to be built, he had to use a faster method. In a nutshell:

  * build the first system onto a single disk with a root zfs partition
  * export the root partition onto a second hard disk
  * on subsequent machines insert this second hard disk, import then re-export the root zfs partition
  * when finished, add a second hard disk to all machines and zfs mirror the root partition. Fix up hostname, network, etc

Another possible method would be to break mirroring, re-mirror on second machine, as so on.

Thanks Peter.
