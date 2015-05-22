---
author: sonia
comments: true
date: 2013-07-21
url: /2013/07/21/debfoster-keeping-a-debian-system-small/
title: debfoster - keeping a Debian system small
wordpress_id: 1886
categories:
- Linux
tags:
- Debian
- EeePC
- Ubuntu
---

I recently came across a useful tool while reading [The Debian Administrator's Handbook](http://debian-handbook.info/) - **debfoster**. I use it on space constrained machines, like my venerable [Asus eeePC 701](https://en.wikipedia.org/wiki/Asus_Eee_PC#Eee_700_series) (which is great for travelling). As Raphaël Hertzog and Roland Mas [explain](http://debian-handbook.info/browse/stable/sect.apt-frontends.html):


_debfoster has a more elaborate approach, very similar to aptitude's: it maintains a list of packages that have been explicitly installed, and remembers what packages are really required between each invocation. If new packages appear on the system and if debfoster doesn't know them as required packages, they will be shown on the screen together with a list of their dependencies. The program then offers a choice: remove the package (possibly together with those that depend on it), mark it as explicitly required, or ignore it temporarily._


Other useful tools are **dpigs** (from the package debian-goodies) and **wajig large**. For example:

    
    % dpigs
    88963 libgl1-mesa-dri
    78624 linux-image-3.2.0-4-486
    42613 gimp-data
    42128 smbclient
    33224 freepats
    28731 xulrunner-17.0
    26400 vlc-data
    23332 libwebkitgtk-1.0-0
    22368 vim-runtime
    21723 libicu48


The commandlinefu.com topic [List your largest installed packages (on Debian/Ubuntu)](http://www.commandlinefu.com/commands/view/3842/list-your-largest-installed-packages-on-debianubuntu) has some useful commands:

[sourcecode lang="shell"]
% sed -ne '/^Package: \(.*\)/{s//\1/;h;};/^Installed-Size: \(.*\)/{s//\1/;G;s/\n/ /;p;}'\
  /var/lib/dpkg/status | sort -rn

% dpkg-query -Wf '${Installed-Size}\t${Package}\n' | sort -n

% dpkg --get-selections | cut -f1 | while read pkg; do dpkg -L $pkg | xargs -I'{}' bash -c \
  'if [ ! -d "{}" ]; then echo "{}"; fi' | tr '\n' '\000' | du -c --files0-from - |\
   tail -1 | sed "s/total/$pkg/"; done

% awk '{if ($1 ~ /Package/) p = $2; if ($1 ~ /Installed/) printf("%9d %s\n", $2, p)}' \
   /var/lib/dpkg/status | sort -n | tail
[/sourcecode]

The [download sources for Eeebuntu](http://www.auroraos.org/release/eeebuntu) seem to be broken, and nowadays I'm generally preferring Debian over Ubuntu, so on my eeePC I'm running [Debian with LXDE](http://wiki.debian.org/LXDE) - it seems to work well.




![](https://upload.wikimedia.org/wikipedia/commons/thumb/c/cb/ASUS_Eee_PC_PIC_0971.JPG/220px-ASUS_Eee_PC_PIC_0971.JPG)
