---
author: sonia
comments: true
date: 2006-11-11 03:45:11+00:00
slug: rebuild-a-deb-package
title: Rebuild a .deb package
wordpress_id: 47
categories:
- Linux
tags:
- Ubuntu
---

To rebuild a package, I usually:



	
  * apt-get source package

	
  * cd package

	
  * dch -i


This will open debian/changelog , then you can increment the package version/release/etc, put in changelog info, etc

	
  * dpkg-buildpackage -rfakeroot -uc -b


This will only build the binary packages, no source stuff will be spat out. before you run this, make sure that package-name/debian/control is executable.

At step 4, it might complain about unsatisfied build dependancies. I'm pretty sure there's a nice apt/dpkg automatic way of doing this, but I can't remember what is it. It'll tell you anyhow and you can then do the usual apt-get install blah

I suspect you mean package-name/debian/rules here. debian/control contains the information for the source and binary packages built from and contained in the package, whereas debian/rules contains instructions on how to build them.

(David Gillies & Steve Kowalik, SLUG list)
