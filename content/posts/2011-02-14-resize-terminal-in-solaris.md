---
title: Resize Terminal in Solaris
author: Sonia Hamilton
date: 2011-02-13
url: /2011/02/14/resize-terminal-in-solaris/
jabber_published:
  - 1297639825
categories:
  - Other-Tech
tags:
  - Solaris
---
Sometimes when connecting into a Solaris box via multiple jumps eg Citrix to putty to jumphost to target host, the terminal can get confused about screen size and scramble the output. Use this command to update environment variables with the current terminal size:

<pre>eval `resize`</pre>

or if $PATH is munged:

<pre>eval `/usr/openwin/bin/resize`</pre>

Thanks to PeterK.
