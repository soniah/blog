---
title: Ruby, Struct, OpenStruct, hashes
author: Sonia Hamilton
date: 2009-10-10
url: /2009/10/10/ruby-struct-openstruct-hashes/
categories:
  - Other-Tech
tags:
  - Ruby
---
An interesting Ruby example of an easy way to setup classes that are really just for passing around data using **Struct** -- essentially a neat wrapper around a hash of values:

<!--more-->

<pre>class Node &lt; Struct.new( :level, :tag, :data, :refid )
  def initialize( line=nil )
    ...various mungings of line omitted...
    super level, tag.downcase, data, refid
  end
end
</pre>

Now I can do stuff like:

<pre>node = Node.new( line )
print node.level
</pre>

rather than

<pre>node = {}
...various munging of data into node hash...
print node[:value]
</pre>

Not earth-shattering, but nice. See also **ri Struct**, **ri OpenStruct**. From [Pragmattic Programmers' Best of Ruby Quiz][1]

 [1]: http://www.pragprog.com/titles/fr_quiz/best-of-ruby-quiz
