---
title: Change first day of week in Ubuntu’s Gnome Calendar
author: Sonia Hamilton
date: 2008-02-06
url: /2008/02/06/change-first-day-of-week-in-ubuntus-gnome-calendar/
categories:
  - Linux
tags:
  - Ubuntu
---
Under the Australian locale, the first day of the week appears as Sunday rather than Monday, which is incorrect. To change it:

<!--more-->

  * check which locale is running, using the **locale** command (ie **en_AU**)
  * **sudo vi /usr/share/i18n/locales/en_AU** and change **first_weekday** and **first_workday** to 2
  * regenerate the locale using **sudo locale-gen**
  * get the calendar to reload using **killall gnome-panel**

In another post, I also show [how to automate this][1], so it doesn't get reset by Ubuntu's automatic updates.

See also:

  * [Ubuntu Forums][2]
  * [Google][3]

 [1]: http://blog.snowfrog.net/2009/10/26/script-to-correct-first-day-of-week-in-en_au-locale/
 [2]: http://ubuntuforums.org/showthread.php?t=101924&page=2
 [3]: http://www.google.com.au/search?q=gnome+calendar+first+day+of+week&ie=utf-8&oe=utf-8&aq=t&rls=org.mozilla:en-US:official&client=firefox-a
