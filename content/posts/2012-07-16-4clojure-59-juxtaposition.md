---
author: sonia
comments: true
date: 2012-07-16
url: /2012/07/16/4clojure-59-juxtaposition/
title: 4Clojure 59 Juxtaposition
wordpress_id: 1634
categories:
- Linux
tags:
- Clojure
---

[4clojure problem 59 Juxtapostion](http://www.4clojure.com/problem/59) - here's how I approached the problem (warts and all) in the hope that it helps others who are learning [Clojure](http://en.wikipedia.org/wiki/Clojure).

A reminder of what the **juxt** function does:

    
    Takes a set of functions and returns a fn that is the juxtaposition
    of those fns. The returned fn takes a variable number of args, and
    returns a vector containing the result of applying each fn to the
    args (left-to-right).
    ((juxt a b c) x) => [(a x) (b x) (c x)]


The problem was fairly easy, it just required the **HOF** (Higher Order Functions) abstraction of thinking of functions as arguments, like any other (numeric, string, ...) argument.

First of all, I need a function that takes a variable number of arguments (0-n) - standard destructuring:

[sourcecode language="clojure"]
(defn myjuxt [& fs]
...
[/sourcecode]

I don't know what to do with these functions yet, so I'll just loop through using **for** and return each function:

[sourcecode language="clojure"]
(defn myjuxt [& fs]
  (for [f fs] f))
[/sourcecode]

And here you can see the returned list of function objects. Not very useful but a start:

[sourcecode language="clojure"]
(myjuxt + min max)
user => (#core_plus #core_min #core_max)
[/sourcecode]

The question gives a good hint here: "return a new function that takes a variable number of arguments". So do that, using the same destructuring approach for a variable number of arguments:

[sourcecode language="clojure"]
(defn myjuxt2 [& fs]
  (fn [& xs]
...
[/sourcecode]

So I want to run each function against these arguments, so I'll use **for** again:

[sourcecode language="clojure"]
(defn myjuxt2 [& fs]
  (ƒ [& xs]
   (for [f fs] (f xs))))
((myjuxt2 + min max) 1 2 3)
user=> (ClassCastException Cannot cast clojure.lang.ArraySeq
to java.lang.Number
[/sourcecode]

Ouch! But the error message gives a hint - something is seeing an array instead of a number. My three functions want numbers and they're getting arrays - I need **apply** to "strip out" the arguments:

[sourcecode language="clojure"]
(defn myjuxt2 [& fs]
  (fn [& xs]
   (for [f fs] (apply f xs))))
((myjuxt2 + min max) 1 2 3)
user=> (6 1 3)
[/sourcecode]

And it works! Looking at the solutions I see that I could've used **map** instead of **for**, and **#()** instead of **(fn)**, but they're minor "[golfing](http://en.wikipedia.org/wiki/Code_golf)" details.
