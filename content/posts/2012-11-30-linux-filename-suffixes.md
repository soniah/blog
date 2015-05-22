---
author: sonia
comments: true
date: 2012-11-30
url: /2012/11/30/linux-filename-suffixes/
title: Linux filename suffixes
categories:
- Linux
---

When creating files in Linux (and other OS's) there's the usual convention of **.txt** for text files, **.c** for C files, etc - you just pick them up as you go along.

But there's actually a [manpage](https://www.kernel.org/doc/man-pages/online/pages/man7/suffixes.7.html) that lists the common conventions - "who knew"?

    
    % man suffixes
    SUFFIXES(7)                           Linux Programmer's Manual                           SUFFIXES(7)
    
    NAME
           suffixes - list of file suffixes
    
    DESCRIPTION
           It  is  customary to indicate the contents of a file with the file suffix, which consists of a
           period, followed by one or more letters.  Many standard utilities, such as compilers, use this
    ...
            .asm         │ (GNU) assembler source file
            .au          │ Audio sound file
            .aux         │ LaTeX auxiliary file
    ...
