---
title: Ruby here document example
author: Sonia Hamilton
date: 2009-10-01
url: /2009/10/01/ruby-here-document-example/
categories:
  - Other-Tech
tags:
  - Ruby
---
A nice ruby example (for my reference) of using here documents to load data/logic. From [Pragmattic Programmers' Best of Ruby Quiz][1]:

<!--more-->

<pre>DIGITS = &lt;&lt;END_DIGITS.split("n").map { |row| row.split(" # ") }.transpose
 -  #     #  -  #  -  #     #  -  #  -  #  -  #  -  #  -
| | #   | #   | #   | # | | # |   # |   #   | # | | # | |
    #     #  -  #  -  #  -  #  -  #  -  #     #  -  #  -
| | #   | # |   #   | #   | #   | # | | #   | # | | #   |
 -  #     #  -  #  -  #     #  -  #  -  #     #  -  #  -
END_DIGITS</pre>

 [1]: http://www.pragprog.com/titles/fr_quiz/best-of-ruby-quiz
