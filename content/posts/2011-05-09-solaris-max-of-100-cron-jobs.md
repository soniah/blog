---
title: Solaris – max of 100 cron jobs
author: Sonia Hamilton
date: 2011-05-09
url: /2011/05/09/solaris-max-of-100-cron-jobs/
categories:
  - Other-Tech
tags:
  - Cron
  - Solaris
---
I stumbled across a <s>limitation</s> <s>feature</s> behaviour of Solaris over the weekend &#8211; by default it only allows you to run a maximum of 100 cron jobs at once. I suppose this to protect against &#8220;shooting oneself in the head&#8221;, but aaaarghhh&#8230; Reminds me why I love Monday mornings.

<!--more-->

Anyway, the file to edit is **/etc/cron.d/queuedefs**, see **man queuedefs**.

Thanks to [Solaris Tips][1] for pointing me in the right direction.

 [1]: //solaristipsandtricks.blogspot.com/2010/05/solaris-10-cron-and-maxrun.html
