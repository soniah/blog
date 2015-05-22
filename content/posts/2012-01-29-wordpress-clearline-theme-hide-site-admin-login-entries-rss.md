---
title: WordPress Clear Line Theme – Hide Site Admin, Login, Entries RSS
author: Sonia Hamilton
date: 2012-01-29
url: /2012/01/29/wordpress-clearline-theme-hide-site-admin-login-entries-rss/
categories:
  - Other-Tech
tags:
  - Clearline
  - Wordpress
---
The default settings in the WordPress Clearline Theme (and most WordPress themes) will display a box of settings containing things like &#8220;Site Admin&#8221;, &#8220;Login&#8221;, &#8220;Entries RSS&#8221;, etc. This is called the **Meta Widget**.

<!--more-->

Unfortunately this Meta Widget can really distract from the visual quality of your site, and it&#8217;s a slight security risk (though hiding it won&#8217;t stop *evildoers* from working out that you&#8217;re running WordPress).

There&#8217;s a couple of options for hiding the Meta Widget:

  * don&#8217;t display it at all. Go to *Appearance -> Widgets*, find the Sidebar that Meta is being displayed in, and delete it. You can then login to your blog by going to the **/wp-login.php** page. For example if your blog is **http://myblog.info**, go to **http://myblog.info/wp-login.php** to login
  * make it smaller and barely visible (the option I prefer). First of all, go to *Appearance -> Widgets* and move/add a Meta Widget to the **Footer Counters** Sidebar (this Sidebar is specific to the Clearline Theme). Then, you need to edit the **wp-includes/default-widgets.php** file. Search for the line that contains **wp_register** (about line 293), then delete the three lines that contain &#8216;rss2\_url&#8217;, &#8216;comments\_rss2\_url&#8217;, and &#8216;wordpress.org&#8217;, and remove the bulleting from &#8216;wp\_loginout&#8217;. The changes are easier to see with some before and after code:

**Before:**

<pre>&lt;ul&gt;
&lt;?php wp_register(); ?&gt;
&lt;li&gt;&lt;?php wp_loginout(); ?&gt;&lt;/li&gt;
&lt;li&gt;&lt;a href="&lt;?php bloginfo('rss2_url'); ?&gt;" title=...
&lt;li&gt;&lt;a href="&lt;?php bloginfo('comments_rss2_url'); ?...
&lt;li&gt;&lt;a href="http://wordpress.org/" title="&lt;?php ec...
&lt;?php wp_meta(); ?&gt;
&lt;/ul&gt;</pre>

**After:**

<pre>&lt;ul&gt;
&lt;?php wp_register(); ?&gt;
&lt;?php wp_loginout(); ?&gt;
&lt;?php wp_meta(); ?&gt;
&lt;/ul&gt;</pre>

Now, you&#8217;ll have a small Login link at the bottom right-hand corner of your blog!

**Addendum**

If you take the second option (making the Meta Widget smaller and barely visible), you may have noticed you get a small &#8220;Site Admin&#8221; link when logged in (at the bottom right of the page). You can fix this by editing the **wp-includes/general-template.php** file. At about line 319, **change:**

<pre>$link = $before . '&lt;a href="' . admin_url()...</pre>

**to:**

<pre>$link = '';</pre>
