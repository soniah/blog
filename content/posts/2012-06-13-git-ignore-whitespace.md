---
author: sonia
date: 2012-06-13
url: /2012/06/13/git-ignore-whitespace/
title: Git - ignore whitespace
categories:
- Linux
tags:
- Git
- Python
---

My new favourite git option:

<!--more-->

{{< highlight bash >}}

% git diff -w

{{< /highlight >}}

Ignore white space in diffs. Unfortunately, [there doesn't seem to be an option for just ignoring whitespace changes at the start of  line](http://stackoverflow.com/questions/4350678/git-diff-w-ignore-whitespace-only-at-start-end-of-lines) - would be handy for Python.
