---
author: sonia
comments: true
date: 2008-01-31 22:26:54+00:00
slug: gnu-screen-screenrc-tricks
title: Gnu Screen .screenrc tricks
wordpress_id: 115
categories:
- Other-Tech
tags:
- Gnu Screen
---

Here's a variety of tricks I've picked up for Gnu screen and .screenrc from the [Screen Users Email List](http://lists.gnu.org/mailman/listinfo/screen-users)




	
    * to have a screen change to a different directory when launched, use the chdir command (_not_ cd):



chdir $HOME/rails
screen -t "rails"




	
    * to change back to a particular screen, after creating a whole lot in .screenrc, and preset the 'other' screen:



select 3 (for example)
select 5



	
  * to search backwards in scrollback mode - **?**. You can also search forwards with** /,** but that's less useful. See [samsarin.com for a good explanation of scrollback mode](http://www.samsarin.com/blog/2007/03/11/gnu-screen-working-with-the-scrollback-buffer/).


