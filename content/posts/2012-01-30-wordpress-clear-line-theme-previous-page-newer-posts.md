---
author: sonia
comments: true
date: 2012-01-30 03:37:38+00:00
slug: wordpress-clear-line-theme-previous-page-newer-posts
title: Wordpress Clear Line Theme - Previous Page Newer Posts
wordpress_id: 1328
categories:
- Other-Tech
tags:
- Clearline
- Wordpress
---

The Wordpress Clear Line Theme has paginators at the bottom of pages, that have links to **Previous Page** and **Next Page**. Changing them to say something like **Newer Posts** and **Older Posts** is easy - you need to edit the following four files:



	
  * archive.php

	
  * author.php

	
  * index.php

	
  * search.php


In these files, search for the lines that look like:

    
    posts_nav_link(' &#8212; ', __('&laquo; Previous Page'),...


Edit each file and change **Previous Page** to **Newer Posts**, and **Next Page** to **Older Posts**.

Alternatively if you've got [ssh](http://en.wikipedia.org/wiki/Secure_Shell) shell access (and you're hosted on a Unix-like environment eg Linux), you can run the following commands:

    
    cd /var/www/wp-content/themes/clear-line
    sed -i 's/Previous Page/Newer Posts/' archive.php author.php index.php search.php
    sed -i 's/Next Page/Older Posts/' archive.php author.php index.php search.php


Of course before running these [sed](http://en.wikipedia.org/wiki/Sed) commands you should backup your files, in case anything goes wrong...
