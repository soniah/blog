---
title: 'cygwin: zsh: zsh compinit: insecure directories'
author: Sonia Hamilton
date: 2009-11-19
url: /2009/11/19/cygwin-zsh-zsh-compinit-insecure-directories/
categories:
  - Other-Tech
tags:
  - Cygwin
  - Shell
  - Zsh
---
Using cygwin under Windows, I&#8217;ve setup my shell as zsh by editing the launch script:

<pre>@echo off
C:
chdir C:cygwinbin
zsh -l -i
</pre>

Unfortunately, this gives a nasty error everytime the shell is started up, due to Cygwin installing zsh incorrectly:

<pre>zsh compinit: insecure directories, run compaudit for list.
Ignore insecure directories and continue [y] or abort compinit [n]? y</pre>

Solution, thanks to [wezm.net][1]:

<pre>compaudit | xargs chmod g-w</pre>

 [1]: http://www.wezm.net/2008/09/zsh-cygwin-and-insecure-directories/
