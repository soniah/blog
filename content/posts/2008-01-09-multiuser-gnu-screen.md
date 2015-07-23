---
title: multiuser gnu screen
author: Sonia Hamilton
date: 2008-01-09
url: /2008/01/09/multiuser-gnu-screen/
categories:
  - Other-Tech
tags:
  - Gnu Screen
---
A [good post on debian-administration][1] on multi-user screen. The key points:

<!--more-->

  * when in screen, type <tt>^A:multiuser on[RET]</tt>
  * the other user(s) connect to the server, then join using the command <tt>screen -x</tt>

 [1]: http://www.debian-administration.org/articles/572
