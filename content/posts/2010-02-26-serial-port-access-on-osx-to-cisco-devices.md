---
title: Serial Port Access on OSX to Cisco devices
author: Sonia Hamilton
date: 2010-02-26
url: /2010/02/26/serial-port-access-on-osx-to-cisco-devices/
email_notification:
  - 1267144104
tagazine-media:
  - 'a:7:{s:7:"primary";s:0:"";s:6:"images";a:0:{}s:6:"videos";a:0:{}s:11:"image_count";s:1:"0";s:6:"author";s:7:"1173694";s:7:"blog_id";s:7:"1724069";s:9:"mod_stamp";s:19:"2010-03-01 06:07:57";}'
categories:
  - Other-Tech
tags:
  - Cisco
  - Gnu Screen
  - OSX
  - Solaris
---
How to connect to a Cisco device (or other serial devices) using OSX and a USB to Serial converter (eg ATEN). Googling, everyone says to use zterm, but I couldn&#8217;t get it to work (and zterm looks and feels like a toy).

This probably isn&#8217;t the &#8220;Mac way&#8221; of doing things, but </whatever>&#8230;

Install [PL2303 USB to Serial Driver for Mac OS X][1], restart :-(

<pre>sudo port selfupdate
sudo port upgrade outdated
sudo port install minicom</pre>

Work out tty of USB-Serial converter:

<pre>ls /dev/tty* &gt; pre</pre>

Plug in USB-Serial converter.

<pre>ls /dev/tty* &gt; pst
% diff pre pst
3a4
&gt; /dev/tty.PL2303-00002006</pre>

Link up to make life easier:

<pre>cd /dev
sudo ln -s tty.PL2303-00002006 ttyusb</pre>

Setup minicom, and use colour:

<pre>sudo minicom -s -c on</pre>

Setup defaults to:

  * /dev/ttyusb (ctrl-A, O, Serial Port Setup)
  * 8N1
  * 9600
  * no hardware or software flow control
  * init string empty (so garbage doesn&#8217;t appear on screen when you connect) &#8211; ctrl-A, O, Init string
  * save settings as default (ctrl-A, O, Save setup as dfl)

Always use colour:

  * add export MINICOM=&#8221;-c on&#8221; to shell rc file (~/.bashrc, .~/zshrc, etc)

Connect (sudo minicom), hit enter a few times, and you should be on the device.

 [1]: http://sourceforge.net/projects/osx-pl2303/
