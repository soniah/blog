---
author: sonia
comments: true
date: 2009-10-01 10:50:56+00:00
slug: ruby-here-document-example
title: Ruby here document example
wordpress_id: 557
categories:
- Other-Tech
tags:
- Ruby
---

A nice ruby example (for my reference) of using here documents to load data/logic. From [Pragmattic Programmers' Best of Ruby Quiz](http://www.pragprog.com/titles/fr_quiz/best-of-ruby-quiz):

    
    DIGITS = <<END_DIGITS.split("n").map { |row| row.split(" # ") }.transpose
     -  #     #  -  #  -  #     #  -  #  -  #  -  #  -  #  -
    | | #   | #   | #   | # | | # |   # |   #   | # | | # | |
        #     #  -  #  -  #  -  #  -  #  -  #     #  -  #  -
    | | #   | # |   #   | #   | #   | # | | #   | # | | #   |
     -  #     #  -  #  -  #     #  -  #  -  #     #  -  #  -
    END_DIGITS
