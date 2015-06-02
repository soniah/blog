---
title: Python, Lambda, Closures
author: Sonia Hamilton
date: 2011-04-05
url: /2011/04/05/python-lambda-closures/
categories:
  - Other-Tech
tags:
  - Lisp
  - Python
  - Slug
---
A very interesting [post][2] from André Pang about some issues he came across with lamdas and closures in Python. Well, interesting to me because I'm playing with Lisp and Python at the moment&#8230;

<!--more-->

Some links from his blog, in case the original post ever disappears:

  * the [question and responses][3] on stackoverflow
  * an [example][4] of the perils of Python's scoping rules with for/while/if
  * Wikipedia -- [differences in semantics of closures][5]

A nice snippet of code to remind me of the issues:

<pre>def callback(msg):
    print msg
funcList=[]
for m in ('do', 're', 'mi'):
    # funcList.append(lambda: callback(m))
    funcList.append(lambda m=m: callback(m))
for f in funcList:
    f()</pre>

 [1]: http://planet.slug.org.au/
 [2]: http://algorithm.com.au/blog/files/immutability-blocks-lambdas-closures.php#unique-entry-id-613
 [3]: http://stackoverflow.com/questions/938429/scope-of-python-lambda-functions-and-their-parameters
 [4]: http://mail.python.org/pipermail/python-dev/2005-September/056669.html
 [5]: http://en.wikipedia.org/wiki/Closure_%28computer_science%29#Differences_in_semantics
