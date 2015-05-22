---
title: "Why “require ‘rubygems'” Is Wrong"
author: Sonia Hamilton
date: 2009-10-23
url: /2009/10/23/why-require-rubygems-is-wrong/
categories:
  - Other-Tech
tags:
  - Ruby
---
A link off the [RORO][1] list about [Why &#8220;require &#8216;rubygems'&#8221; Is Wrong][2].

<!--more-->

In a nutshell, the environment variable RUBYOPT should include rubygems eg

<pre>export RUBYOPT="rubygems"</pre>

 [1]: http://rubyonrails.com.au/
 [2]: http://tomayko.com/writings/require-rubygems-antipattern
