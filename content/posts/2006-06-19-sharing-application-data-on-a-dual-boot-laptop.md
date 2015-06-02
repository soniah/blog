---
title: sharing application data on a dual boot laptop
author: Sonia Hamilton
date: 2006-06-20
url: /2006/06/19/sharing-application-data-on-a-dual-boot-laptop/
categories:
  - Linux
tags:
  - Windows
---
sharing application data on a dual boot laptop
<!--more-->
I dual boot my laptop between Linux and Windows -- mostly Linux, but occasionally Windows. Here&#8217;s how to make applications like Firefox, Thunderbird, etc share their configuration -- especially useful for bookmarks and saved passwords for Firefox. This how-to presumes that your Linux username is *sonia* and your user id is *1000* (check by running the **id** function). It also presumes that you can see system folders in Windows -- setup in Windows Explorer under Tools, Options, View, Show hidden files and Folders, Click *Apply to All Folders*.

### Create a Shared Partition  


First you need a filesystem that will be shared between both Linux and Windows -- it has to be FAT, as this is the only filesystem that both operating systems (easily) read. This may involve shrinking an existing filesystem and partition. (You could of course lose data doing this, so check your backups first). 

The key idea here is that each partition (eg /dev/hda6) has a filesystem (eg Reiserfs or Ext3) located inside. To shrink a partition, the filesystem needs to be shrunk first; the easiest way to do this is to shrink the filesystem too small, delete the partition and recreate it smaller, then expand the filesystem to fit the newly shrunk partition: 

  * boot off Knoppix 

  * shrink the *filesystem* before the *partition*. For example if using ReiserFS and hda6: 

<pre>resize_reiserfs -s 10G /dev/hda6
</pre>

  * using fdisk/cfdisk, resize the *partition* by deleting the existing partition and recreating it with a smaller size. Ensure the new *partition* is **larger** than the resized *filesystem*. 
  * expand the previous *filesystem* so it fills the shrunk *partition*: 

<pre>resize_reiserfs /dev/hda6
</pre>

  * check and mount the shrunk partition before creating the new partition and filesystem, in case you&#8217;ve made a mistake 

<pre>reiserfsck /dev/hda6
 mount /dev/hda6
</pre>

  * in fdisk/cfdisk, also create the new partition (/dev/hda7 in this case), set the type to 0C (Windows FAT LBA) 
  * create the new shared *filesystem*: 

<pre>mkfs.vfat /dev/hda7
</pre>

### Mount the Shared Partition in Linux</p> 

  * create a mount directory 

<pre>cd /
 sudo mkdir /configs
 sudo chown 1000. /configs
</pre>

  * add an entry to /etc/fstab to mount at boot: 

<pre>/dev/hda7       /configs        vfat    defaults,uid=1000,gid=1000        0       0
</pre>

  * reboot to linux and check the partition mounts OK by trying to create a test file in /configs *using your normal user account*, not root 

### Get Firefox to Locate Configuration in Linux  


  * close Firefox and move your profile -- it&#8217;ll be a directory named something like *123456.default*: 

<pre>mkdir -p /configs/.mozilla/firefox
 mv ~/.mozilla/123456.default /configs/.mozilla/firefox
</pre>

  * config Firefox to use the new location; change these settings in ~/.mozilla/firefox/profiles.ini: 

<pre>IsRelative=0
 Path=/configs/.mozilla/firefox/123456.default
</pre>

  * check Firefox runs OK -- if the Profiles screen pops up, you&#8217;ve got some sort of error 

### Mount the Shared Partition in Windows</p> 

  * boot into Windows. The partition should be located automatically, you may want to change the drive letter (to say Z:) using Computer Management 

### Get Firefox to Locate Configuration in Windows  


  * edit the file profiles.ini, located in the directory C:Documents and SettingssoniaApplication DataMozillaFirefox 
  * change the following settings 

<pre>IsRelative=0
 Path=Z:.mozillafirefox123456.default

</pre>

### Thunderbird  


The process is similar for Thunderbird. Under Linux the file is *~/mozilla-thunderbird/profiles.ini*, under Windows *C:Documents and SettingssoniaApplication DataThunderbirdprofiles.ini*. 

### Notes  


Notes taken from Linux Journal article, June 2006
