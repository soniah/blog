---
author: sonia
comments: true
date: 2006-10-22 02:41:42+00:00
slug: checkinstall-build-debs-from-targzs
title: checkinstall - build .deb’s from .tar.gz’s
wordpress_id: 46
categories:
- Linux
tags:
- Ubuntu
---


    
    sudo aptitude install checkinstall
    wget foo.tgz
    tar zxvf foo.tgz
    cd foo
    ./configure --prefix=/usr && make
    sudo checkinstall make install
