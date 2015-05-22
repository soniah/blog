---
title: howto fix broken grub
author: Sonia Hamilton
date: 2006-08-14
url: /2006/08/13/howto-fix-broken-grub/
categories:
  - Linux
---
howto fix broken grub
<!--more-->

  * boot using Knoppix, Insert, etc
  * mount required partition:

<pre> mount -o dev,rw /mnt/hda1, or

 mount -o remount,dev,rw /mnt/hda1</pre>

  * restore grub:

<pre> grub-install --root-directory=/mnt/hda1 /dev/hda, or

 chroot /mnt/hda1 grub-install /dev/hda</pre>

  * if problems because of change of partition names, etc, boot using grub shell, then:

<pre> vi /boot/grub/menu.lst

 update-grub</pre>
