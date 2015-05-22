---
title: WordPress Clear Line Theme – Display Tags not Categories
author: Sonia Hamilton
date: 2012-01-19
url: /2012/01/19/wordpress-clearline-theme-display-tags-not-categories/
categories:
  - Other-Tech
tags:
  - Clearline
  - PHP
  - Wordpress
---
The WordPress Clearline theme displays **categories** not **tags** for posts, and doesn&#8217;t have a way of modifying it&#8217;s behaviour through the settings area. This is easily fixed with a one line code change:

<!--more-->

Edit the file **/var/www/wp-content/themes/clear-line/functions.php**, and at approximately line 340 replace:

<pre>&lt;?php the_category(', '); ?&gt;</pre>

with this:

<pre>&lt;?php the_tags('', ', '); ?&gt;</pre>

The path to the **functions.php** file may be slightly different on your server; you can quickly locate it using **find**:

<pre>find / -type f -name functions.php 2&gt; /dev/null</pre>
