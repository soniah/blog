---
author: sonia
comments: true
date: 2011-04-05 03:03:13+00:00
slug: python-lambda-closures
title: Python, Lambda, Closures
wordpress_id: 951
categories:
- Other-Tech
tags:
- Lisp
- Python
- Slug
---

(apologies to [slug planeteers](http://planet.slug.org.au/) for the duplicate info).

A very interesting [post](http://algorithm.com.au/blog/files/immutability-blocks-lambdas-closures.php#unique-entry-id-613) from André Pang about some issues he came across with lamdas and closures in Python. Well, interesting to me because I'm playing with Lisp and Python at the moment...

Some links from his blog, in case the original post ever disappears:



	
  * the [question and responses](http://stackoverflow.com/questions/938429/scope-of-python-lambda-functions-and-their-parameters) on stackoverflow

	
  * an [example](http://mail.python.org/pipermail/python-dev/2005-September/056669.html) of the perils of Python's scoping rules with for/while/if

	
  * Wikipedia - [differences in semantics of closures](http://en.wikipedia.org/wiki/Closure_%28computer_science%29#Differences_in_semantics)


A nice snippet of code to remind me of the issues:

    
    def callback(msg):
        print msg
    funcList=[]
    for m in ('do', 're', 'mi'):
        # funcList.append(lambda: callback(m))
        funcList.append(lambda m=m: callback(m))
    for f in funcList:
        f()
