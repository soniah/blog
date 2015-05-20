---
author: sonia
comments: true
date: 2009-01-08 06:05:45+00:00
slug: vim-modelines
title: vim modelines
wordpress_id: 205
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

I can never remember what those comments that change vim settings are called, and spend hours trawling through vim's help. They're called **modelines. :help modeline** brings up the documentation.

_Some typical modelines for copying and pasting:_

**Go**

    
    //
    // vim: tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab tw=72
    // run 'go fmt' before checking in your code!
    //


**Text files**

    
    # vim:tw=75
    # vim:textwidth=75


**Shell/Bash**

    
    # vim: ai ts=2 sw=2 et sts=2 ft=sh
    # vim: autoindent tabstop=2 shiftwidth=2 expandtab softtabstop=2 filetype=sh


**Ruby**

    
    # vim: ai ts=2 sts=2 et sw=2 ft=ruby
    # vim: autoindent tabstop=2 shiftwidth=2 expandtab softtabstop=2 filetype=ruby


**Python**

    
    # vim: ai ts=4 sts=4 et sw=4 ft=python
    # vim: autoindent tabstop=4 shiftwidth=4 expandtab softtabstop=4 filetype=python


Or when using vi (eg on Solaris) INVESTIGATE FURTHER:

    
    :set sw=4


**Perl**

    
    # vim: ai ts=4 sts=4 et sw=4 ft=perl
    # vim: autoindent tabstop=4 shiftwidth=4 expandtab softtabstop=4 filetype=perl


**LISP/Scheme**

    
    ; vim: ft=lisp
