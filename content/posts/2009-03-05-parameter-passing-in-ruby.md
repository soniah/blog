---
author: sonia
comments: true
date: 2009-03-05 03:44:22+00:00
slug: parameter-passing-in-ruby
title: Parameter passing in Ruby
wordpress_id: 284
categories:
- Other-Tech
tags:
- Ruby
---

Just a small script I wrote to play around with various ways of passing parameters in Ruby:

    
    #!/usr/bin/ruby
    
    def restaurant1(meal, food = {})
      meat = (food[:meat] || "chicken")
      veg  = (food[:veg]  || "broccoli")
      puts "For #{meal} you are having grilled #{meat} with steamed #{veg}."
    end
    
    restaurant1 "lunch", {:meat => "beef", :veg => "asparagus"}
    # can omit curly brackets if last arg is a hash
    restaurant1 "lunch", :meat => "beef", :veg => "asparagus"
    
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
    restaurant3 "supper", :entree => ["soup", "bread"], :main => ["beef", "potatoes", "peas"]
