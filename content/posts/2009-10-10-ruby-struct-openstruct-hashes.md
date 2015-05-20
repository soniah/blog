---
author: sonia
comments: true
date: 2009-10-10 06:57:35+00:00
slug: ruby-struct-openstruct-hashes
title: Ruby, Struct, OpenStruct, hashes
wordpress_id: 566
categories:
- Other-Tech
tags:
- Ruby
---

An interesting Ruby example of an easy way  to setup classes that are really just for passing around data using **Struct** - essentially a neat wrapper around a hash of values:

    
    class Node < Struct.new( :level, :tag, :data, :refid )
      def initialize( line=nil )
        ...various mungings of line omitted...
        super level, tag.downcase, data, refid
      end
    end
    


Now I can do stuff like:

    
    node = Node.new( line )
    print node.level
    


rather than

    
    node = {}
    ...various munging of data into node hash...
    print node[:value]
    


Not earth-shattering, but nice. See also **ri Struct**, **ri OpenStruct**. From [Pragmattic Programmers' Best of Ruby Quiz](http://www.pragprog.com/titles/fr_quiz/best-of-ruby-quiz)
