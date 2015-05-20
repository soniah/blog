---
author: sonia
comments: true
date: 2009-05-09 10:43:55+00:00
slug: perl-use-require-import-and-do
title: Perl - use, require, import, and do
wordpress_id: 396
categories:
- Other-Tech
tags:
- Perl
---

Some notes on Perl's _use, require, import_ and _do. _Quick notes for me; not meant to be authoritative...



	
  * **use** is done at 'compile-time' and **require** is done at 'run-time' (ie can conditionally load modules)

	
  * **require** is the older method, but **use** uses require to do it's work:



[sourcecode language="perl"]
use Foo;
# equivalent to:
require Foo; Foo->import();

use Foo qw (foo bar);
# equivalent to:
require Foo; Foo->import(qw(foo bar));

use Foo();
# equivalent to:
require Foo;
# ie don't import anything, not even the default things
[/sourcecode]


	
  * a **Library** is a just a file of code; a **Module** has **package Foo** in it (and usually other stuff)

	
  * **use** only works with modules, whereas **require** works with both modules and libraries. Corollary: **use** only works with module names (Foo), whereas **require** also works with paths (eg ~/lib/foo.pm)

	
  * **require Foo** will check if Foo has already been loaded, whereas **do Foo **will unconditionally reload Foo

	
  * better practice is to write **module**s rather than **library**s, to prevent namespace pollution. A simple module:



[sourcecode language="perl"]
package Foo;                   # minimal. Usually add things like:
use base qw (Exporter);
our @EXPORT = qw(qux slarken); # keep this list small - namespace pollution
[/sourcecode]


	
  * to use this module:



[sourcecode language="perl"]
use lib '~/lib';    # add this to %INC
use Foo;            # loads module, imports symbols in @EXPORT
Foo->bar();         # correct
Foo::bar();         # works, but not for inherited methods
qux();              # works, due to export
bar();              # carks
[/sourcecode]

**Some links:**



	
  * [netalive.org - Writing Serious Perl](http://www.netalive.org/tinkering/serious-perl/)

	
  * [Randal L. Schwartz - Hey use guys! import this!](http://www.stonehenge.com/merlyn/PerlJournal/col13.html)

	
  * [perl.com - The Perl You Need To Know - Part 3](http://www.perl.com/pub/a/2002/05/14/mod_perl.html?page=3)

	
  * [hype-free - The difference between use and require in Perl](http://hype-free.blogspot.com/2008/05/difference-between-use-and-require-in.html)

	
  * [perldoc - use](http://perldoc.perl.org/functions/use.html)

	
  * [Perl Cookbook - Packages, Libraries and Modules](http://docstore.mik.ua/orelly/perl/cookbook/ch12_01.htm)


