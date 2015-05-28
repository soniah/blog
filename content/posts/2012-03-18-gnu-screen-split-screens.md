---
author: sonia
date: 2012-03-18
url: /2012/03/18/gnu-screen-split-screens/
title: Gnu Screen - split screens
categories:
- Linux
tags:
- Gnu Screen
---

One of the features I've always wished [Gnu screen](http://www.gnu.org/software/screen/manual/screen.html) had was the ability to split a screen horizontally, so you can for example run a grep or [mc](https://www.midnight-commander.org/) in the top half of the terminal, and some commands in the bottom half.

<!--more-->

Well it turns out that you can split screens in Screen, here's how to you do it:



	
  * **C-a S** to split

	
  * **C-a X** to unsplit (and remove the current region)

	
  * **C-a Q** to make the current region the only region


Also, you can bind some keys to move between regions; add these settings to your **~/.screenrc**:

    
    bind j focus down
    bind k focus up
    bind t focus top
    bind b focus bottom


Then you can do things like **C-a j** to move down a region,** C-a k** to move up a region.
