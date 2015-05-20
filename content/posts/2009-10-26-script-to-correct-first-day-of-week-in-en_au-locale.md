---
title: Script to correct first day of week in en_AU locale
author: Sonia Hamilton
date: 2009-10-25
url: /2009/10/26/script-to-correct-first-day-of-week-in-en_au-locale/
categories:
  - Linux
tags:
  - Ubuntu
---
I blogged [previously][1] about how the Australian locale in Ubuntu incorrectly uses Sunday rather than Monday as the first day of the week, and how to manually fix it. Unfortunately, whenever the locale gets updated (eg via one of Ubuntu&#8217;s regular package updates), the locale reverts and you have to manually fix it again.

So I&#8217;ve written a script that fixes the locale, and also hooked it into dpkg:

<pre>% cat fix_locale.sh
#!/bin/bash

LOCALE_FILE='/usr/share/i18n/locales/en_AU'
if [ -f $LOCALE_FILE ] ; then
 sudo sed -i 's/^first_weekday.*/first_weekday 2/' $LOCALE_FILE
 sudo locale-gen
 killall gnome-panel
fi
</pre>

To run this automatically, add a stanza like this to /etc/apt/apt.conf:

<pre>APT {
 Update {
 Post-Invoke {"/home/sonia/bin/fix_locale.sh"; };
 };
};

</pre>

The script could be smarter ie check the existing value of first_weekday and only change it if it&#8217;s different, but I&#8217;ll fix that when I&#8217;ve got more time.

 [1]: http://blog.snowfrog.net/2008/02/06/change-first-day-of-week-in-ubuntus-gnome-calendar/
