---
title: Firefox – default paper size A4
author: Sonia Hamilton
date: 2009-07-01
url: /2009/07/02/firefox-default-paper-size-a4/
categories:
  - Other-Tech
tags:
  - Firefox
---
A bug that has been dragging on for [years][1] -- Firefox under Ubuntu (and other distros) doesn't respect the locale setting, 


<!--more-->

and defaults to printing in US Letter size -- grrrr.

[Firefox: Guide for the Perplexed][2] seems to suggest:

  * about:config
  * print.postscript.paper_size set to "A4&#8243;

Now to see if it holds, and work out a way to script this (I have a set of bash scripts that keeps all my Ubuntu desktops the same).

 [1]: https://bugs.launchpad.net/firefox/+bug/10910
 [2]: http://www.ts-cyberia.net/firefox.html
