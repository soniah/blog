---
title: git patch add
author: Sonia Hamilton
date: 2011-09-13
url: /2011/09/13/git-patch-add/
jabber_published:
  - 1315875894
categories:
  - Linux
tags:
  - Git
---
My new favourite git option:

<pre>git add -p</pre>

It&#8217;s like doing an interactive add, then choosing &#8216;p&#8217; for patching. From the manual:

*       -p, &#8211;patch*

*Interactively choose hunks of patch between the index and the work tree and add them to the index. This gives the user a chance to review the difference before adding modified contents to** the index.* *This effectively runs add &#8211;interactive, but bypasses the initial command menu and directly jumps to the patch subcommand. See “Interactive mode” for details.*
