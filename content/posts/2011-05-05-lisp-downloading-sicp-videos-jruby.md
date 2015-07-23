---
title: LISP – downloading SICP videos, JRuby
author: Sonia Hamilton
date: 2011-05-05
url: /2011/05/05/lisp-downloading-sicp-videos-jruby/
categories:
  - Other-Tech
tags:
  - Git
  - Lisp
  - Ruby
---
I'm busy learning [LISP][1]/[Scheme][2] at the moment (in order to later move on to [Clojure][3]). 

<!--more-->

And, improving my programming learning LISP is :-)

I'm following along with the [MIT][4] [SICP][5] videos, but got tired of manually downloading each video. So I wrote a quick little script to download all the videos -- [get_sicp][6]. Next, a script for the [UC Berkeley SICP videos][7] (getting through the flash player should be a learning experience).

I've also been getting good mileage out of JRuby. I was [complaining][8] a few weeks ago about not being able to run Ruby on production servers (and therefore having to learn Python). Well JRuby is the perfect solution -- installing/building Ruby on production servers is often verboten, but most production servers already have a JVM so installing JRuby in ${HOME} is a non-brainer and doesn't litter /usr. Good: Ruby -- fun, Python -- <snore>.

 [1]: http://en.wikipedia.org/wiki/Lisp_%28programming_language%29
 [2]: http://en.wikipedia.org/wiki/Scheme_%28programming_language%29
 [3]: http://clojure.org/
 [4]: http://mitpress.mit.edu/sicp/
 [5]: http://en.wikipedia.org/wiki/Structure_and_Interpretation_of_Computer_Programs
 [6]: https://github.com/soniah/get_sicp
 [7]: http://inst.eecs.berkeley.edu/~cs61a/sp11/
 [8]: http://blog2.snowfrog.net/2011/03/27/lisp-and-python/
