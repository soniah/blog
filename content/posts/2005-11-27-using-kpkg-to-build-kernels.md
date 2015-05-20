---
author: sonia
comments: true
date: 2005-11-27 03:40:28+00:00
slug: using-kpkg-to-build-kernels
title: using kpkg to build kernels
wordpress_id: 15
categories:
- Linux
tags:
- Apt
- Ubuntu
---

### Using kpkg to Build Kernels


See also [How To Compile A Kernel - The Ubuntu Way](http://www.howtoforge.com/kernel_compilation_ubuntu)


### Preparation





	
  * make backup floppy



    
     mkboot /boot/kernel...





	
  * add myself to src group (logout & login)<!-- more -->



    
     sudo adduser sonia src





	
  * check groups



    
     groups





	
  * install pre-reqs



    
     apt-get install gcc kernel-package debhelper
     dpkg-dev libncurses5-dev fakeroot g++ build-essential devscripts





	
  * configure package compiler name, etc



    
     vi /etc/kernel-pkg.conf





	
  * clean up old sources/links, if required



    
     cd /usr/src
     sudo rm -rf linux*





	
  * download & install debian kernel source



    
     sudo apt-get install linux-source-2.6.10
     sudo tar jxvf linux-source-2.6.123.tar.bz
     sudo chown -R root.src linux-source-2.6.123
     sudo ln -s linux-source-2.6.123 linux


Use linux-source (or linux-tree?) for Ubuntu; kernel-source comes from Debian, linux-source comes from Ubuntu. All the dependencies haven't been changed over yet, though, so if you get warnings about "uninstalled package kernel-source" even though linux-source is installed, you can safely ignore them. Can sometimes also just download linux-headers-`uname -r`



	
  * check prereqs



    
     cd /usr/src/linux/scripts
     ./ver_linux




### Configure



    
     cd /usr/src/linux
     cp /boot/config_foo .config
     make oldconfig (can also use --config oldconfig in make-kpkg)
     make xconfig or make menuconfig





	
  * update debian/changelog (will appear after first build)



    
     dch -i




### Build Image



    
    
     cd /usr/src/linux
     make-kpkg clean
     fakeroot make-kpkg --initrd --append-to-version=.sonia.001 kernel-image --config oldconfig
     fakeroot make-kpkg --initrd --append-to-version=.sonia.001 kernel_image modules_image
     fakeroot make-kpkg --initrd --append-to-version=.sonia.001 --added-modules=madwifi modules_image


or some combo of the above...
**don't use --revision** - versions aren't handled correctly


### Install



    
     cd ..
     dpkg -i kernel-image-2.6.....
     dpkg -i modules...





	
  * hold kernel, so not accidently upgraded



    
     aptitude, search for sonia





	
  * find current status


(dpkg -l truncates) ?? gives wrong result...

    
     dpkg --get-selections | grep kernel


backup config from /boot, and .deb files


## distcc


"Note"
If distcc process killed whilst troubleshooting, etc, remove ~/.distcc check all gcc's about the same version, with `gcc -v` (first 2 digits important)



	
  * install pre-reqs (probably excessive)



    
    
     apt-get install distcc gcc kernel-package debhelper dpkg-dev libncurses5-dev fakeroot





	
  * config /etc/default/distcc



    
     ALLOWEDNETS="127.0.0.1 192.168.1.0/24"





	
  * setup "masquerade" directory



    
     mkdir -p /usr/local/distcc/bin
     cd /usr/local/distcc/bin
     ln -s /usr/bin/distcc c++
     ln -s /usr/bin/distcc cc
     ln -s /usr/bin/distcc g++
     ln -s /usr/bin/distcc gcc





	
  * configure environment



    
     CONCURRENCY_LEVEL=40
     DISTCC_HOSTS="localhost hp mango pomelo armada"
     PATH="/usr/local/distcc/bin:${PATH}"
    
     export CONCURRENCY_LEVEL DISTCC_HOSTS PATH





	
  * see


[http://www.myrddin.org/howto/debian-distcc.php](http://www.myrddin.org/howto/debian-distcc.php)
[http://distcc.planetmirror.com/faq.html](http://distcc.planetmirror.com/faq.html)


## See also


[http://newbiedoc.sourceforge.net/system/kernel-pkg.html](http://newbiedoc.sourceforge.net/system/kernel-pkg.html)

[http://myrddin.org/howto/debian-kernel-recompile.php](http://myrddin.org/howto/debian-kernel-recompile.php)

[https://www.ubuntulinux.org/wiki/KernelBuildpackageDetailedHowto](https://www.ubuntulinux.org/wiki/KernelBuildpackageDetailedHowto)

[https://www.ubuntulinux.org/wiki/KernelBuildpackageHowto](https://www.ubuntulinux.org/wiki/KernelBuildpackageHowto)

[https://www.ubuntulinux.org/wiki/KernelByHandHowto](https://www.ubuntulinux.org/wiki/KernelByHandHowto)

[https://www.ubuntulinux.org/wiki/KernelCompileHowto](https://www.ubuntulinux.org/wiki/KernelCompileHowto)
