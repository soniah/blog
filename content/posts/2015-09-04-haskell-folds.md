---
author: sonia
date: 2015-09-04
url: /2015/09/04/haskell-folds/
title: Haskell Folds
categories:
- Linux
tags:
- Haskell
---

Notes on Haskell Folds.

<!--more-->

# foldr

![foldr](https://upload.wikimedia.org/wikipedia/commons/3/3e/Right-fold-transformation.png)

"It is best to think of foldr non-recursively as
simultaneously replacing each (:) in a list by a
given function, and [] by a given value." --
[Programming in
Haskell](http://www.cs.nott.ac.uk/~gmh/book.html)

# foldl

![foldl](https://upload.wikimedia.org/wikipedia/commons/5/5a/Left-fold-transformation.png)

"It is best to think of the behaviour of foldl in
a non-recursive manner, in terms of a left
associative operator ⊕ starting from a given
value." -- [Programming in
Haskell](http://www.cs.nott.ac.uk/~gmh/book.html)

{{< highlight bash >}}
(((( z ⊕ x1 ) ⊕ x2 ) ... ⊕ xn
{{< /highlight >}}

# Links

* [Haskell Wiki - Folds](https://wiki.haskell.org/Fold)
* [Wikipedia - Folds](https://en.wikipedia.org/wiki/Fold_%28higher-order_function%29)
* [Programming in Haskell Slides - Chapter 7
  Higher Order Functions](http://www.cs.nott.ac.uk/~gmh/chapter7.ppt)

