---
author: sonia
comments: true
date: 2009-07-01 22:39:29+00:00
slug: firefox-default-paper-size-a4
title: Firefox - default paper size A4
wordpress_id: 515
categories:
- Other-Tech
tags:
- Firefox
---

A bug that has been dragging on for [years](https://bugs.launchpad.net/firefox/+bug/10910) - Firefox under Ubuntu (and other distros) doesn't respect the locale setting, and defaults to printing in US Letter size - grrrr...

[Firefox: Guide for the Perplexed](http://www.ts-cyberia.net/firefox.html) seems to suggest:



	
  * about:config

	
  * print.postscript.paper_size set to "A4"


Now to see if it holds, and work out a way to script this (I have a set of bash scripts that keeps all my Ubuntu desktops the same).
