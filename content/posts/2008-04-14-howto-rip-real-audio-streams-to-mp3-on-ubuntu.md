---
title: howto rip Real Audio streams to mp3 on Ubuntu
author: Sonia Hamilton
date: 2008-04-14
url: /2008/04/14/howto-rip-real-audio-streams-to-mp3-on-ubuntu/
categories:
  - Other-Tech
tags:
  - Audio
  - Ubuntu
---
I enjoy listening to podcasts during my commute, and most podcasts can be easily downloaded using my favourite podcasting tool (currently customised bashpodder, but I'm writing my own).

<!--more-->

But unfortunately some broadcasters (for example a large British one) persist in using weird proprietary formats like &#8220;Real Audio&#8221;. Bah! By the curse of RMS's Beard!

There seems to be conflicting advice (see links below) on how to rip Real Audio to mp3, here's how I got it going on Ubuntu 7.10:

First of all I installed Real Player using instructions [here][1] and [here][2], and checked I could listen to a stream using the GUI tool -- a quick sanity check for firewalls, etc.

  * add repo **deb http://archive.canonical.com/ubuntu feisty partner**
  * sudo aptitude install realplay

Then I installed mplayer and lame: **sudo aptitude install mplayer lame**. I got the source for a stream by right clicking a link, saving it as file, extracting the rstp:// url out of the file, and tested downloading:

$ mplayer rtsp://xyz.net.uk/foo.ra -ao pcm:file=audiofile.wav -vc dummy -vo null

And it failed with these errors:

Opening audio decoder: [realaud] RealAudio decoder  
Error: /usr/lib/win32/sipr.so.6.0: cannot open shared object file: No such file or directory  
Win32 LoadLibrary failed to load: sipr.so.6.0, /usr/lib/win32/sipr.so.6.0, /usr/local/lib/win32/sipr.so.6.0

So I located the **sipr.so** library, and based on the error message and digging around in mplayer using **strings** I linked the installed realplayer codecs to /usr/lib/win32:

$ sudo find / -type f -name &#8220;sipr.so&#8221;  
$ strings /usr/bin/mplayer | grep usr  
$ sudo ln -s /usr/lib/realplay-10.0.9/codecs /usr/lib/win32

I repeated the above mplayer command (which worked) then converted to mp3:

$ mplayer rtsp://xyz.net.uk/foo.ra -ao pcm:file=audiofile.wav -vc dummy -vo null  
$ lame -h -b 128 audiofile.wav audiofile.mp3

Now, all this works for pages that have a direct link to a .ram file. But some sites (for example the BBC) have an embedded Real Player that hides the links to the .ram file -- here's how to find the .ram file:

  * click on the link and start playback the embedded Real Player in Firefox
  * a file called **~/.realplayerrc** will be created -- towards the end of the file there will be a section like this:
<pre>[recent_urls]</pre>

<pre>url0=file:///tmp/foo.ram</pre>

  * cat the **/tmp/foo.ram** file, and copy the **rstp://** link -- ignore the part after the ? (the UID, etc)
  * follow the above instructions for ripping :-)

**Links**

  * [Convert Real audio to MP3 using Linux][3]
  * [Converting Real Audio Streams to MP3][4]
  * [Recording streaming audio with MPlayer][5]
  * [Problems with streaming Real Audio files][6]
  * [BBC RealPlayer -- make your voice heard!][7]

 [1]: https://help.ubuntu.com/community/HowToRipRealaudioStreamsToMp3
 [2]: https://help.ubuntu.com/community/RealPlayerInstallationMethods?action=show&redirect=RealplayerInstallationMethods
 [3]: http://crashrecovery.org/mp3-ripkit/utils/realaudio-to-mp3.html
 [4]: http://stommel.tamu.edu/~baum/linux-music.html#realaudio
 [5]: http://grimthing.com/archives/2004/05/20/recording-streaming-audio-with-mplayer/
 [6]: http://ubuntuforums.org/showthread.php?t=624643
 [7]: http://ubuntuforums.org/archive/index.php/t-447200.html
