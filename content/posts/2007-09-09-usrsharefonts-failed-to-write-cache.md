---
title: '/usr/share/fonts: failed to write cache'
author: Sonia Hamilton
date: 2007-09-10
url: /2007/09/09/usrsharefonts-failed-to-write-cache/
categories:
  - Other-Tech
tags:
  - Ubuntu
---
After doing a fresh install of Ubuntu 7.04 and installing all pending updates via Update Manager, I get an error that starts like this:  

<!--more-->

`<br />
Setting up ttf-opensymbol (2.2.0-1ubuntu4) ...<br />
Updating fontconfig cache...<br />
/usr/share/fonts: failed to write cache<br />
/usr/share/fonts/X11: failed to write cache<br />
`<!--more-->

  
I&#8217;ve had this occur on several machines, and the md5 on the .iso checks out ok, so it&#8217;s a bug ([Bug 104553][1], [Bug 122976][2]) caused by incorrect dates on the font cache. There&#8217;s a solution documented [here][3], but it needs a bit of fixing:  
`<br />
$ sudo bash<br />
# wget -O folder_list.txt http://ubuntuforums.org/attachment.php?attachmentid=28956&d=1175696100<br />
# cat folder_list.txt | xargs touch<br />
# cd /usr/share/fonts/truetype<br />
# for i in * ; do touch ${i}; done<br />
# cd /var/lib/defoma/fontconfig.d<br />
# for i in * ; do touch ${i}; done<br />
# apt-get dist-upgrade<br />
`  
Another post suggests this simpler solution:  
`<br />
$ sudo bash<br />
# find /usr/share/fonts /usr/local/share/fonts /var/lib/defoma/fontconfig.d -type d -print0 | xargs --null touch<br />
`

 [1]: https://bugs.launchpad.net/ubuntu/+source/fontconfig/+bug/104553 "Bug 104553"
 [2]: https://bugs.launchpad.net/ubuntu/+source/openoffice.org/+bug/122976 "Bug 122976"
 [3]: http://ubuntuforums.org/showpost.php?p=2401087&postcount=4
