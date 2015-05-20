---
author: sonia
comments: true
date: 2010-02-17 01:38:08+00:00
slug: i-love-handbrakecli-and-dd_rescue
title: I love handbrakecli (and dd_rescue)
wordpress_id: 649
categories:
- Linux
---

I watch lots of (martial arts) instructional videos. Something I've always wanted to do is "mashup" my own videos ie take a few chapters from one video, a few chapters from another video. Now I know how - [handbreakcli](http://trac.handbrake.fr/wiki/CLIGuide):

First, rip the vobs off the dvd. You can work directly off the dvd with handbreak, but working from the hard-disk is often easier. I use dd_rescue for unencrypted dvds. (For scratched dvds, I've been using motorbike visor cleaner to remove the scratches, and [myrescue](http://myrescue.sourceforge.net/)).

    
    for i in /media/cdrom/VIDEO_TS/* ; do
      j=`basename $i`
      dd_rescue $i $j
    done


Use handbrakecli to scan the disk to find the titles and chapters:

    
    ./handbrake -i cd1/VIDEO_TS -t 0


Then convert to mp4's split on chapters (in this case I'm taking chapters 2-18 from title 2, as individual files):

    
    for i in `seq 2 18` ; do
      ./handbrake -i cd1/VIDEO_TS/ -t 2 -c $i -o cd1.t2.c${i}.mp4
    done


Thanks to [EngageMedia](http://www.engagemedia.org) for their great articles. Another good site is [videohelp.com](http://www.videohelp.com)
