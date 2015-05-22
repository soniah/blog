---
author: sonia
comments: true
date: 2012-07-07
url: /2012/07/07/vnc-ssh-tunnel-for-remote-graphical-support/
title: vnc ssh tunnel for remote graphical support
categories:
- Linux
tags:
- dns
- Ssh
- Vnc
---

I was doing remote internet support the other day for a friend in England - here's how I connect remotely to the person's desktop in graphical mode, using vnc and an ssh tunnel.

<!--more-->

1. I setup a dyndns client (eg dyndns, tinydyndns, ez-ipupdate) so I can connect to the changing ip address of their machine by a dns name eg fredbox.dyndns.org

[sourcecode language="bash"]
local% sudo apt-get install ez-ipupdate
[/sourcecode]

2. I copy my ssh key to their account - this way I'll always have access and they can change their password in the future:

[sourcecode language="bash"]
local% ssh-copy-id fred@fredbox.dyndns.org
[/sourcecode]

3. I want to connect to vnc running on their desktop, so I can see what they see. But vnc runs on port 5900 and I don't want to leave that open to the Internet. So I build an ssh tunnel, and startup vnc on the remote machine:

[sourcecode language="bash"]
fredbox% ssh -L 5900:localhost:5900 fred@fredbox.dyndns.org
fredbox% x11vnc -safer -usepw -localhost -once -noxdamage \
         -nowf -ncache 0 -scale 2/3 -display :0
[/sourcecode]

4. And finally, I start up my vncviewer on my local Linux/Mac machine, and enter my vnc password when prompted:

[sourcecode language="bash"]
local% vncviewer -encodings "copyrect tight zrle hextile" \
  -bgr233 -compresslevel 5 localhost
[/sourcecode]

So here's a little script that brings it all together:

[sourcecode language="bash"]
#!/bin/bash
# kill any previous/hung vnc's
ssh fred@fredbox.dyndns.org 'pkill x11vnc'
ssh -f -L 5900:localhost:5900 fred@fredbox.dyndns.org \
    'x11vnc -safer -usepw -localhost -once -noxdamage \
      -nowf -ncache 0 -scale 2/3 -display :0' \
    && sleep 5 \
    && vncviewer -encodings "copyrect tight zrle hextile" \
         -bgr233 -compresslevel 5 localhost
[/sourcecode]
