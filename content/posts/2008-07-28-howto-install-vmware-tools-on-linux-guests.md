---
title: HowTo Install VMWare Tools on Linux Guests
author: Sonia Hamilton
date: 2008-07-28
url: /2008/07/28/howto-install-vmware-tools-on-linux-guests/
categories:
  - Linux
---
VMWare Tools need to be installed on guests to prevent approx 50% time loss. Here are the steps:

  * on each guest: `yum install gcc gcc-c++`
  * edit guest config files on server to sync time (I usually do all at once): `` cd /var/lib/vmware/Virtual Machines/ ; vi `find . -type f -name "machine.vmx"` `` Add the line `tools.syncTime = "TRUE"`
  * scp VMTools plus kernel files that correspond to kernel (uname -a): `scp VMwareTools-1.0.5-80187.i386.rpm kernel-devel-2.6.18-92.1.6.el5.i686.rpm kernel-headers-2.6.18-92.1.6.el5.i386.rpm guest:.`
  * install rpms; force as sometimes other kernel headers are installed and -U or -i barfs: `rpm -ivh --force *rpm`
  * change root password; logon via VMWare GUI console; run `vmware-config-tools.pl` . Even though the kernel header files have been installed, sometimes the script doesn&#8217;t find them, so you need to manually `ln -s /usr/src/kernel/2.6.fubar/include /usr/src/linux/include`
  * halt each guest
  * restart server (you could just restart all the VMWare processes, but restarting the server is more time efficient, and usually I&#8217;ve only got a short time window to get it right)
  * start each guest via VMWare GUI console
  * ssh back to each guest and reset root password
