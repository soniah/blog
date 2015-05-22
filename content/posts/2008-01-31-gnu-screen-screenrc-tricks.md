---
title: Gnu Screen .screenrc tricks
author: Sonia Hamilton
date: 2008-01-31
url: /2008/01/31/gnu-screen-screenrc-tricks/
categories:
  - Other-Tech
tags:
  - Gnu Screen
---
Here&#8217;s a variety of tricks I&#8217;ve picked up for Gnu screen and .screenrc from the [Screen Users Email List][1]

<!--more-->

  * to have a screen change to a different directory when launched, use the chdir command (*not* cd):

<tt>chdir $HOME/rails</tt>  
<tt>screen -t "rails"</tt>

  * to change back to a particular screen, after creating a whole lot in .screenrc, and preset the &#8216;other&#8217; screen:

<tt>select 3</tt> (for example)  
<tt>select 5</tt>

  * to search backwards in scrollback mode &#8211; **?**. You can also search forwards with** /,** but that&#8217;s less useful. See [samsarin.com for a good explanation of scrollback mode][2].

 [1]: http://lists.gnu.org/mailman/listinfo/screen-users
 [2]: http://www.samsarin.com/blog/2007/03/11/gnu-screen-working-with-the-scrollback-buffer/
