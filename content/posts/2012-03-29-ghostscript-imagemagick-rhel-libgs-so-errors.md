---
author: sonia
comments: true
date: 2012-03-29
url: /2012/03/29/ghostscript-imagemagick-rhel-libgs-so-errors/
title: Ghostscript ImageMagick RHEL libgs.so errors
categories:
- Linux
tags:
- RHEL
---

A little problem I came across today. When you install ImageMagick (IM) on [RHEL](http://en.wikipedia.org/wiki/Red_Hat_Enterprise_Linux) (or [OEL](http://en.wikipedia.org/wiki/Oracle_Enterprise_Linux) or similar), IM fails when converting pdfs. You can see the problem (**libgs.so**) by logging the output of IM. For example, here's an attempted conversion of **test.pdf** to **test.tif**:

    
    % convert -debug all -log "%u %m:%l %e" test.pdf test.tif 2>&1 | less


This gives errors like this:

    
    0.000u module.c:1278 unable to load module `/usr/lib/ImageMagick-6.7.5<wbr>/modules-Q16/coders/<a href="http://www.google.com/url?q=http%3A%2F%2Fpdf.la&sa=D&sntz=1&usg=AFQjCNGP84_LsnHfS4qb4LezlUoLCScTAA" target="_blank">pdf.la</a>': libgs.so.8: cannot open shared object file: No such file or directory</wbr>


So, I downloaded and unpacked a RHEL ghostscript rpm - it turns out that the rpms have symlinks to **libgs.so** in the package, but no **libgs.so** :-(

    
    /var/tmp/usr/lib # ls -al libgs.so*
    lrwxrwxrwx 1 root root    13 Mar 28 20:41 libgs.so -> libgs.so.8.15
    lrwxrwxrwx 1 root root    13 Mar 28 20:41 libgs.so.8 -> libgs.so.8.15


Easy you think, just install something like **libgs.123.rpm**, and everything will work. But there isn't such an rpm...

So, download the ghostscript source, build it as a shared library (using the not quite obvious **make so**), copy the lib to **/usr/lib**, fix up the symlinks. Then all is  _happiness and light_:

    
    % cd /var/tmp
    % wget http://downloads.ghostscript.com/public/ghostscript-8.71.tar.xz
    % tar zxvf ghostscript-8.71.tar.xz
    % cd ghostscript-8.71
    % ./configure
    % make so
    % rm -i /usr/lib/libgs.so*
    % cp sobin/libgs.so.8.71 /usr/lib
    % ln -s libgs.so.8.71 libgs.so
    % ln -s libgs.so.8.71 libgs.so.8


Oh the pain - why can't the world just use [The Universal Operation System - Debian](http://www.debian.org/)?!
