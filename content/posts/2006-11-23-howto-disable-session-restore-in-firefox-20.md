---
author: sonia
comments: true
date: 2006-11-23 02:34:20+00:00
slug: howto-disable-session-restore-in-firefox-20
title: HowTo Disable Session Restore in Firefox 2.0
wordpress_id: 48
categories:
- Linux
tags:
- Firefox
---

Firefox 2.0 has a new feature called Session Restore; I find it annoying on my laptop as I'm always shutting down without closing Firefox correctly. Here's how to disable it:



	
  1. Go to about:config

	
  2. Right click the list of items, go New -> Boolean

	
  3. preference name should be: browser.sessionstore.enabled

	
  4. value False


On more recent versions of Firefox 2, the preference is already included; just search for it and toggle it to _false_.

More information at: [http://wiki.mozilla.org/Session_Restore](http://wiki.mozilla.org/Session_Restore)

(Thanks to Scott, SLUG list)
