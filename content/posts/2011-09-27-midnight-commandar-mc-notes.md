---
title: Midnight Commandar mc notes
author: Sonia Hamilton
date: 2011-09-27
url: /2011/09/27/midnight-commandar-mc-notes/
categories:
  - Linux
tags:
  - midnight commander
---
Midnight Commander (mc) is mostly obvious, but there&#8217;s a few things I regularly forget and have to look up.

  * to select (or &#8220;tag&#8221;) multiple items, use the **Insert** key, or **ctrl-t** (eg when on a Macbook)
  * use **@** to do an operation on tagged files (or F2 menu, @). For example tag some files, reverse the selection (***** or F9, File, Reverse Selection), then @ **git rm**
  * any sort of compressed or package file (.deb, .tgz, .iso, .rpm, etc): 
      * F3 (view) to get an overview of the package
      * **Enter** to browse the package contents, then eg F3 to view the file or F5 to copy the file out
  * to jump back and forth to the command line (&#8220;subshell support&#8221;), use **ctrl-o** to hide mc, then **ctrl-o** to return from the subshell to mc

Taken from [Jane Tembath&#8217;s MC Tutorial][1]. See also the [mc faq][2].

 [1]: http://www.trembath.co.za/mctutorial.html
 [2]: https://www.midnight-commander.org/wiki/doc/faq
