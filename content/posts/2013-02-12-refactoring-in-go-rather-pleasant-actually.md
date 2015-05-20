---
author: sonia
comments: true
date: 2013-02-12 01:12:32+00:00
slug: refactoring-in-go-rather-pleasant-actually
title: refactoring in Go - rather pleasant actually...
wordpress_id: 1790
categories:
- Linux
tags:
- Golang
- Perl
- Python
- Ruby
- Vim
---

I've just finished refactoring a large Go program, and the process was rather.... pleasant.

Static typing catches all those obscure errors I wouldn't think about in a scripting language (Python, Perl, Ruby, etc). My process is:



	
  * type **:make** in vim (I have a dummy Makefile in my Go project just for vim)

	
  * vim jumps cursor to error ([vim quickfix list](http://vimdoc.sourceforge.net/htmldoc/quickfix.html))

	
  * "oh, I shouldn't do that" - fix (type type type)

	
  * start again


Finish rather sooner than expected, run tests, smile in knowledge program is working _properly_.

**Update**

To quickly setup the **make** command for Go, type this in a Vim window:

[sourcecode language="shell"]
:setlocal makeprg=go\ build\ \.
[/sourcecode]

Or even better configure vim via your ~/.vimrc, for example:

[sourcecode language="shell"]
autocmd BufRead *_test.go setlocal makeprg=go\ test\ \.
autocmd BufRead *.go setlocal makeprg=go\ test\ \./..
[/sourcecode]

Thanks Martin for the comment!
