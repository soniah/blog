---
author: sonia
comments: true
date: 2009-11-19 05:21:39+00:00
slug: cygwin-zsh-zsh-compinit-insecure-directories
title: 'cygwin: zsh: zsh compinit: insecure directories'
wordpress_id: 618
categories:
- Other-Tech
tags:
- Cygwin
- Shell
- Zsh
---

Using cygwin under Windows, I've setup my shell as zsh by editing the launch script:

    
    @echo off
    C:
    chdir C:cygwinbin
    zsh -l -i
    


Unfortunately, this gives a nasty error everytime the shell is started up, due to Cygwin installing zsh incorrectly:

    
    zsh compinit: insecure directories, run compaudit for list.
    Ignore insecure directories and continue [y] or abort compinit [n]? y


Solution, thanks to [wezm.net](http://www.wezm.net/2008/09/zsh-cygwin-and-insecure-directories/):

    
    compaudit | xargs chmod g-w
