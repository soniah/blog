---
author: sonia
comments: true
date: 2013-12-24 02:33:38+00:00
slug: change-default-editor-in-debian
title: Change default editor in Debian
wordpress_id: 1925
categories:
- Linux
tags:
- Debian
- Vim
---

How to change the default editor in Debian (for root), as I keep forgetting:

`sudo update-alternatives --config editor`

My [~/.zshrc](http://zshwiki.org/home/) takes care of this for my personal account, but it's nice to change root's settings so a better editor (than nano) comes up when editing (for example), root's crontab, /etc/sudoers (via visudo), and so on.
