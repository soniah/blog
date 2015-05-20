---
title: checkinstall – build .deb’s from .tar.gz’s
author: Sonia Hamilton
date: 2006-10-22
url: /2006/10/21/checkinstall-build-debs-from-targzs/
categories:
  - Linux
tags:
  - Ubuntu
---
<pre>sudo aptitude install checkinstall
wget foo.tgz
tar zxvf foo.tgz
cd foo
./configure --prefix=/usr && make
sudo checkinstall make install</pre>
