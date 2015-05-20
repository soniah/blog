---
author: sonia
comments: true
date: 2008-10-07 00:47:32+00:00
slug: how-to-configure-central-sysloging-on-solaris
title: How to configure central syslog'ing on Solaris
wordpress_id: 172
categories:
- Other-Tech
tags:
- Solaris
---

Quick notes; [see Solaris: Logging to a separate loghost, the easy way](http://woss.name/2007/06/17/solaris-logging-to-a-separate-loghost-the-easy-way/).



	
  * edit /etc/inet/hosts, add in an alias for loghost eg **1.2.3.4 loghost**

	
  * **/etc/init.d/syslog restart** (Solaris 8), svcadm on later versions


Other useful links for 'the Solaris way' (vs Linux):

	
  * [Rosetta Stone for Unix](http://bhami.com/rosetta.html)

	
  * [Some Solaris Knowledge](http://www.zagbot.com/solaris.html) (thanks Lindsay)


