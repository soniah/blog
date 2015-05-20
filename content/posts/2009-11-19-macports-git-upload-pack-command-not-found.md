---
author: sonia
comments: true
date: 2009-11-19 01:22:17+00:00
slug: macports-git-upload-pack-command-not-found
title: 'macports: git-upload-pack: command not found'
wordpress_id: 616
categories:
- Other-Tech
tags:
- Git
- OSX
---

When doing a **git clone** from a repo hosted on a Mac OSX machine (installed using macports), I get this error on the client (Linux, cygwin, whatever):

    
    git-upload-pack: command not found


Solution is to do this on the OSX machine:

    
    cd /usr/bin
    sudo ln -s /opt/local/bin/git* .
    


Obviously some $PATH funkiness is going on somewhere on the Mac, and I should find a better fix. My personal $PATH on the Mac _is_ OK:

    
    $ echo $PATH
    /opt/local/bin:/opt/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin
