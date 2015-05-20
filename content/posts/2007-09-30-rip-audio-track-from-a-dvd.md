---
author: sonia
comments: true
date: 2007-09-30 13:37:16+00:00
slug: rip-audio-track-from-a-dvd
title: dvd ripping
wordpress_id: 84
categories:
- Linux
tags:
- Audio
---

**Rip audio from a dvd **

`mencoder dvd://2 -oac mp3lame -lameopts br=96:cbr:vol=6 -ovc frameno -o track2.mp3`

`for i in ../vobs/* ; do j=${i##*/} mencoder "${i}" -oac pcm -ovc frameno -o "${j}" done`

See also:



	
  * [http://axljab.homelinux.org/Mencoder_DVD_to_MPEG-4](http://axljab.homelinux.org/Mencoder_DVD_to_MPEG-4)

	
  * [http://f0rked.com/projects/simplerip](http://f0rked.com/projects/simplerip)

	
  * [http://gentoo-wiki.com/HOWTO_Rip_DVD_mencoder](http://gentoo-wiki.com/HOWTO_Rip_DVD_mencoder)


**Rip entire dvd**



	
  * [dd_rhelp](http://www.kalysto.org/utilities/dd_rhelp/index.en.html) + dd_rescue

`for i in /media/cdrom0/video_ts/* ; do j=${i##*/} dd_rhelp "${i}" "${j}" done`
	
  * vobcopy


