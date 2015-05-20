---
author: sonia
comments: true
date: 2012-06-13 04:45:18+00:00
slug: git-ignore-whitespace
title: Git - ignore whitespace
wordpress_id: 1559
categories:
- Linux
tags:
- Git
- Python
---

My new favourite git option:

[sourcecode language="bash"]

% git diff -w

[/sourcecode]

Ignore white space in diffs. Unfortunately, [there doesn't seem to be an option for just ignoring whitespace changes at the start of  line](http://stackoverflow.com/questions/4350678/git-diff-w-ignore-whitespace-only-at-start-end-of-lines) - would be handy for Python.
