---
author: sonia
comments: true
date: 2008-03-08 05:20:26+00:00
slug: remastering-ubuntu-live-cds
title: Remastering Ubuntu Live CDs
wordpress_id: 118
categories:
- Other-Tech
tags:
- Ubuntu
---

A good thread recently on SLUG about how to remaster an Ubuntu Live CD:



	
  * how to strip out the installer: Expand the squashfs from the cd to a live ext3 file system, chroot into
it and remove ubiquity. Then recompress, generate a new iso with the new squashfs, and you're
good to go (Ken Caldwell)

	
  * [How to Customize the Ubuntu Desktop CD](https://help.ubuntu.com/community/LiveCDCustomization)

	
  * [Ubuntu Live CD Creator](https://wiki.ubuntu.com/LiveCDCreator)

	
  * [Ubuntu Construction Kit](http://uck.sourceforge.net/)


