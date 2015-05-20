---
title: Disable Evolution notifications in Ubuntu
author: Sonia Hamilton
date: 2008-04-16
url: /2008/04/17/disable-evolution-notifications-in-ubuntu/
categories:
  - Linux
tags:
  - Ubuntu
---
**Update 17-Apr-2008**

The steps below don&#8217;t seem to solve the problem. For the moment the easiest way to get rid of the Evolution letter icon (which appears in the *notification_area*) is to create a new panel, drag across the stuff you want, and delete the old panel (package update notifications will then appear on the Panel Menu &#8211; TODO check update-notifier is removed). I can see *notification_area* in gconf-editor at /apps/panel/applets, but can&#8217;t yet work out a way of deleting it &#8211; right clicking etc doesn&#8217;t work. Will play with gconftool and RTFM.

**End Updates**

I&#8217;ve just started using Evolution to access the hExchange server at work, and it keeps on popping up new email notifications (even though I&#8217;ve disabled it in Evolution and restarted X) &#8211; too much like Winblows for my likings. Other crap keeps popping up and annoying me too &#8211; here&#8217;s how to disable it all:

First, disable the update-notifier via: &#8220;System > Preferences > Sessions&#8221;, under &#8220;Startup Programs&#8221;; remove &#8220;update-notifier&#8221;. Also check that it isn&#8217;t being started up in the saved session by first killing it (ps ax | grep update; kill 12345) and saving a new session.

Then, run **gconf-editor** (from the shell) search on notification, and disable:

  * /apps/evolution/mail/notification

See also:

  * [Question #3921 in gnome-panel in ubuntu][1].

 [1]: https://answers.launchpad.net/ubuntu/+source/gnome-panel/+question/3921
