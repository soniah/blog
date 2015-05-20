---
author: sonia
comments: true
date: 2006-02-26 03:36:51+00:00
slug: installing-vmware-on-ubuntu
title: installing VMWare on Ubuntu
wordpress_id: 20
categories:
- Other-Tech
tags:
- Ubuntu
- VMWare
---

See also How To Forge [How To Install VMware Server On Ubuntu](http://www.howtoforge.com/ubuntu_vmware_server)

Install prereqs:

    
     sudo apt-get install build-essential
     sudo apt-get install linux-headers-`uname -r`


Find version of gcc used to compile kernel:

    
     cat /proc/version
     ls /usr/bin/gcc*


Install right version of gcc if required:

    
     sudo apt-get install gcc-3.4
     sudo apt-get install g++-3.4


Compile with environment variable pointing to gcc:

    
     export CC=/usr/bin/gcc-3.4
     sudo ./vmware-install.pl


Useful links:
[UbuntuWiki1](https://wiki.ubuntu.com/InstallingVMWare?highlight=%28vmware%29), [UbuntuWiki2](https://wiki.ubuntu.com/InstallingVMWare?action=show&redirect=VmWare+guide%3A+How+to+install+VMware+in+Breezy)

(and search [https://wiki.ubuntu.com](https://wiki.ubuntu.com) on VMWare)
