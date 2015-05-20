---
author: sonia
comments: true
date: 2009-04-14 01:19:19+00:00
slug: rotate-jpeg-images-using-jpegtran
title: Rotate JPEG images using jpegtran
wordpress_id: 385
categories:
- Other-Tech
tags:
- Gimp-Images
---

A quick note on how to rotate jpeg images, not because it's earth-shatteringly smart but so I don't keep having to think every time I want to do it:



	
  * sudo aptitude install libjpeg-progs (contains jpegran on Ubuntu)

	
  * for i in *jpg; do jpegtran -rotate 180 $i > rotated/$i ; done


This can probably be done with other tools (eg imagemagick), but jpegtran has a small manpage :-)
