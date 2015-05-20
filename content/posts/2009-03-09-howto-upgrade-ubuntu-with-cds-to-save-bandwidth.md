---
title: HowTo upgrade Ubuntu with CDs to save bandwidth
author: Sonia Hamilton
date: 2009-03-09
url: /2009/03/09/howto-upgrade-ubuntu-with-cds-to-save-bandwidth/
categories:
  - Linux
tags:
  - Ubuntu
---
Notes from a recent post on SLUG:

  * you need to use one of the &#8220;Alternate&#8221; versions of Ubuntu, rather than a &#8220;Live&#8221; version. To quote Jeff Waugh:

*Salient point that I managed to skip: The alternate CD has packages on it,*

*while the Live CD is just a great big compressed image of a filesystem&#8230; so*

*it won&#8217;t help with upgrades at all (yet [1]).*

*[1] Years ago there was some inspired brainstorming about ways to do this*

*very cleverly, but I don&#8217;t imagine it&#8217;s on the agenda at the moment. Net*

*connected upgrades are just so bloody convenient and simple (and ALL of the*

*developers have fantastic net connections, of course).*

  * either insert the cd, and a dialogue box will pop up, or
  * mount the .iso, and run the install

<pre>sudo mount -o loop loop blah_alternate.iso /media/cdrom
gksu "sh /media/cdrom/cdromupgrade"</pre>

See also [http://aptoncd.sourceforge.net][1] and <http://www.ubuntu.com/getubuntu/upgrading>

 [1]: http://aptoncd.sourceforge.net/