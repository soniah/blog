---
author: sonia
comments: true
date: 2011-09-13 01:04:53+00:00
slug: git-patch-add
title: git patch add
wordpress_id: 1188
categories:
- Linux
tags:
- Git
---

My new favourite git option:

    
        git add -p


It's like doing an interactive add, then choosing 'p' for patching. From the manual:

_       -p, --patch_

_Interactively choose hunks of patch between the index and the work tree and add them to the index. This gives the user a chance to review the difference before adding modified contents to__ the index._ _This effectively runs add --interactive, but bypasses the initial command menu and directly jumps to the patch subcommand. See “Interactive mode” for details._
