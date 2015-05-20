---
title: dvd ripping
author: Sonia Hamilton
date: 2007-09-30
url: /2007/09/30/rip-audio-track-from-a-dvd/
categories:
  - Linux
tags:
  - Audio
---
**Rip audio from a dvd **

`mencoder dvd://2 -oac mp3lame -lameopts br=96:cbr:vol=6 -ovc frameno -o track2.mp3`

`for i in ../vobs/* ; do j=${i##*/} mencoder "${i}" -oac pcm -ovc frameno -o "${j}" done`

See also:

  * [http://axljab.homelinux.org/Mencoder\_DVD\_to_MPEG-4][1]
  * <http://f0rked.com/projects/simplerip>
  * [http://gentoo-wiki.com/HOWTO\_Rip\_DVD_mencoder][2]

**Rip entire dvd**

  * [dd_rhelp][3] + dd_rescue
`for i in /media/cdrom0/video_ts/* ; do j=${i##*/} dd_rhelp "${i}" "${j}" done`

  * vobcopy

 [1]: http://axljab.homelinux.org/Mencoder_DVD_to_MPEG-4
 [2]: http://gentoo-wiki.com/HOWTO_Rip_DVD_mencoder
 [3]: http://www.kalysto.org/utilities/dd_rhelp/index.en.html "dd_rhelp"
