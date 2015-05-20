---
title: Parameter passing in Ruby
author: Sonia Hamilton
date: 2009-03-05
url: /2009/03/05/parameter-passing-in-ruby/
categories:
  - Other-Tech
tags:
  - Ruby
---
Just a small script I wrote to play around with various ways of passing parameters in Ruby:

<pre>#!/usr/bin/ruby

def restaurant1(meal, food = {})
  meat = (food[:meat] || "chicken")
  veg  = (food[:veg]  || "broccoli")
  puts "For #{meal} you are having grilled #{meat} with steamed #{veg}."
end

restaurant1 "lunch", {:meat =&gt; "beef", :veg =&gt; "asparagus"}
# can omit curly brackets if last arg is a hash
restaurant1 "lunch", :meat =&gt; "beef", :veg =&gt; "asparagus"

def restaurant2(meal, *food)
  # food is an array
  meat = food.shift
  veg = food.shift
  puts "For #{meal} you are having grilled #{meat} with steamed #{veg}."
end

restaurant2 "dinner", "beef", "asparagus"

def restaurant3(meal, courses = {})
  puts "For #{meal}:"
  courses.each do |key,value|
    # hash - courses may come out of order
    puts " * #{key.to_s} will be #{value.join(', ')}."
  end
  # or force order, handle non-specified courses
  puts "For #{meal}:"
  if courses.key?(:entree)
    puts " * Entree - #{courses[:entree].join(', ')}."
  else
    puts " * No Entree"
  end
  if courses.key?(:dessert)
    puts " * Entree - #{courses[:dessert].join(', ')}."
  else
    puts " * No Dessert."
  end
end

# can omit curly brackets if last arg is a hash
restaurant3 "supper", :entree =&gt; ["soup", "bread"], :main =&gt; ["beef", "potatoes", "peas"]</pre>
