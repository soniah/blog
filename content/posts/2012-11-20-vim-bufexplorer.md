---
author: sonia
comments: true
date: 2012-11-20
url: /2012/11/20/vim-bufexplorer/
title: vim - bufexplorer
categories:
- Linux
tags:
- Golang
- Vim
---

[Bufexplorer](http://www.vim.org/scripts/script.php?script_id=42) - my new favourite add-on for vim.

Why do I like it? It allows you to emulate the buffer list feature of emacs, as well as switch between horizontal/vertical buffer splits and find recently edited files. All this can already be done with vim buffers, but bufexplorer makes it easy.

Why don't I just use emacs? Because as sysadmin/devop I'm often working on other people's servers, and I don't want to go installing buckets of stuff everywhere - vim is usually installed.

I found the best way to use bufexplorer is to open up all possible source files (eg **vim src/*.go other/*.go**) at the start of an editing session, then just skip between them (shown here with the excellent [xMonad](http://xmonad.org/) window manager, [GNU Screen](https://www.gnu.org/software/screen/), and [Gnome Terminal](http://library.gnome.org/users/gnome-terminal/stable/gnome-terminal-get-started.html.en)):

[![](http://blog.snowfrog.net/wp-content/uploads/2012/11/bufexp.png)](http://blog.snowfrog.net/wp-content/uploads/2012/11/bufexp.png)
