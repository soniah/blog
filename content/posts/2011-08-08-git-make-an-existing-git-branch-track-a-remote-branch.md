---
author: sonia
comments: true
date: 2011-08-08 23:54:08+00:00
slug: git-make-an-existing-git-branch-track-a-remote-branch
title: git - make an existing git branch track a remote branch
wordpress_id: 1128
categories:
- Linux
tags:
- Git
---

A script to make an existing git branch track a remote branch. For example when you've cloned from somewhere else and now want to track your normal remote.

    
    % cat ~/bin/gittrack
    #!/bin/bash
    # vim: ai ts=4 sts=4 et sw=4 ft=sh
    
    current_branch=$(git symbolic-ref -q HEAD)
    current_branch=${current_branch##refs/heads/}
    current_branch=${current_branch:-HEAD}
    
    if [ $current_branch = 'HEAD' ] ; then
        echo
        echo "On a detached head. Exiting..."
        exit 1
    fi
    
    remote=${1:-origin}
    
    git branch --set-upstream $current_branch $remote/$current_branch


Of course your global gitconfig should also have autosetupmerge (below), but this script handles situations where you want to setup/change the tracking branch.

    
    [branch]
            autosetupmerge = true
