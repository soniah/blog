---
author: sonia
comments: true
date: 2012-01-29 04:58:40+00:00
slug: wordpress-clearline-theme-hide-site-admin-login-entries-rss
title: Wordpress Clear Line Theme - Hide Site Admin, Login, Entries RSS
wordpress_id: 1312
categories:
- Other-Tech
tags:
- Clearline
- Wordpress
---

The default settings in the Wordpress Clearline Theme (and most Wordpress themes) will display a box of settings containing things like "Site Admin", "Login", "Entries RSS", etc. This is called the **Meta Widget**.

Unfortunately this Meta Widget can really distract from the visual quality of your site, and it's a slight security risk (though hiding it won't stop _evildoers_ from working out that you're running Wordpress).

There's a couple of options for hiding the Meta Widget:



	
  * don't display it at all. Go to _Appearance -> Widgets_, find the Sidebar that Meta is being displayed in, and delete it. You can then login to your blog by going to the **/wp-login.php** page. For example if your blog is **http://myblog.info**, go to **http://myblog.info/wp-login.php** to login

	
  * make it smaller and barely visible (the option I prefer). First of all, go to _Appearance -> Widgets_ and move/add a Meta Widget to the **Footer Counters** Sidebar (this Sidebar is specific to the Clearline Theme). Then, you need to edit the **wp-includes/default-widgets.php** file. Search for the line that contains **wp_register** (about line 293), then delete the three lines that contain 'rss2_url', 'comments_rss2_url', and 'wordpress.org', and remove the bulleting from 'wp_loginout'. The changes are easier to see with some before and after code:


**Before:**

    
    <ul>
    <?php wp_register(); ?>
    <li><?php wp_loginout(); ?></li>
    <li><a href="<?php bloginfo('rss2_url'); ?>" title=...
    <li><a href="<?php bloginfo('comments_rss2_url'); ?...
    <li><a href="http://wordpress.org/" title="<?php ec...
    <?php wp_meta(); ?>
    </ul>


**After:**

    
    <ul>
    <?php wp_register(); ?>
    <?php wp_loginout(); ?>
    <?php wp_meta(); ?>
    </ul>


Now, you'll have a small Login link at the bottom right-hand corner of your blog!

**Addendum**

If you take the second option (making the Meta Widget smaller and barely visible), you may have noticed you get a small "Site Admin" link when logged in (at the bottom right of the page). You can fix this by editing the **wp-includes/general-template.php** file. At about line 319, **change:**

    
    $link = $before . '<a href="' . admin_url()...


**to:**

    
    $link = '';
