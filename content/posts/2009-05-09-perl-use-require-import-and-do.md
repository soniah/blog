---
title: Perl – use, require, import, and do
author: Sonia Hamilton
date: 2009-05-09
url: /2009/05/09/perl-use-require-import-and-do/
categories:
  - Other-Tech
tags:
  - Perl
---
Some notes on Perl&#8217;s *use, require, import* and *do. *Quick notes for me; not meant to be authoritative&#8230;

  * **use** is done at &#8216;compile-time&#8217; and **require** is done at &#8216;run-time&#8217; (ie can conditionally load modules)
  * **require** is the older method, but **use** uses require to do it&#8217;s work:

<pre class="brush: perl; title: ; notranslate" title="">use Foo;
# equivalent to:
require Foo; Foo-&gt;import();

use Foo qw (foo bar);
# equivalent to:
require Foo; Foo-&gt;import(qw(foo bar));

use Foo();
# equivalent to:
require Foo;
# ie don't import anything, not even the default things
</pre>

  * a **Library** is a just a file of code; a **Module** has **package Foo** in it (and usually other stuff)
  * **use** only works with modules, whereas **require** works with both modules and libraries. Corollary: **use** only works with module names (Foo), whereas **require** also works with paths (eg ~/lib/foo.pm)
  * **require Foo** will check if Foo has already been loaded, whereas **do Foo **will unconditionally reload Foo
  * better practice is to write **module**s rather than **library**s, to prevent namespace pollution. A simple module:

<pre class="brush: perl; title: ; notranslate" title="">package Foo;                   # minimal. Usually add things like:
use base qw (Exporter);
our @EXPORT = qw(qux slarken); # keep this list small - namespace pollution
</pre>

  * to use this module:

<pre class="brush: perl; title: ; notranslate" title="">use lib '~/lib';    # add this to %INC
use Foo;            # loads module, imports symbols in @EXPORT
Foo-&gt;bar();         # correct
Foo::bar();         # works, but not for inherited methods
qux();              # works, due to export
bar();              # carks
</pre>

**Some links:**

  * [netalive.org &#8211; Writing Serious Perl][1]
  * [Randal L. Schwartz &#8211; Hey use guys! import this!][2]
  * [perl.com &#8211; The Perl You Need To Know &#8211; Part 3][3]
  * [hype-free &#8211; The difference between use and require in Perl][4]
  * [perldoc &#8211; use][5]
  * [Perl Cookbook &#8211; Packages, Libraries and Modules][6]

 [1]: http://www.netalive.org/tinkering/serious-perl/
 [2]: http://www.stonehenge.com/merlyn/PerlJournal/col13.html
 [3]: http://www.perl.com/pub/a/2002/05/14/mod_perl.html?page=3
 [4]: http://hype-free.blogspot.com/2008/05/difference-between-use-and-require-in.html
 [5]: http://perldoc.perl.org/functions/use.html
 [6]: http://docstore.mik.ua/orelly/perl/cookbook/ch12_01.htm
