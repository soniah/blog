---
author: sonia
comments: true
date: 2009-05-22 07:16:22+00:00
slug: perl-my-use-vars-our-local-use-strict
title: Perl - my, use vars, our, local, use strict
wordpress_id: 411
categories:
- Other-Tech
tags:
- Perl
---

Some notes for me as I attempt to get a better understanding of Perl's variable scoping rules. A work in progress...



	
  * Perl has 2 separate 'namespaces' for variables - **package** aka global (Perl 4) and **my** aka private aka **lexical scoping** (Perl 5)

	
  * the default package is **main**, this can be changed with the statement **package foo;** which then applies to all subsequent code until another package statement is encountered

	
  * **lexical scoping** is done with {} (either via subroutines/operators or 'naked blocks'); the top level is the file itself ('file level').

	
  * **use strict****; **(specifically **use strict 'vars';**) requires that variables either use a package qualifier (eg $main::foo) if they're package variables or be lexical variables declared with **my**. You can get around this extra typing for package variables with **use vars** (or **no strict 'vars'** for a block)

	
  * **our($foo,$bar)** is like **use vars qw($foo $bar)**, however it's lexical ie can be restricted by {}'s (an equivalent **no use vars** doesn't exist). Looked at it another way, **our** 'spans' package declarations (as it's lexical) whereas **use vars** is 'reset' by package declarations.


**Also:**



	
  * **dynamic scoping** is done with **local** - see [Wikipedia - Scope (programming)](http://en.wikipedia.org/wiki/Scope_(programming)#Dynamic_scoping). **Lexical scoping** is the norm in modern programming languages, dynamic scoping is a Lisp'y idea that uses a sort of stack for variable scope resolution, that can only be determined at runtime.  _When to use local? Rarely... _[Seven Useful Uses of local](http://perl.plover.com/local.html)

	
  * **local** only works with package variables not lexical/my variables; an example of where local can be useful is to temporarily change a _Global Special Variable_ (eg $) $EFFECTIVE_GROUP_ID) before calling a subroutine: "local saves away the value of a package global and substitutes a new value for all code within and _called from_ the block in which the local declaration is made" eg



    
    {
        local $) = getgrnam(USER) if $< == 0;
        enable($host);
    }





	
  * do C-style _static_ variables in this manner:



    
            { my $seed = 1;
              sub my_rand {
                $seed = int(($seed * 1103515245 + 12345) / 65536) % 32768;
                return $seed;
              }
            }





	
  * xx


**Some Links:**



	
  * [Coping with Scoping](http://perl.plover.com/FAQs/Namespaces.html)

	
  * [Perl Monks -Variable Scoping in Perl: the basics](http://www.perlmonks.org/?node_id=66677)


