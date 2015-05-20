---
author: sonia
comments: true
date: 2009-03-02 03:07:42+00:00
slug: ruby-on-rails-select_tag-default-value
title: Ruby on Rails select_tag default value
wordpress_id: 281
categories:
- Other-Tech
tags:
- Ruby on Rails
---

When using the Rails helper **select_tag**, the selected value (ie highlighted value) is a parameter to **options_for_select**, not select_tag. Eg:

    
    Number of Rows: <%= select_tag(:numrows, options_for_select(%w{10 20 50 100 200 500}, session[:numrows])) %>


(much head-banging-against-wall went into working this out...)
