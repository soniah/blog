---
author: sonia
comments: true
date: 2011-05-09 03:09:29+00:00
slug: solaris-max-of-100-cron-jobs
title: Solaris - max of 100 cron jobs
wordpress_id: 1018
categories:
- Other-Tech
tags:
- Cron
- Solaris
---

I stumbled across a limitation feature behaviour of Solaris over the weekend - by default it only allows you to run a maximum of 100 cron jobs at once. I suppose this to protect against "shooting oneself in the head", but aaaarghhh... Reminds me why I love Monday mornings.

Anyway, the file to edit is **/etc/cron.d/queuedefs**, see **man queuedefs**.

Thanks to [Solaris Tips](//solaristipsandtricks.blogspot.com/2010/05/solaris-10-cron-and-maxrun.html) for pointing me in the right direction.
