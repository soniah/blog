---
title: Rebuild a .deb package
author: Sonia Hamilton
date: 2006-11-11
url: /2006/11/10/rebuild-a-deb-package/
categories:
  - Linux
tags:
  - Ubuntu
---
To rebuild a package, I usually:
<!--more-->

  * apt-get source package
  * cd package
  * dch -i

This will open debian/changelog , then you can increment the package version/release/etc, put in changelog info, etc

  * dpkg-buildpackage -rfakeroot -uc -b

This will only build the binary packages, no source stuff will be spat out. before you run this, make sure that package-name/debian/control is executable.

At step 4, it might complain about unsatisfied build dependancies. I&#8217;m pretty sure there&#8217;s a nice apt/dpkg automatic way of doing this, but I can&#8217;t remember what is it. It&#8217;ll tell you anyhow and you can then do the usual apt-get install blah

I suspect you mean package-name/debian/rules here. debian/control contains the information for the source and binary packages built from and contained in the package, whereas debian/rules contains instructions on how to build them.

(David Gillies & Steve Kowalik, SLUG list)
