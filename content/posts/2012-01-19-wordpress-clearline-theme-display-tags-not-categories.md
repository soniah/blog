---
author: sonia
comments: true
date: 2012-01-19 13:19:44+00:00
slug: wordpress-clearline-theme-display-tags-not-categories
title: Wordpress Clear Line Theme - Display Tags not Categories
wordpress_id: 1263
categories:
- Other-Tech
tags:
- Clearline
- PHP
- Wordpress
---

The Wordpress Clearline theme displays **categories** not **tags** for posts, and doesn't have a way of modifying it's behaviour through the settings area. This is easily fixed with a one line code change:

Edit the file **/var/www/wp-content/themes/clear-line/functions.php**, and at approximately line 340 replace:

    
    <?php the_category(', '); ?>


with this:

    
    <?php the_tags('', ', '); ?>


The path to the **functions.php** file may be slightly different on your server; you can quickly locate it using **find**:

    
    find / -type f -name functions.php 2> /dev/null
