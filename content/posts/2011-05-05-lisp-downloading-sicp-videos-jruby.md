---
author: sonia
comments: true
date: 2011-05-05 09:34:11+00:00
slug: lisp-downloading-sicp-videos-jruby
title: LISP - downloading SICP videos, JRuby
wordpress_id: 1014
categories:
- Other-Tech
tags:
- Git
- Lisp
- Ruby
---

I'm busy learning [LISP](http://en.wikipedia.org/wiki/Lisp_%28programming_language%29)/[Scheme](http://en.wikipedia.org/wiki/Scheme_%28programming_language%29) at the moment (in order to later move on to [Clojure](http://clojure.org/)). And, improving my programming learning LISP is :-)

I'm following along with the [MIT](http://mitpress.mit.edu/sicp/) [SICP](http://en.wikipedia.org/wiki/Structure_and_Interpretation_of_Computer_Programs) videos, but got tired of manually downloading each video. So I wrote a quick little script to download all the videos - [get_sicp](https://github.com/soniah/get_sicp). Next, a script for the [UC Berkeley SICP videos](http://inst.eecs.berkeley.edu/~cs61a/sp11/) (getting through the flash player should be a learning experience).

I've also been getting good mileage out of JRuby. I was [complaining](http://blog.snowfrog.net/2011/03/27/lisp-and-python/) a few weeks ago about not being able to run Ruby on production servers (and therefore having to learn Python). Well JRuby is the perfect solution - installing/building Ruby on production servers is often verboten, but most production servers already have a JVM so installing JRuby in ${HOME} is a non-brainer and doesn't litter /usr. Good: Ruby - fun, Python - <snore>.
