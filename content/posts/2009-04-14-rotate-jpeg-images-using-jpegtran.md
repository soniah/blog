---
title: Rotate JPEG images using jpegtran
author: Sonia Hamilton
date: 2009-04-14
url: /2009/04/14/rotate-jpeg-images-using-jpegtran/
categories:
  - Other-Tech
tags:
  - Gimp-Images
---
A quick note on how to rotate jpeg images, not because it's earth-shatteringly smart but so I don't keep having to think every time I want to do it:

<!--more-->

  * sudo aptitude install libjpeg-progs (contains jpegran on Ubuntu)
  * for i in *jpg; do jpegtran -rotate 180 $i > rotated/$i ; done

This can probably be done with other tools (eg imagemagick), but jpegtran has a small manpage :-)
