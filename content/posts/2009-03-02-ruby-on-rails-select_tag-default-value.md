---
title: Ruby on Rails select_tag default value
author: Sonia Hamilton
date: 2009-03-02
url: /2009/03/02/ruby-on-rails-select_tag-default-value/
categories:
  - Other-Tech
tags:
  - Ruby on Rails
---
When using the Rails helper **select_tag**, the selected value (ie highlighted value) is a parameter to **options\_for\_select**, not select_tag. Eg:

<pre>Number of Rows: &lt;%= select_tag(:numrows, options_for_select(%w{10 20 50 100 200 500}, session[:numrows])) %&gt;</pre>

(much head-banging-against-wall went into working this out&#8230;)
