---
title: I love handbrakecli (and dd_rescue)
author: Sonia Hamilton
date: 2010-02-17
url: /2010/02/17/i-love-handbrakecli-and-dd_rescue/
categories:
  - Linux
---
I watch lots of (martial arts) instructional videos.

<!--more-->

Something I&#8217;ve always wanted to do is &#8220;mashup&#8221; my own videos ie take a few chapters from one video, a few chapters from another video. Now I know how &#8211; [handbreakcli][1]:

First, rip the vobs off the dvd. You can work directly off the dvd with handbreak, but working from the hard-disk is often easier. I use dd_rescue for unencrypted dvds. (For scratched dvds, I&#8217;ve been using motorbike visor cleaner to remove the scratches, and [myrescue][2]).

<pre>for i in /media/cdrom/VIDEO_TS/* ; do
  j=`basename $i`
  dd_rescue $i $j
done</pre>

Use handbrakecli to scan the disk to find the titles and chapters:

<pre>./handbrake -i cd1/VIDEO_TS -t 0</pre>

Then convert to mp4&#8217;s split on chapters (in this case I&#8217;m taking chapters 2-18 from title 2, as individual files):

<pre>for i in `seq 2 18` ; do
  ./handbrake -i cd1/VIDEO_TS/ -t 2 -c $i -o cd1.t2.c${i}.mp4
done</pre>

Thanks to [EngageMedia][3] for their great articles. Another good site is [videohelp.com][4]

 [1]: http://trac.handbrake.fr/wiki/CLIGuide
 [2]: http://myrescue.sourceforge.net/
 [3]: http://www.engagemedia.org
 [4]: http://www.videohelp.com
