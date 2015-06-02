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
I've just started using Evolution to access the hExchange server at work, and it keeps on popping up new email notifications (even though I've disabled it in Evolution and restarted X) -- too much like Winblows for my likings.

<!--more-->

**Update 17-Apr-2008**

The steps below don't seem to solve the problem. For the moment the easiest way to get rid of the Evolution letter icon (which appears in the *notification_area*) is to create a new panel, drag across the stuff you want, and delete the old panel (package update notifications will then appear on the Panel Menu -- TODO check update-notifier is removed). I can see *notification_area* in gconf-editor at /apps/panel/applets, but can't yet work out a way of deleting it -- right clicking etc doesn't work. Will play with gconftool and RTFM.

**End Updates**

I've just started using Evolution to access the hExchange server at work, and it keeps on popping up new email notifications (even though I've disabled it in Evolution and restarted X) -- too much like Winblows for my likings. Other crap keeps popping up and annoying me too -- here's how to disable it all:

First, disable the update-notifier via: "System > Preferences > Sessions", under "Startup Programs"; remove "update-notifier". Also check that it isn't being started up in the saved session by first killing it (ps ax | grep update; kill 12345) and saving a new session.

Then, run **gconf-editor** (from the shell) search on notification, and disable:

  * /apps/evolution/mail/notification

See also:

  * [Question #3921 in gnome-panel in ubuntu][1].

 [1]: https://answers.launchpad.net/ubuntu/+source/gnome-panel/+question/3921
