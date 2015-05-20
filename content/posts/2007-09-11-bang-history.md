---
author: sonia
comments: true
date: 2007-09-11 04:23:30+00:00
slug: bang-history
title: bang history
wordpress_id: 74
categories:
- Other-Tech
tags:
- Shell
---

There are three fields (separated by colons) that can be manipulated using the bang history command:

`EventDesignator:WordDesignator:Modifier`

<!-- more -->**Event Designator**

An event designator is a reference to a command line entry in the history list - `man bash` for more.

`!n` - Refer to command line n.
`!-n` - Refer to the current command line minus n.
`!!` - Refers to the previous command (synonym for ‘!-1) - useful if you after typing a command you release you need to add sudo: vi /etc/apt/source.list, error, sudo !!

_For example:_
`
$ history | tail -3
195  echo foo
196  echo bar
197  history | tail -3
$ !195
echo foo
foo
$ !-3
echo bar
bar`

**Word Designator**

Word designators are used to select desired words from the event- `man bash` for more. An event designator such as !! is followed by a colon then a word designator.

`Numbers`, where 0 is the command name and 1 the first argument, 2 the second arg, etc
`*` for everything except the command name
`^` for the first argument, $ for the last argument
`x-y` for a range, where x and y can be numbers or ^,$
`-y, x*, x-` and other combinations

_For example:_
`
$ echo foo bar qux
foo bar qux
$ echo !!:0
echo echo
echo
$ echo foo bar qux
foo bar qux
$ echo !!:1-2
echo foo bar
foo bar
$ echo foo bar qux
foo bar qux
$ echo !!:2-$
echo bar qux
bar qux`

**Modifier**

Modifies the word picked out so far - `man bash` for more.

`h` - remove a trailing file name component, leaving only the head.
`t` - remove all leading file name components, leaving the tail.
`r` - remove a trailing suffix of the form .xxx, leaving the basename.
_etc..._

_For example:_
`
$ ls /etc/apt/sources.list
/etc/apt/sources.list
$ cd !:1:h
cd /etc/apt
$ cat !-2:1:t
cat sources.list
$ cd; ls /etc/apt/sources.list
/etc/apt/sources.list
$ ls !:1:r
ls /etc/apt/sources
$ ls !:1:t:r
ls sources
!:s/apt/foo/
ls /etc/foo/sources.list
`
Notice how multiple operators can be combined, and how **!!** can be replaced with **!** if immediately followed by a **colon**.
