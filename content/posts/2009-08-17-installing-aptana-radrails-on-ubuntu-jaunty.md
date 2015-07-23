---
title: Installing Aptana + RadRails on Ubuntu Jaunty
author: Sonia Hamilton
date: 2009-08-17
url: /2009/08/17/installing-aptana-radrails-on-ubuntu-jaunty/
categories:
  - Linux
tags:
  - Ruby on Rails
  - Ubuntu
---
I've always used vim as my main editor, but I thought I'd try RadRails since so many Rails people rave about it.

<!--more-->

Installing it on Ubuntu Jaunty is a bit non-obvious:

  * sudo aptitude install openjdk-6-jre (or your preferred jre)
  * [download][1] and unpack aptana zip to ~/.aptana
  * [download][2] and unpack xulrunner to ~/.xulrunner
  * create a script like ~/bin/aptana:

<pre>#!/bin/bash
MOZILLA_FIVE_HOME=~/.xulrunner
if [ $LD_LIBRARY_PATH ]; then
    LD_LIBRARY_PATH=$MOZILLA_FIVE_HOME:$LD_LIBRARY_PATH
else
    LD_LIBRARY_PATH=$MOZILLA_FIVE_HOME
fi
export MOZILLA_FIVE_HOME LD_LIBRARY_PATH
~/.aptana/AptanaStudio -vm /usr/lib/jvm/java-6-openjdk/bin</pre>

[[ubuntu] Installing Aptana on Jaunty -- Ubuntu Forums][3]

 [1]: http://www.aptana.com/rails
 [2]: http://releases.mozilla.org/pub/mozilla.org/xulrunner/releases/1.8.1.3/contrib/linux-i686/xulrunner-1.8.1.3.en-US.linux-i686-20080128.tar.gz
 [3]: http://ubuntuforums.org/showthread.php?t=1139154
