---
author: sonia
comments: true
date: 2011-08-30 03:15:46+00:00
slug: ruby-blocks-and-procs
title: Ruby, blocks and procs
wordpress_id: 1140
categories:
- Linux
tags:
- Ruby
---

Some notes on ruby, blocks, and procs.


# Manually creating blocks


Ruby has three ways of manually creating blocks: **Proc.new**, **lambda**, and **proc**. They have slightly different behaviour, and the behaviour also varies between Ruby 1.8 and 1.9!



	
  * **lambda** checks that the number of arguments passed matches the number of block parameters

	
  * whereas **Proc.new** doesn't check (however the block may raise an error, depending on it's code)__

	
  * and **proc** behaves like **lambda** in Ruby 1.8, and like **Proc.new** in Ruby 1.9. So, avoid using proc!


A bit of code to demonstrate this:

    
    multiplier_l = lambda   { |a, b| puts "a * b is: #{a*b}" }
    multiplier_p = Proc.new { |a, b| puts "a * b is: #{a*b}" }
    
    multiplier_l.call( 3,4,5 )
    ArgumentError: wrong number of arguments (3 for 2)
    
    multiplier_p.call( 3,4,5 )
    a * b is: 12
    > multiplier_p.call( 1 )
    TypeError: nil can't be coerced into Fixnum            # in this case, Proc handled one param, but block errored


And now using [rvm](http://beginrescueend.com/) to switch between Ruby versions:

    
    RUBY_VERSION
    => "1.8.7"
    multiplier_p = proc { |a, b| puts "a * b is: #{a*b}" }
    multiplier_p.call( 3,4,5 )
    ArgumentError: wrong number of arguments (3 for 2)
    
    RUBY_VERSION
    => "1.9.2"
    multiplier_p = proc { |a, b| puts "a * b is: #{a*b}" }
    multiplier_p.call( 3,4,5 )
    a * b is: 12




# Scoping


In Ruby 1.8, block parameters can **overwrite** parameters of the same name in the current scope; in Ruby 1.9 they're protected.

    
    > hello = "hello"
    > def frenchy
    >   x = "bonjour"
    >   yield x
    > end
    > puts hello
    hello
    > frenchy { |hello| puts hello }
    bonjour                             # as expected
    > puts hello
    bonjour                             # ouch! In 1.9 you'd get "hello"




# &block


Some of the Rails and Ruby library code define methods with **&block** as the last parameter to capture an anonymous block.



	
  * anonymous blocks are ignored if they're not used, and **&block** is an _optional_ parameter that must appear as the _last_ parameter

	
  * it's effectively a _type-checked_ parameter - it will only accept an anonymous block or a proc (if proceeded with **&**)

	
  * the block can be called with **call** or **yield**

	
  * you can check if a block was passed using **block_given?**

	
  * **&block** is sort of an "invisible parameter" at the end of all methods. But by explicitly using **&block**, callers get more flexibility when using your method ie they can pass in a **proc** (perhaps defined elsewhere and used multiple times)


Anonymous blocks are ignored if they're not used:

    
    > def foo(a)
    >   puts "a is #{a}"
    > end
    > foo(1)
    a is 1
    > foo(1) { puts "2" }
    a is 1


Conversely if **&block** is declared as a parameter, using it is optional:

    
    > def foo(a, &block)
    >   puts "a is #{a}"
    > end
    > foo(1)
    a is 1


Procs can be called with **call**; anonymous blocks can be **call**ed or **yield**ed to.

    
    > hello = lambda { puts "good bye" }      # define a proc for later use
    > def foo(a, b, &block)
    >   puts "a is #{a}"
    >   b.call                                # proc with call
    >   block.call                            # block with call
    >   yield                                 # block with yield
    > end
    > foo(1, hello) { puts "fred" }           # with an anonymous block
    a is 1
    good bye
    fred
    fred
    > foo(1, hello, &hello)                   # with a proc; notice & syntax
    a is 1
    good bye
    good bye
    good bye


You can check if an anonymous block was supplied using **block_given?**

    
    > def foo(a, &block)
    >    puts "a is #{a}"
    >    block.call if block_given?
    >    yield      if block_given?
    > end
    > foo(1) { puts "mary" }
    a is 1
    mary
    mary
    > def foo(a)                              # or, without defining the block parameter
    >    puts "a is #{a}"
    >    yield      if block_given?           # therefore can only yield not call
    > end


**&block** is sort of an "invisible parameter" at the end of all methods. But by explicitly using **&block**, callers get more flexibility when using your method:

    
    > def foo(a)                                         # no &block defined in parameters
    >   puts "a is #{a}"
    >   yield if block_given?
    > end
    > foo(1) { puts "john" }                             # works as expected
    a is 1
    john
    > foo(1, hello)
    ArgumentError: wrong number of arguments (2 for 1)   # dang! I can't use my super-duper hello proc




# Precedence


**do .. end** has weaker precedence than **{ }**. For example, if **foo** and **bar** are both methods:

These are both the same ie the method **foo** receives two parameters, **bar** and a **block**.

    
    foo bar  do |s| puts(s) end
    foo(bar) do |s| puts(s) end


And these are both the same ie **foo** and **bar** both receive one parameter; **foo** the call to **bar**, and **bar** a **block**:

    
    foo  bar { |s| puts(s) }
    foo( bar { |s| puts(s) } )


Of course the moral of story is not to rely on obscure precedence rules, rather use parentheses whenever something is unclear - as always, in any language.


# Closures


Blocks are closures ie they store or carry the value local variables from the the original scope into a different scope. They're another way of reusing the same logic with slightly different values. For example:

    
    > def build_header( level )
    >   return lambda { |text| "<#{level}>#{text}</#{level}>" }
    > end
    > h1 = build_header("h1")
    > h1.call("Examples")
    <h1>Examples</h1>
    > h2 = build_header("h2")
    > h2.call("Details")
    <h2>Details</h2>
