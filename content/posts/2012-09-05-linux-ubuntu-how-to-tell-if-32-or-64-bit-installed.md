---
author: sonia
comments: true
date: 2012-09-05
url: /2012/09/05/linux-ubuntu-how-to-tell-if-32-or-64-bit-installed/
title: 'Linux, Ubuntu: how to tell if 32 or 64 bit installed'
categories:
- Linux
tags:
- Ubuntu
---

A question I get regularly from other sysadmins - how to tell if you're running a 32 or 64 bit **install** (vs **CPU**) of Linux?

<!--more-->

Here's one way - use the file command on /sbin/init:

[sourcecode language="bash"]

# on a 32 bit install
% file /sbin/init
/sbin/init: ELF 32-bit LSB executable....

# on a 64 bit install
% file /sbin/init
/sbin/init: ELF 64-bit LSB shared object, x86-64...
[/sourcecode]

**Update**

I got a few comments on this (thank you) saying that I was wrong or "haven't you heard of uname?"...

**1. CPU vs Kernel**

One comment said I was wrong and should use grep against the cpu info:

[sourcecode language="bash"]
$ grep ^flags /proc/cpuinfo | grep lm
[/sourcecode]

Unfortunately the commenter hadn't read my post correctly - I'm interested in whether the _operating system_ is 32/64 bit, not the _cpu_.

**2. Use uname**

Other comments said I should use uname with particular flags (as if I'd never heard of uname before....). Unfortunately the manpage for uname is a good example of [manpage considered harmful](http://en.wikipedia.org/wiki/Considered_harmful). Let's have a look at what it says for the various options:

[sourcecode language="bash"]
% man uname
...
-m, --machine
    print the machine hardware name

-p, --processor
    print the processor type or "unknown"

-i, --hardware-platform
    print the hardware platform or "unknown"
...
[/sourcecode]

What is the difference between the "machine hardware name", the "processor type", and the "hardware platform"? Googling doesn't turn up a good explanation. I could look at the source code for uname, or run uname on a machine I which already has known hardware and interpret the results, then work out the flags to use on the target machine. Or I could just rote-memorise **uname -m** and not know what it means.

Bzzt, fail. I know what the **file** command does, I use it regularly for cross-compiling stuff.

**file /sbin/init** is what I use.
