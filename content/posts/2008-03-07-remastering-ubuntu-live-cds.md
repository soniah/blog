---
title: Remastering Ubuntu Live CDs
author: Sonia Hamilton
date: 2008-03-08
url: /2008/03/07/remastering-ubuntu-live-cds/
categories:
  - Other-Tech
tags:
  - Ubuntu
---
A good thread recently on SLUG about how to remaster an Ubuntu Live CD:

<!--more-->

  * how to strip out the installer: Expand the squashfs from the cd to a live ext3 file system, chroot into  
    it and remove ubiquity. Then recompress, generate a new iso with the new squashfs, and you&#8217;re  
    good to go (Ken Caldwell)
  * [How to Customize the Ubuntu Desktop CD][1]
  * [Ubuntu Live CD Creator][2]
  * [Ubuntu Construction Kit][3]

 [1]: https://help.ubuntu.com/community/LiveCDCustomization
 [2]: https://wiki.ubuntu.com/LiveCDCreator
 [3]: http://uck.sourceforge.net/
