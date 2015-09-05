---
author: sonia
date: 2015-05-22
url: /2015/05/22/haskell-hole-driven-development/
title: Haskell Hole Driven Development
categories:
- Linux
tags:
- Haskell
---

I just finished attending the excellent [Brisbane YOW! Lambda
Jam](http://lambdajam.yowconference.com.au/). One of the really useful
things I learned from [Tony Morris](http://blog.tmorris.net/) was "Hole
Driven Development" for Haskell - basically using the type system to
help you write a function.

<!--more-->

Firstly, when writing a function, you can use placeholders that will
allow code to compile (without producing error messages) while you're
working on other parts. The two placeholders are:

{{< highlight haskell >}}
error "todo" (or any string)
undefined
{{< /highlight >}}

The "hole driven" part involves using the underscore to get the
compiler to print types:

{{< highlight haskell >}}
_undefined
_x
_foo
{{< /highlight >}}

For example if I used `_x` then re-loaded my code in ghci, I would get
output like:

{{< highlight haskell >}}
Found hole ‘_x’ with type: a
...
g2 :: a -> b (bound at GetSetLens.hs:312:31)
s2 :: a -> b -> a (bound at GetSetLens.hs:312:28)
g1 :: b -> c (bound at GetSetLens.hs:312:18)
s1 :: b -> c -> b (bound at GetSetLens.hs:312:15)
{{< /highlight >}}

Showing me that where I had `_x` a type `a` was expected, and that I already
have functions `g2,s2,g1,s1` that consume and produce (curry) given types.

See also the post and video by Matthew Brecknell [Hole-driven
Haskell](http://matthew.brecknell.net/post/hole-driven-haskell/).
