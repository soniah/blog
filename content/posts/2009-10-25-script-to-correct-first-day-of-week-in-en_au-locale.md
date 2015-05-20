---
author: sonia
comments: true
date: 2009-10-25 22:43:47+00:00
slug: script-to-correct-first-day-of-week-in-en_au-locale
title: Script to correct first day of week in en_AU locale
wordpress_id: 591
categories:
- Linux
tags:
- Ubuntu
---

I blogged [previously](http://blog.snowfrog.net/2008/02/06/change-first-day-of-week-in-ubuntus-gnome-calendar/) about how the Australian locale in Ubuntu incorrectly uses Sunday rather than Monday as the first day of the week, and how to manually fix it. Unfortunately, whenever the locale gets updated (eg via one of Ubuntu's regular package updates), the locale reverts and you have to manually fix it again.

So I've written a script that fixes the locale, and also hooked it into dpkg:

    
    % cat fix_locale.sh
    #!/bin/bash
    
    LOCALE_FILE='/usr/share/i18n/locales/en_AU'
    if [ -f $LOCALE_FILE ] ; then
     sudo sed -i 's/^first_weekday.*/first_weekday 2/' $LOCALE_FILE
     sudo locale-gen
     killall gnome-panel
    fi
    


To run this automatically, add a stanza like this to /etc/apt/apt.conf:

    
    APT {
     Update {
     Post-Invoke {"/home/sonia/bin/fix_locale.sh"; };
     };
    };
    
    


The script could be smarter ie check the existing value of first_weekday and only change it if it's different, but I'll fix that when I've got more time.
