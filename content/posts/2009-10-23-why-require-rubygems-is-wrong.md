---
author: sonia
comments: true
date: 2009-10-23 02:31:47+00:00
slug: why-require-rubygems-is-wrong
title: Why "require 'rubygems'" Is Wrong
wordpress_id: 589
categories:
- Other-Tech
tags:
- Ruby
---

A link off the [RORO](http://rubyonrails.com.au/) list about [Why "require 'rubygems'" Is Wrong](http://tomayko.com/writings/require-rubygems-antipattern).

In a nutshell, the environment variable RUBYOPT should include rubygems eg

    
    export RUBYOPT="rubygems"
