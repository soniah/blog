---
author: sonia
comments: true
date: 2009-03-09 07:20:42+00:00
slug: howto-upgrade-ubuntu-with-cds-to-save-bandwidth
title: HowTo upgrade Ubuntu with CDs to save bandwidth
wordpress_id: 292
categories:
- Linux
tags:
- Ubuntu
---

Notes from a recent post on SLUG:



	
  * you need to use one of the "Alternate" versions of Ubuntu, rather than a "Live" version. To quote Jeff Waugh:


_Salient point that I managed to skip: The alternate CD has packages on it,_

_while the Live CD is just a great big compressed image of a filesystem... so_

_it won't help with upgrades at all (yet [1])._

_[1] Years ago there was some inspired brainstorming about ways to do this_

_very cleverly, but I don't imagine it's on the agenda at the moment. Net_

_connected upgrades are just so bloody convenient and simple (and ALL of the_

_developers have fantastic net connections, of course)._



	
  * either insert the cd, and a dialogue box will pop up, or

	
  * mount the .iso, and run the install



    
    sudo mount -o loop loop blah_alternate.iso /media/cdrom
    gksu "sh /media/cdrom/cdromupgrade"


See also [http://aptoncd.sourceforge.net](http://aptoncd.sourceforge.net/) and [http://www.ubuntu.com/getubuntu/upgrading](http://www.ubuntu.com/getubuntu/upgrading)
