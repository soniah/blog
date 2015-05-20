---
author: sonia
comments: true
date: 2006-06-20 05:49:54+00:00
slug: sharing-application-data-on-a-dual-boot-laptop
title: sharing application data on a dual boot laptop
wordpress_id: 27
categories:
- Linux
tags:
- Windows
---


I dual boot my laptop between Linux and Windows - mostly Linux, but occasionally Windows. Here's how to make applications like Firefox, Thunderbird, etc share their configuration - especially useful for bookmarks and saved passwords for Firefox. This how-to presumes that your Linux username is _sonia_ and your user id is _1000_ (check by running the **id** function). It also presumes that you can see system folders in Windows - setup in Windows Explorer under Tools, Options, View, Show hidden files and Folders, Click _Apply to All Folders_.






### 
 Create a Shared Partition






First you need a filesystem that will be shared between both Linux and Windows - it has to be FAT, as this is the only filesystem that both operating systems (easily) read. This may involve shrinking an existing filesystem and partition. (You could of course lose data doing this, so check your backups first).






The key idea here is that each partition (eg /dev/hda6) has a filesystem (eg Reiserfs or Ext3) located inside. To shrink a partition, the filesystem needs to be shrunk first; the easiest way to do this is to shrink the filesystem too small, delete the partition and recreate it smaller, then expand the filesystem to fit the newly shrunk partition:







  * boot off Knoppix




  * shrink the _filesystem_ before the _partition_. For example if using ReiserFS and hda6:




    
    
     resize_reiserfs -s 10G /dev/hda6
    






  * using fdisk/cfdisk, resize the _partition_ by deleting the existing partition and recreating it with a smaller size. Ensure the new _partition_ is **larger** than the resized _filesystem_.


  * expand the previous _filesystem_ so it fills the shrunk _partition_:



    
    
     resize_reiserfs /dev/hda6
    






  * check and mount the shrunk partition before creating the new partition and filesystem, in case you've made a mistake



    
    
    
     reiserfsck /dev/hda6
     mount /dev/hda6
    






  * in fdisk/cfdisk, also create the new partition (/dev/hda7 in this case), set the type to 0C (Windows FAT LBA)

  * create the new shared _filesystem_:



    
    
     mkfs.vfat /dev/hda7
    




### 
 Mount the Shared Partition in Linux








  * create a mount directory



    
    
     cd /
     sudo mkdir /configs
     sudo chown 1000. /configs
    






  * add an entry to /etc/fstab to mount at boot:



    
    
     /dev/hda7       /configs        vfat    defaults,uid=1000,gid=1000        0       0
    






  * reboot to linux and check the partition mounts OK by trying to create a test file in /configs _using your normal user account_, not root




### 
 Get Firefox to Locate Configuration in Linux







  * close Firefox and move your profile - it'll be a directory named something like _123456.default_:



    
    
    
     mkdir -p /configs/.mozilla/firefox
     mv ~/.mozilla/123456.default /configs/.mozilla/firefox
    






  * config Firefox to use the new location; change these settings in ~/.mozilla/firefox/profiles.ini:



    
    
     IsRelative=0
     Path=/configs/.mozilla/firefox/123456.default
    






  * check Firefox runs OK - if the Profiles screen pops up, you've got some sort of error




### 
 Mount the Shared Partition in Windows








  * boot into Windows. The partition should be located automatically, you may want to change the drive letter (to say Z:) using Computer Management




### 
 Get Firefox to Locate Configuration in Windows







  * edit the file profiles.ini, located in the directory C:Documents and SettingssoniaApplication DataMozillaFirefox

  * change the following settings



    
    
     IsRelative=0
     Path=Z:.mozillafirefox123456.default
    
    




### 
 Thunderbird






The process is similar for Thunderbird. Under Linux the file is _~/mozilla-thunderbird/profiles.ini_, under Windows _C:Documents and SettingssoniaApplication DataThunderbirdprofiles.ini_.





### 
 Notes







Notes taken from Linux Journal article, June 2006

