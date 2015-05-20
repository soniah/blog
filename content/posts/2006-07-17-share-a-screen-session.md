---
author: sonia
comments: true
date: 2006-07-17 05:02:30+00:00
slug: share-a-screen-session
title: share a screen session
wordpress_id: 31
categories:
- Linux
tags:
- Gnu Screen
---

[Screen](http://www.gnu.org/software/screen/) is a really useful console tool that allows you to copy and paste text, scroll back through screen output, reattach if you lose your connection, and so on. One useful trick is sharing a screen between 2 or more users, so you can see what each other is doing whilsts typing - useful for learning or solving a difficult problem (see also [LinuxQuestions.Org](http://wiki.linuxquestions.org/wiki/Screen)).

To do this, all users need to be logged in as the same account - the easiest way to do this is as root:



	
  * **sudo screen** (first user)

	
  * **sudo screen -x** (subsequent users)


Another useful trick is to have multiple sessions running at once, and label each session using the _hardstatus_ command in .screenrc; here are some of the settings I have in my .screenrc:

# display a status line
hardstatus on
hardstatus alwayslastline
hardstatus string "%{.bW}%-w%{.rW}%n %t%{-}%+w %=%{..G} %H %{..Y} %d/%m %C%a"

# change escape key to x - 'ctrl a' used in bash already
escape ^Xx


# define a bigger scrollback, default is 100 lines
defscrollback 1024

