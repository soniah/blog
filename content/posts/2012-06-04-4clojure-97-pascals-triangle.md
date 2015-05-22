---
author: sonia
comments: true
date: 2012-06-04
url: /2012/06/04/4clojure-97-pascals-triangle/
title: 4clojure 97 Pascal's Triangle
wordpress_id: 1547
categories:
- Linux
tags:
- Clojure
---

[4clojure](http://www.4clojure.com/) problem 97 **Pascal's Triangle** - calculate the nth row:

![Pascal's Triangle](http://upload.wikimedia.org/wikipedia/commons/thumb/f/f6/Pascal%27s_triangle_5.svg/250px-Pascal%27s_triangle_5.svg.png)

**My solution:**

[sourcecode language="clojure"]
(defn pascal [n]
  (if (= n 1)
    [1]
    (map #(apply + %)
      (partition 2 1
        (concat [0] (pascal (- n 1)) [0])))))

(pascal 5)
user=> (1 4 6 4 1)
[/sourcecode]

A negative - my solution doesn't use tail recursion; on my laptop it works up to about n = 760:

[sourcecode language="clojure"]
(pascal 10e4)
user=> java.lang.StackOverflowError (NO_SOURCE_FILE:0) 
[/sourcecode]
