---
author: sonia
comments: true
date: 2008-02-06 23:50:20+00:00
slug: change-first-day-of-week-in-ubuntus-gnome-calendar
title: Change first day of week in Ubuntu's Gnome Calendar
wordpress_id: 117
categories:
- Linux
tags:
- Ubuntu
---

Under the Australian locale, the first day of the week appears as Sunday rather than Monday, which is incorrect. To change it:



	
  * check which locale is running, using the **locale** command (ie **en_AU**)

	
  * **sudo vi /usr/share/i18n/locales/en_AU** and change **first_weekday** and **first_workday** to 2

	
  * regenerate the locale using **sudo locale-gen**

	
  * get the calendar to reload using **killall gnome-panel**


In another post, I also show [how to automate this](http://blog.snowfrog.net/2009/10/26/script-to-correct-first-day-of-week-in-en_au-locale/), so it doesn't get reset by Ubuntu's automatic updates.

See also:



	
  * [Ubuntu Forums](http://ubuntuforums.org/showthread.php?t=101924&page=2)

	
  * [Google](http://www.google.com.au/search?q=gnome+calendar+first+day+of+week&ie=utf-8&oe=utf-8&aq=t&rls=org.mozilla:en-US:official&client=firefox-a)


