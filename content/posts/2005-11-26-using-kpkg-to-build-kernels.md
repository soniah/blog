---
title: using kpkg to build kernels
author: Sonia Hamilton
date: 2005-11-27
url: /2005/11/26/using-kpkg-to-build-kernels/
categories:
  - Linux
tags:
  - Apt
  - Ubuntu
---
using kpkg to build kernels
<!--more-->
### Using kpkg to Build Kernels

See also [How To Compile A Kernel -- The Ubuntu Way][1]

### Preparation

  * make backup floppy

<pre>mkboot /boot/kernel...</pre>

  * add myself to src group (logout & login)<!--more-->

<pre>sudo adduser sonia src</pre>

  * check groups

<pre>groups</pre>

  * install pre-reqs

<pre>apt-get install gcc kernel-package debhelper
 dpkg-dev libncurses5-dev fakeroot g++ build-essential devscripts</pre>

  * configure package compiler name, etc

<pre>vi /etc/kernel-pkg.conf</pre>

  * clean up old sources/links, if required

<pre>cd /usr/src
 sudo rm -rf linux*</pre>

  * download & install debian kernel source

<pre>sudo apt-get install linux-source-2.6.10
 sudo tar jxvf linux-source-2.6.123.tar.bz
 sudo chown -R root.src linux-source-2.6.123
 sudo ln -s linux-source-2.6.123 linux</pre>

Use linux-source (or linux-tree?) for Ubuntu; kernel-source comes from Debian, linux-source comes from Ubuntu. All the dependencies haven't been changed over yet, though, so if you get warnings about &#8220;uninstalled package kernel-source&#8221; even though linux-source is installed, you can safely ignore them. Can sometimes also just download linux-headers-\`uname -r\`

  * check prereqs

<pre>cd /usr/src/linux/scripts
 ./ver_linux</pre>

### Configure

<pre>cd /usr/src/linux
 cp /boot/config_foo .config
 make oldconfig (can also use --config oldconfig in make-kpkg)
 make xconfig or make menuconfig</pre>

  * update debian/changelog (will appear after first build)

<pre>dch -i</pre>

### Build Image

<pre>cd /usr/src/linux
 make-kpkg clean
 fakeroot make-kpkg --initrd --append-to-version=.sonia.001 kernel-image --config oldconfig
 fakeroot make-kpkg --initrd --append-to-version=.sonia.001 kernel_image modules_image
 fakeroot make-kpkg --initrd --append-to-version=.sonia.001 --added-modules=madwifi modules_image</pre>

or some combo of the above&#8230;  
**don't use --revision** -- versions aren't handled correctly

### Install

<pre>cd ..
 dpkg -i kernel-image-2.6.....
 dpkg -i modules...</pre>

  * hold kernel, so not accidently upgraded

<pre>aptitude, search for sonia</pre>

  * find current status

(dpkg -l truncates) ?? gives wrong result&#8230;

<pre>dpkg --get-selections | grep kernel</pre>

backup config from /boot, and .deb files

## distcc

&#8220;Note&#8221;  
If distcc process killed whilst troubleshooting, etc, remove ~/.distcc check all gcc's about the same version, with \`gcc -v\` (first 2 digits important)

  * install pre-reqs (probably excessive)

<pre>apt-get install distcc gcc kernel-package debhelper dpkg-dev libncurses5-dev fakeroot</pre>

  * config /etc/default/distcc

<pre>ALLOWEDNETS="127.0.0.1 192.168.1.0/24"</pre>

  * setup &#8220;masquerade&#8221; directory

<pre>mkdir -p /usr/local/distcc/bin
 cd /usr/local/distcc/bin
 ln -s /usr/bin/distcc c++
 ln -s /usr/bin/distcc cc
 ln -s /usr/bin/distcc g++
 ln -s /usr/bin/distcc gcc</pre>

  * configure environment

<pre>CONCURRENCY_LEVEL=40
 DISTCC_HOSTS="localhost hp mango pomelo armada"
 PATH="/usr/local/distcc/bin:${PATH}"

 export CONCURRENCY_LEVEL DISTCC_HOSTS PATH</pre>

  * see

<http://www.myrddin.org/howto/debian-distcc.php>  
<http://distcc.planetmirror.com/faq.html>

## See also

<http://newbiedoc.sourceforge.net/system/kernel-pkg.html>

<http://myrddin.org/howto/debian-kernel-recompile.php>

<https://www.ubuntulinux.org/wiki/KernelBuildpackageDetailedHowto>

<https://www.ubuntulinux.org/wiki/KernelBuildpackageHowto>

<https://www.ubuntulinux.org/wiki/KernelByHandHowto>

<https://www.ubuntulinux.org/wiki/KernelCompileHowto>

 [1]: http://www.howtoforge.com/kernel_compilation_ubuntu
