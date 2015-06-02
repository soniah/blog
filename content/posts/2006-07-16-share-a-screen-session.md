---
title: share a screen session
author: Sonia Hamilton
date: 2006-07-17
url: /2006/07/16/share-a-screen-session/
categories:
  - Linux
tags:
  - Gnu Screen
---
[Screen][1] is a really useful console tool that allows you to copy and paste text, scroll back through screen output, reattach if you lose your connection, and so on. One useful trick is sharing a screen between 2 or more users, so you can see what each other is doing whilsts typing -- useful for learning or solving a difficult problem (see also [LinuxQuestions.Org][2]).
<!--more-->
To do this, all users need to be logged in as the same account -- the easiest way to do this is as root:

  * **sudo screen** (first user)
  * **sudo screen -x** (subsequent users)

Another useful trick is to have multiple sessions running at once, and label each session using the *hardstatus* command in .screenrc; here are some of the settings I have in my .screenrc:

<font face="courier new,courier,monospace"># display a status line<br /> hardstatus on<br /> hardstatus alwayslastline<br /> hardstatus string &#8220;%{.bW}%-w%{.rW}%n %t%{-}%+w %=%{..G} %H %{..Y} %d/%m %C%a&#8221;</font>

<font face="courier new,courier,monospace"># change escape key to x -- &#8216;ctrl a&#8217; used in bash already<br /> escape ^Xx<br /> </font>

<font face="courier new,courier,monospace"># define a bigger scrollback, default is 100 lines<br /> defscrollback 1024<br /> </font>

 [1]: http://www.gnu.org/software/screen/
 [2]: http://wiki.linuxquestions.org/wiki/Screen
