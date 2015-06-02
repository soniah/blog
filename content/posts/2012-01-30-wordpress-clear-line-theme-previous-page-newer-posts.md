---
title: WordPress Clear Line Theme – Previous Page Newer Posts
author: Sonia Hamilton
date: 2012-01-30
url: /2012/01/30/wordpress-clear-line-theme-previous-page-newer-posts/
categories:
  - Other-Tech
tags:
  - Clearline
  - Wordpress
---
The WordPress Clear Line Theme has paginators at the bottom of pages, that have links to **Previous Page** and **Next Page**. Changing them to say something like **Newer Posts** and **Older Posts** is easy -- you need to edit the following four files:

<!--more-->

  * archive.php
  * author.php
  * index.php
  * search.php

In these files, search for the lines that look like:

<pre>posts_nav_link(' &#8212; ', __('&laquo; Previous Page'),...</pre>

Edit each file and change **Previous Page** to **Newer Posts**, and **Next Page** to **Older Posts**.

Alternatively if you've got [ssh][1] shell access (and you're hosted on a Unix-like environment eg Linux), you can run the following commands:

<pre>cd /var/www/wp-content/themes/clear-line
sed -i 's/Previous Page/Newer Posts/' archive.php author.php index.php search.php
sed -i 's/Next Page/Older Posts/' archive.php author.php index.php search.php</pre>

Of course before running these [sed][2] commands you should backup your files, in case anything goes wrong.

 [1]: http://en.wikipedia.org/wiki/Secure_Shell
 [2]: http://en.wikipedia.org/wiki/Sed
