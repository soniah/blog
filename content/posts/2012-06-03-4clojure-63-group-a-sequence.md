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

{{< highlight clojure >}}
(= (__ #(> % 5) [1 3 6 8]) {false [1 3], true [6 8]})
{{< /highlight >}}

Here's how I worked it out in the REPL, warts and all...

;; map seems a good start here

{{< highlight clojure >}}
((map #(> % 5) [1 3 6 8])
;; (false false true true)
{{< /highlight >}}

;; so I'm getting the values of fn here, I want the inputs too
;; I can't think of a clever way to do this, I'll just use for and list

{{< highlight clojure >}}
(defn foo [f xs] (for [x xs :let [y (f x)]] (list y x)))
(foo #(> % 5) [1 3 6 8])
;; ((false 1) (false 3) (true 6) (true 8))
{{< /highlight >}}

;; the for loop can be tightend up, I don't need the :let

{{< highlight clojure >}}
(defn foo [f xs] (for [x xs] (list (f x) x)))
(foo #(> % 5) [1 3 6 8])
;; ((false 1) (false 3) (true 6) (true 8))
{{< /highlight >}}

;; I know I want my results as maps, so use a map instead

{{< highlight clojure >}}
(defn foo [f xs] (for [x xs] {(f x) x}))
(foo #(> % 5) [1 3 6 8])
;; ({false 1} {false 3} {true 6} {true 8})
{{< /highlight >}}

;; now I'm stuck; how do I moosh the results together?
;; I read thru all the map change fn's in the clj cheatsheet
;; hmmm, merge-with looks promising

{{< highlight clojure >}}
(defn foo [f xs] (merge-with concat (for [x xs] {(f x) x})))
(foo #(> % 5) [1 3 6 8])
;; ({false 1} {false 3} {true 6} {true 8})
{{< /highlight >}}

;; WTF? same results. Re-RTFM on merge-with. Well, I'm going to
;; need vectors in my results to be able to concat them...

{{< highlight clojure >}}
(defn foo [f xs] (merge-with concat (for [x xs] {(f x) [x]})))
(foo #(> % 5) [1 3 6 8])
;; ({false [1]} {false [3]} {true [6]} {true [8]})
{{< /highlight >}}

;; WTF? still not mooshing together. Uh duh, fn signature takes
;; "maps" not a list. Use the "list stripper" - apply!

{{< highlight clojure >}}
(defn foo [f xs] (apply merge-with concat (for [x xs] {(f x) [x]})))
(foo #(> % 5) [1 3 6 8])
;; {true (6 8), false (1 3)}
{{< /highlight >}}

;; ha, sweetness and light! Remove the defn and submit:

{{< highlight clojure >}}
(fn [f xs] (apply merge-with concat (for [x xs] {(f x) [x]})))
{{< /highlight >}}

;; look at other's solutions. Dacquiri as usual has a more elegant
;; solution, with a reader macro. What's his golf handicap?!?!

{{< highlight clojure >}}
#(apply merge-with concat (for [x %2] {(% x) [x]}))
{{< /highlight >}}

_Mooshing_ is an advanced programming technique, that can only be used after years of study and practice...
