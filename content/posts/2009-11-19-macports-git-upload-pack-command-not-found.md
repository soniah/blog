---
title: 'macports: git-upload-pack: command not found'
author: Sonia Hamilton
date: 2009-11-19
url: /2009/11/19/macports-git-upload-pack-command-not-found/
categories:
  - Other-Tech
tags:
  - Git
  - OSX
---
When doing a **git clone** from a repo hosted on a Mac OSX machine (installed using macports), I get this error on the client (Linux, cygwin, whatever):

<pre>git-upload-pack: command not found</pre>

Solution is to do this on the OSX machine:

<pre>cd /usr/bin
sudo ln -s /opt/local/bin/git* .
</pre>

Obviously some $PATH funkiness is going on somewhere on the Mac, and I should find a better fix. My personal $PATH on the Mac *is* OK:

<pre>$ echo $PATH
/opt/local/bin:/opt/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin</pre>
