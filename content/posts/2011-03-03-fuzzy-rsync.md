---
author: sonia
comments: true
date: 2011-03-03 12:18:04+00:00
slug: fuzzy-rsync
title: fuzzy rsync
wordpress_id: 874
categories:
- Linux
tags:
- Rsync
---

A nice option I discovered in [rsync](http://en.wikipedia.org/wiki/Rsync) - the **--fuzzy** option. If a destination file is missing rsync looks for a similar file in the same directory, and copies/moves it. The current "similar" algorithm is "identical size and modified time", or "similarly-named". For example:

    
    rsync foo/ example.com:video/foo/ --fuzzy --delete-delay
    ...
    sent 69712 bytes  received 118992 bytes  75481.60 bytes/sec   <-- small amount of data xferred
    total size is 4966997090  speedup is 26321.63                 <-- woohoo! big speed up


Notice the **--delete-delay **option is fairly much required, as rsync by default does a **--delete-before**, thus removing the base file before it can be copied/moved.

When to use this? When you're rsync'ing large binary files, and the only change you've made is to copy or rename files within the same directory. Which is often what I'm doing - at work moving around isos or install packages, and at home organising [BJJ](http://en.wikipedia.org/wiki/Brazilian_Jiu-Jitsu) videos :-)

**Addendum**

Also, the **--partial** and **--partial-dir** options are handy when working with large binary files. Tells rsync not to delete partially tranferred files if your transfer gets interrupted, for example by a network glitch. (Thanks AndyS).
