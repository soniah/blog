---
author: sonia
comments: true
date: 2006-08-14 04:59:02+00:00
slug: howto-fix-broken-grub
title: howto fix broken grub
wordpress_id: 35
categories:
- Linux
---


	
  * boot using Knoppix, Insert, etc

	
  * mount required partition:



    
    
     mount -o dev,rw /mnt/hda1, or
    
     mount -o remount,dev,rw /mnt/hda1





	
  * restore grub:



    
    
     grub-install --root-directory=/mnt/hda1 /dev/hda, or
    
     chroot /mnt/hda1 grub-install /dev/hda





	
  * if problems because of change of partition names, etc, boot using grub shell, then:



    
    
     vi /boot/grub/menu.lst
    
     update-grub
