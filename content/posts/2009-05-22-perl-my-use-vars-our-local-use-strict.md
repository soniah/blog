---
title: Perl – my, use vars, our, local, use strict
author: Sonia Hamilton
date: 2009-05-22
url: /2009/05/22/perl-my-use-vars-our-local-use-strict/
categories:
  - Other-Tech
tags:
  - Perl
---
Some notes for me as I attempt to get a better understanding of Perl's variable scoping rules. A work in progress&#8230;

<!--more-->

  * Perl has 2 separate &#8216;namespaces' for variables -- **package** aka global (Perl 4) and **my** aka private aka **lexical scoping** (Perl 5)
  * the default package is **main**, this can be changed with the statement **package foo;** which then applies to all subsequent code until another package statement is encountered
  * **lexical scoping** is done with {} (either via subroutines/operators or &#8216;naked blocks'); the top level is the file itself (&#8216;file level').
  * **use strict****; **(specifically **use strict &#8216;vars';**) requires that variables either use a package qualifier (eg $main::foo) if they're package variables or be lexical variables declared with **my**. You can get around this extra typing for package variables with **use vars** (or **no strict &#8216;vars'** for a block)
  * **our($foo,$bar)** is like **use vars qw($foo $bar)**, however it's lexical ie can be restricted by {}'s (an equivalent <span style="text-decoration:line-through;"><strong>no use vars</strong></span> doesn't exist). Looked at it another way, **our** &#8216;spans' package declarations (as it's lexical) whereas **use vars** is &#8216;reset' by package declarations.

**Also:**

  * **dynamic scoping** is done with **local** -- see [Wikipedia -- Scope (programming)][1]. **Lexical scoping** is the norm in modern programming languages, dynamic scoping is a Lisp'y idea that uses a sort of stack for variable scope resolution, that can only be determined at runtime.  *When to use local? Rarely&#8230; *[Seven Useful Uses of local][2]
  * **local** only works with package variables not lexical/my variables; an example of where local can be useful is to temporarily change a *Global Special Variable* (eg $) $EFFECTIVE\_GROUP\_ID) before calling a subroutine: &#8220;local saves away the value of a package global and substitutes a new value for all code within and *called from* the block in which the local declaration is made&#8221; eg

<pre>{
    local $) = getgrnam(USER) if $&lt; == 0;
    enable($host);
}</pre>

  * do C-style *static* variables in this manner:

<pre>{ my $seed = 1;
          sub my_rand {
            $seed = int(($seed * 1103515245 + 12345) / 65536) % 32768;
            return $seed;
          }
        }</pre>

  * xx

**Some Links:**

  * [Coping with Scoping][3]
  * [Perl Monks -Variable Scoping in Perl: the basics][4]

 [1]: http://en.wikipedia.org/wiki/Scope_(programming)#Dynamic_scoping
 [2]: http://perl.plover.com/local.html
 [3]: http://perl.plover.com/FAQs/Namespaces.html
 [4]: http://www.perlmonks.org/?node_id=66677
