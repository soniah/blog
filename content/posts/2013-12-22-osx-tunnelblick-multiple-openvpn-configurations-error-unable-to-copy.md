---
author: sonia
date: 2013-12-22
url: /2013/12/22/osx-tunnelblick-multiple-openvpn-configurations-error-unable-to-copy/
title: OSX TunnelBlick Multiple OpenVPN Configurations error unable to copy
categories:
- Other-Tech
tags:
- OSX
- ovpn
- tunnelblick
---

When setting up TunnelBlick, if you have multiple configurations in your ~/Desktop/foo.tblk folder, you'll get an error in the console log like:

<!--more-->

_Unable to copy file foo to /var/private/bar..._


The solution comes from the [TunnelBlick forum](https://groups.google.com/forum/#!msg/tunnelblick-discuss/Gp6OJn_8NxI/nAuvDP1RMxIJ):


_There is a way to install multiple configurations all at once: use a .tblk folder that contains only .tblk folders inside it. So you create a .tblk for each configuration file, put a bunch of them into a folder, and rename the folder with a .tblk. When you double-click that "outer" .tblk, you should be asked once if you want to install "n" configurations._


For example:

{{< highlight shell >}}
cd ~/Desktop/foo.tblk
for f in * ; do
  g=`basename $f`
  mkdir $g.tblk
  mv $f $g.tblk
done
{{< /highlight >}}

Also, the .ovpn files will have "com.apple.quarantine" xattr's. This may or may not cause problems. I removed them in this way:

{{< highlight shell >}}
for f in * ; do
  echo $f
  xattr -d com.apple.quarantine $f
done
{{< /highlight >}}

Also, to [remove old private configuration files](https://groups.google.com/forum/#!topic/tunnelblick-discuss/Th_ESRKPpCo):

{{< highlight shell >}}
cd ~/Library/Application\ Support/Tunnelblick/Configurations
rm -rf *
{{< /highlight >}}

(or, click on VPN icon top right of screen, select 'VPN Details', +/- in the 'Configurations' tab).


