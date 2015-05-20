---
author: sonia
comments: true
date: 2011-09-27 00:28:13+00:00
slug: midnight-commandar-mc-notes
title: Midnight Commandar mc notes
wordpress_id: 1190
categories:
- Linux
tags:
- midnight commander
---

Midnight Commander (mc) is mostly obvious, but there's a few things I regularly forget and have to look up.



	
  * to select (or "tag") multiple items, use the **Insert** key, or **ctrl-t** (eg when on a Macbook)

	
  * use **@** to do an operation on tagged files (or F2 menu, @). For example tag some files, reverse the selection (***** or F9, File, Reverse Selection), then @ **git rm**

	
  * any sort of compressed or package file (.deb, .tgz, .iso, .rpm, etc):

	
    * F3 (view) to get an overview of the package

	
    * **Enter** to browse the package contents, then eg F3 to view the file or F5 to copy the file out




	
  * to jump back and forth to the command line ("subshell support"), use **ctrl-o** to hide mc, then **ctrl-o** to return from the subshell to mc


Taken from [Jane Tembath's MC Tutorial](http://www.trembath.co.za/mctutorial.html). See also the [mc faq](https://www.midnight-commander.org/wiki/doc/faq).
