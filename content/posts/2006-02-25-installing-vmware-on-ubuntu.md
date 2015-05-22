---
title: installing VMWare on Ubuntu
author: Sonia Hamilton
date: 2006-02-26
url: /2006/02/25/installing-vmware-on-ubuntu/
categories:
  - Other-Tech
tags:
  - Ubuntu
  - VMWare
---
installing VMWare on Ubuntu
<!--more-->
See also How To Forge [How To Install VMware Server On Ubuntu][1]

Install prereqs:

<pre>sudo apt-get install build-essential
 sudo apt-get install linux-headers-`uname -r`</pre>

Find version of gcc used to compile kernel:

<pre>cat /proc/version
 ls /usr/bin/gcc*</pre>

Install right version of gcc if required:

<pre>sudo apt-get install gcc-3.4
 sudo apt-get install g++-3.4</pre>

Compile with environment variable pointing to gcc:

<pre>export CC=/usr/bin/gcc-3.4
 sudo ./vmware-install.pl</pre>

Useful links:  
[UbuntuWiki1][2], [UbuntuWiki2][3]

(and search <https://wiki.ubuntu.com> on VMWare)

 [1]: http://www.howtoforge.com/ubuntu_vmware_server
 [2]: https://wiki.ubuntu.com/InstallingVMWare?highlight=%28vmware%29
 [3]: https://wiki.ubuntu.com/InstallingVMWare?action=show&redirect=VmWare+guide%3A+How+to+install+VMware+in+Breezy
