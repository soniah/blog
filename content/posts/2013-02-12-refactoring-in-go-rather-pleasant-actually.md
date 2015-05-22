---
author: sonia
comments: true
date: 2013-02-12
url: /2013/02/12/refactoring-in-go-rather-pleasant-actually/
title: refactoring in Go - rather pleasant actually...
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

<!--more-->

Static typing catches all those obscure errors I wouldn't think about in a scripting language (Python, Perl, Ruby, etc). My process is:



	
  * type **:make** in vim (I have a dummy Makefile in my Go project just for vim)

	
  * vim jumps cursor to error ([vim quickfix list](http://vimdoc.sourceforge.net/htmldoc/quickfix.html))

	
  * "oh, I shouldn't do that" - fix (type type type)

	
  * start again


Finish rather sooner than expected, run tests, smile in knowledge program is working _properly_.

**Update**

To quickly setup the **make** command for Go, type this in a Vim window:

{{< highlight shell >}}
:setlocal makeprg=go\ build\ \.
{{< /highlight >}}

Or even better configure vim via your ~/.vimrc, for example:

{{< highlight shell >}}
autocmd BufRead *_test.go setlocal makeprg=go\ test\ \.
autocmd BufRead *.go setlocal makeprg=go\ test\ \./..
{{< /highlight >}}

Thanks Martin for the comment!
