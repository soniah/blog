---
title: git patch add
author: Sonia Hamilton
date: 2011-09-13
url: /2011/09/13/git-patch-add/
categories:
  - Linux
tags:
  - Git
---
My new favourite git option:

<!--more-->

<pre>git add -p</pre>

It's like doing an interactive add, then choosing &#8216;p' for patching. From the manual:

*       -p, --patch*

*Interactively choose hunks of patch between the index and the work tree and add them to the index. This gives the user a chance to review the difference before adding modified contents to** the index.* *This effectively runs add --interactive, but bypasses the initial command menu and directly jumps to the patch subcommand. See “Interactive mode” for details.*
