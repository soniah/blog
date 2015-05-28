---
author: sonia
date: 2012-07-05
url: /2012/07/05/4clojure-100-least-common-multiple/
title: 4clojure 100 Least Common Multiple
categories:
- Linux
tags:
- Clojure
---

[4clojure problem 100](http://www.4clojure.com/problem/100) - calculate the [Least Common Multiple (LCM)](http://en.wikipedia.org/wiki/Least_common_multiple) of two or more numbers.

<!--more-->

![LCM Example](http://upload.wikimedia.org/wikipedia/en/math/c/b/0/cb0d245e78e328c29095b9522fd16200.png)

Here's how I worked it out in the REPL, warts and all....

I first thought about using the meaning of LCM to solve this (as given in Wikipedia), ie for two numbers a and b (eg 4 and 6), find all the multiples of a (an infinite sequence), find all the multiples of b (an infinite sequence), and find the first match. But I was impatient and didn't want to work out how to find the first match between lists, so I decided to use the GCD definition:

![LCM from GCD](http://upload.wikimedia.org/wikipedia/en/math/5/b/3/5b3f3c62dd59cc5594af7b2ece3798fb.png)

From there it was just a matter of balancing parentheses (thanks [paredit](http://blog.snowfrog.net/2012/06/02/emacs-paredit-notes-for-osx/)) by breaking up the problem into stages, starting with calculating the GCD of two numbers:

{{< highlight clojure >}}
(defn gcd [a b]
  (cond
   (= b 0) a
   (= a 0) b
   (> a b) (gcd b (mod a b))
   (> b a) (gcd a (mod b a))))
(gcd 15 5)
==> 5
{{< /highlight >}}

Now get LCM working for two arguments:

{{< highlight clojure >}}
(defn lcm [x y]
  (/ (* x y) (gcd x y)))
(lcm 4 6)
==> 12
{{< /highlight >}}

Now get LCM working for more than two arguments. I remembered seeing multiple arities used to solve other 4clojure problems, so I thought I'd use the [Arity-Reduce "pattern"](http://blog.darevay.com/2011/08/briefly-the-arity-reduce-pattern-in-clojure/) (well I'm using apply, same idea):

{{< highlight clojure >}}
(defn lcm2
  ([x y] (/ (* x y) (gcd x y)))
  ([x y & rest] (apply lcm2 (lcm2 x y) rest)))
(lcm2 5 3 7)
==> 105
{{< /highlight >}}

4clojure doesn't allow **defn**, so I then used **letfn** to nest my definition of GCD inside LCM:

{{< highlight clojure >}}
(fn lcm3
  ([x y]
     (letfn [(gcd2 [a b]
               (cond
                (= b 0) a
                (> a b) (gcd2 b (mod a b))
                (> b a) (gcd2 a (mod b a))))]
       (/ (* x y) (gcd2 x y))))
  ([x y & rest] (apply lcm3 (lcm3 x y) rest)))
(lcm3 5 3 7)
==> 105
{{< /highlight >}}

So my solution worked, but it wasn't very elegant - Dacquiri wins the prize for that, again :-)
