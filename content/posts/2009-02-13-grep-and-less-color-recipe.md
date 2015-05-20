---
author: sonia
comments: true
date: 2009-02-13 05:26:14+00:00
slug: grep-and-less-color-recipe
title: grep and less color recipe
wordpress_id: 241
categories:
- Linux
---

Just a quick recipe for colouring grep output in less, because I always have to look it up:

    
    grep --color=always -A 5 -r foo * | less -R
