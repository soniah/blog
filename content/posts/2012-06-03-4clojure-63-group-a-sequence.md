---
author: sonia
comments: true
date: 2012-06-03
url: /2012/06/03/4clojure-63-group-a-sequence/
title: 4clojure 63 Group a Sequence
categories:
- Linux
tags:
- Clojure
---

My first attempt at writing up one of my [4clojure](http://www.4clojure.com/) solutions. Problem 63 "Group a Sequence" requires you to re-implement **group-by**. As always looking at the source code is cheating :-)

<!--more-->

_Given a function f and a sequence s, write a function which returns a map. The keys should be the values of f applied to each item in s. The value at each key should be a vector of corresponding items in the order they appear in s._

[sourcecode language="clojure"]
(= (__ #(> % 5) [1 3 6 8]) {false [1 3], true [6 8]})
[/sourcecode]

Here's how I worked it out in the REPL, warts and all...

;; map seems a good start here

[sourcecode language="clojure"]
((map #(> % 5) [1 3 6 8])
;; (false false true true)
[/sourcecode]

;; so I'm getting the values of fn here, I want the inputs too
;; I can't think of a clever way to do this, I'll just use for and list

[sourcecode language="clojure"]
(defn foo [f xs] (for [x xs :let [y (f x)]] (list y x)))
(foo #(> % 5) [1 3 6 8])
;; ((false 1) (false 3) (true 6) (true 8))
[/sourcecode]

;; the for loop can be tightend up, I don't need the :let

[sourcecode language="clojure"]
(defn foo [f xs] (for [x xs] (list (f x) x)))
(foo #(> % 5) [1 3 6 8])
;; ((false 1) (false 3) (true 6) (true 8))
[/sourcecode]

;; I know I want my results as maps, so use a map instead

[sourcecode language="clojure"]
(defn foo [f xs] (for [x xs] {(f x) x}))
(foo #(> % 5) [1 3 6 8])
;; ({false 1} {false 3} {true 6} {true 8})
[/sourcecode]

;; now I'm stuck; how do I moosh the results together?
;; I read thru all the map change fn's in the clj cheatsheet
;; hmmm, merge-with looks promising

[sourcecode language="clojure"]
(defn foo [f xs] (merge-with concat (for [x xs] {(f x) x})))
(foo #(> % 5) [1 3 6 8])
;; ({false 1} {false 3} {true 6} {true 8})
[/sourcecode]

;; WTF? same results. Re-RTFM on merge-with. Well, I'm going to
;; need vectors in my results to be able to concat them...

[sourcecode language="clojure"]
(defn foo [f xs] (merge-with concat (for [x xs] {(f x) [x]})))
(foo #(> % 5) [1 3 6 8])
;; ({false [1]} {false [3]} {true [6]} {true [8]})
[/sourcecode]

;; WTF? still not mooshing together. Uh duh, fn signature takes
;; "maps" not a list. Use the "list stripper" - apply!

[sourcecode language="clojure"]
(defn foo [f xs] (apply merge-with concat (for [x xs] {(f x) [x]})))
(foo #(> % 5) [1 3 6 8])
;; {true (6 8), false (1 3)}
[/sourcecode]

;; ha, sweetness and light! Remove the defn and submit:

[sourcecode language="clojure"]
(fn [f xs] (apply merge-with concat (for [x xs] {(f x) [x]})))
[/sourcecode]

;; look at other's solutions. Dacquiri as usual has a more elegant
;; solution, with a reader macro. What's his golf handicap?!?!

[sourcecode language="clojure"]
#(apply merge-with concat (for [x %2] {(% x) [x]}))
[/sourcecode]

_Mooshing_ is an advanced programming technique, that can only be used after years of study and practice...
