---
author: sonia
comments: true
date: 2011-02-13 23:30:24+00:00
slug: resize-terminal-in-solaris
title: Resize Terminal in Solaris
wordpress_id: 800
categories:
- Other-Tech
tags:
- Solaris
---

Sometimes when connecting into a Solaris box via multiple jumps eg Citrix to putty to jumphost to target host, the terminal can get confused about screen size and scramble the output. Use this command to update environment variables with the current terminal size:

    
    eval `resize`


or if $PATH is munged:

    
    eval `/usr/openwin/bin/resize`


Thanks to PeterK.
