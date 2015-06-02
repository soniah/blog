---
title: bang history
author: Sonia Hamilton
date: 2007-09-11
url: /2007/09/10/bang-history/
categories:
  - Other-Tech
tags:
  - Shell
---
There are three fields (separated by colons) that can be manipulated using the bang history command:

<!--more-->

`EventDesignator:WordDesignator:Modifier`

<!--more-->

**Event Designator**

An event designator is a reference to a command line entry in the history list -- `man bash` for more.

`!n` -- Refer to command line n.  
`!-n` -- Refer to the current command line minus n.  
`!!` -- Refers to the previous command (synonym for ‘!-1) -- useful if you after typing a command you release you need to add sudo: <tt>vi /etc/apt/source.list, error, sudo !!</tt>

*For example:*  
`<br />
$ history | tail -3<br />
195  echo foo<br />
196  echo bar<br />
197  history | tail -3<br />
$ !195<br />
echo foo<br />
foo<br />
$ !-3<br />
echo bar<br />
bar`

**Word Designator**

Word designators are used to select desired words from the event- `man bash` for more. An event designator such as !! is followed by a colon then a word designator.

`Numbers`, where 0 is the command name and 1 the first argument, 2 the second arg, etc  
`*` for everything except the command name  
`^` for the first argument, $ for the last argument  
`x-y` for a range, where x and y can be numbers or ^,$  
`-y, x*, x-` and other combinations

*For example:*  
`<br />
$ echo foo bar qux<br />
foo bar qux<br />
$ echo !!:0<br />
echo echo<br />
echo<br />
$ echo foo bar qux<br />
foo bar qux<br />
$ echo !!:1-2<br />
echo foo bar<br />
foo bar<br />
$ echo foo bar qux<br />
foo bar qux<br />
$ echo !!:2-$<br />
echo bar qux<br />
bar qux`

**Modifier**

Modifies the word picked out so far -- `man bash` for more.

`h` -- remove a trailing file name component, leaving only the head.  
`t` -- remove all leading file name components, leaving the tail.  
`r` -- remove a trailing suffix of the form .xxx, leaving the basename.  
*etc&#8230;*

*For example:*  
`<br />
$ ls /etc/apt/sources.list<br />
/etc/apt/sources.list<br />
$ cd !:1:h<br />
cd /etc/apt<br />
$ cat !-2:1:t<br />
cat sources.list<br />
$ cd; ls /etc/apt/sources.list<br />
/etc/apt/sources.list<br />
$ ls !:1:r<br />
ls /etc/apt/sources<br />
$ ls !:1:t:r<br />
ls sources<br />
!:s/apt/foo/<br />
ls /etc/foo/sources.list<br />
`  
Notice how multiple operators can be combined, and how **!!** can be replaced with **!** if immediately followed by a **colon**.
