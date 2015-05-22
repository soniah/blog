---
title: Ruby, blocks and procs
author: Sonia Hamilton
date: 2011-08-30
url: /2011/08/30/ruby-blocks-and-procs/
categories:
  - Linux
tags:
  - Ruby
---
Some notes on ruby, blocks, and procs.

<!--more-->

# Manually creating blocks

Ruby has three ways of manually creating blocks: **Proc.new**, **lambda**, and **proc**. They have slightly different behaviour, and the behaviour also varies between Ruby 1.8 and 1.9!

  * **lambda** checks that the number of arguments passed matches the number of block parameters
  * whereas **Proc.new** doesn&#8217;t check (however the block may raise an error, depending on it&#8217;s code)**
  * and **proc** behaves like **lambda** in Ruby 1.8, and like **Proc.new** in Ruby 1.9. So, avoid using proc!

A bit of code to demonstrate this:

<pre>multiplier_l = lambda   { |a, b| puts "a * b is: #{a*b}" }
multiplier_p = Proc.new { |a, b| puts "a * b is: #{a*b}" }

multiplier_l.call( 3,4,5 )
ArgumentError: wrong number of arguments (3 for 2)

multiplier_p.call( 3,4,5 )
a * b is: 12
&gt; multiplier_p.call( 1 )
TypeError: nil can't be coerced into Fixnum            # in this case, Proc handled one param, but block errored</pre>

And now using [rvm][1] to switch between Ruby versions:

<pre>RUBY_VERSION
=&gt; "1.8.7"
multiplier_p = proc { |a, b| puts "a * b is: #{a*b}" }
multiplier_p.call( 3,4,5 )
ArgumentError: wrong number of arguments (3 for 2)

RUBY_VERSION
=&gt; "1.9.2"
multiplier_p = proc { |a, b| puts "a * b is: #{a*b}" }
multiplier_p.call( 3,4,5 )
a * b is: 12</pre>

# Scoping

In Ruby 1.8, block parameters can **overwrite** parameters of the same name in the current scope; in Ruby 1.9 they&#8217;re protected.

<pre>&gt; hello = "hello"
&gt; def frenchy
&gt;   x = "bonjour"
&gt;   yield x
&gt; end
&gt; puts hello
hello
&gt; frenchy { |hello| puts hello }
bonjour                             # as expected
&gt; puts hello
bonjour                             # ouch! In 1.9 you'd get "hello"</pre>

# &block

Some of the Rails and Ruby library code define methods with **&block** as the last parameter to capture an anonymous block.

  * anonymous blocks are ignored if they&#8217;re not used, and **&block** is an *optional* parameter that must appear as the *last* parameter
  * it&#8217;s effectively a *type-checked* parameter &#8211; it will only accept an anonymous block or a proc (if proceeded with **&**)
  * the block can be called with **call** or **yield**
  * you can check if a block was passed using **block_given?**
  * **&block** is sort of an &#8220;invisible parameter&#8221; at the end of all methods. But by explicitly using **&block**, callers get more flexibility when using your method ie they can pass in a **proc** (perhaps defined elsewhere and used multiple times)

Anonymous blocks are ignored if they&#8217;re not used:

<pre>&gt; def foo(a)
&gt;   puts "a is #{a}"
&gt; end
&gt; foo(1)
a is 1
&gt; foo(1) { puts "2" }
a is 1</pre>

Conversely if **&block** is declared as a parameter, using it is optional:

<pre>&gt; def foo(a, &block)
&gt;   puts "a is #{a}"
&gt; end
&gt; foo(1)
a is 1</pre>

Procs can be called with **call**; anonymous blocks can be **call**ed or **yield**ed to.

<pre>&gt; hello = lambda { puts "good bye" }      # define a proc for later use
&gt; def foo(a, b, &block)
&gt;   puts "a is #{a}"
&gt;   b.call                                # proc with call
&gt;   block.call                            # block with call
&gt;   yield                                 # block with yield
&gt; end
&gt; foo(1, hello) { puts "fred" }           # with an anonymous block
a is 1
good bye
fred
fred
&gt; foo(1, hello, &hello)                   # with a proc; notice & syntax
a is 1
good bye
good bye
good bye</pre>

You can check if an anonymous block was supplied using **block_given?**

<pre>&gt; def foo(a, &block)
&gt;    puts "a is #{a}"
&gt;    block.call if block_given?
&gt;    yield      if block_given?
&gt; end
&gt; foo(1) { puts "mary" }
a is 1
mary
mary
&gt; def foo(a)                              # or, without defining the block parameter
&gt;    puts "a is #{a}"
&gt;    yield      if block_given?           # therefore can only yield not call
&gt; end</pre>

**&block** is sort of an &#8220;invisible parameter&#8221; at the end of all methods. But by explicitly using **&block**, callers get more flexibility when using your method:

<pre>&gt; def foo(a)                                         # no &block defined in parameters
&gt;   puts "a is #{a}"
&gt;   yield if block_given?
&gt; end
&gt; foo(1) { puts "john" }                             # works as expected
a is 1
john
&gt; foo(1, hello)
ArgumentError: wrong number of arguments (2 for 1)   # dang! I can't use my super-duper hello proc</pre>

# Precedence

**do .. end** has weaker precedence than **{ }**. For example, if **foo** and **bar** are both methods:

These are both the same ie the method **foo** receives two parameters, **bar** and a **block**.

<pre>foo bar  do |s| puts(s) end
foo(bar) do |s| puts(s) end</pre>

And these are both the same ie **foo** and **bar** both receive one parameter; **foo** the call to **bar**, and **bar** a **block**:

<pre>foo  bar { |s| puts(s) }
foo( bar { |s| puts(s) } )</pre>

Of course the moral of story is not to rely on obscure precedence rules, rather use parentheses whenever something is unclear &#8211; as always, in any language.

# Closures

Blocks are closures ie they store or carry the value local variables from the the original scope into a different scope. They&#8217;re another way of reusing the same logic with slightly different values. For example:

<pre>&gt; def build_header( level )
&gt;   return lambda { |text| "&lt;#{level}&gt;#{text}&lt;/#{level}&gt;" }
&gt; end
&gt; h1 = build_header("h1")
&gt; h1.call("Examples")
&lt;h1&gt;Examples&lt;/h1&gt;
&gt; h2 = build_header("h2")
&gt; h2.call("Details")
&lt;h2&gt;Details&lt;/h2&gt;</pre>

 [1]: http://beginrescueend.com/
