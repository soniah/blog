---
title: vim modelines
author: Sonia Hamilton
date: 2009-01-08
url: /2009/01/08/vim-modelines/
categories:
  - Linux
tags:
  - Bash
  - Lisp
  - Perl
  - Python
  - Ruby
  - Shell
  - Vim
---
I can never remember what those comments that change vim settings are called, and spend hours trawling through vim&#8217;s help.

<!--more-->

They&#8217;re called **modelines. :help modeline** brings up the documentation.

*Some typical modelines for copying and pasting:*

**Go**

<pre>//
// vim: tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab tw=72
// run 'go fmt' before checking in your code!
//</pre>

**Text files**

<pre># vim:tw=75
# vim:textwidth=75</pre>

**Shell/Bash**

<pre># vim: ai ts=2 sw=2 et sts=2 ft=sh
# vim: autoindent tabstop=2 shiftwidth=2 expandtab softtabstop=2 filetype=sh</pre>

**Ruby**

<pre># vim: ai ts=2 sts=2 et sw=2 ft=ruby
# vim: autoindent tabstop=2 shiftwidth=2 expandtab softtabstop=2 filetype=ruby</pre>

**Python**

<pre># vim: ai ts=4 sts=4 et sw=4 ft=python
# vim: autoindent tabstop=4 shiftwidth=4 expandtab softtabstop=4 filetype=python</pre>

Or when using vi (eg on Solaris) INVESTIGATE FURTHER:

<pre>:set sw=4</pre>

**Perl**

<pre># vim: ai ts=4 sts=4 et sw=4 ft=perl
# vim: autoindent tabstop=4 shiftwidth=4 expandtab softtabstop=4 filetype=perl</pre>

**LISP/Scheme**

<pre>; vim: ft=lisp</pre>
