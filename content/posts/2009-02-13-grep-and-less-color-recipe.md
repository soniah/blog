---
title: grep and less color recipe
author: Sonia Hamilton
date: 2009-02-13
url: /2009/02/13/grep-and-less-color-recipe/
categories:
  - Linux
---
Just a quick recipe for colouring grep output in less, because I always have to look it up:

<pre>grep --color=always -A 5 -r foo * | less -R</pre>
