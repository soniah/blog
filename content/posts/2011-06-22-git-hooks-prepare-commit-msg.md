---
author: sonia
comments: true
date: 2011-06-22 03:03:06+00:00
slug: git-hooks-prepare-commit-msg
title: git hooks - prepare-commit-msg
wordpress_id: 1043
categories:
- Other-Tech
tags:
- Git
---

**Update:** foo commented that this was a "bad idea" (bordering on wrong?) and suggested I use options like **git log --stat** instead. See the comments below. Thanks foo!

When I'm working with git, I like being able to see a list of files that have changed (new, modified, deleted, etc) in the commit message. So when I do a **git log**, rather than getting this:

    
    commit c1bcfdf4ebd9b0ae952b89f484558ee9eef720b3
    Author: Sonia Hamilton
    Date:   Fri Jun 17 21:15:53 2011 +1000
    
        dotjilot code changes


I get a nice message like this:

    
    commit c1bcfdf4ebd9b0ae952b89f484558ee9eef720b3
    Author: Sonia Hamilton
    Date:   Fri Jun 17 21:15:53 2011 +1000
    
        dotjilot code changes
            modified:   setuplinux
            modified:   funcs


I used to manually edit the commit message on each commit, but git has a system of hooks that allows you to automate this sort of thing (look in the **repo/.git/hooks** directory for some examples). Here's a script to automatically uncomment all changes in the commit message:

    
    % cat prepare-commit-msg
    #!/bin/sh
    # use case statement for future flexibility - see prepare-commit-msg.sample
    case "$2,$3" in
      *)
        /usr/bin/perl -i.bak -ne 's/^#// if /modified:|new file:|deleted:|renamed:/; print' "$1" ;;
    esac


And here's a quick script for setting this up across all your local repos. Remember - hooks aren't synced between repos, so you need to do this on each machine you work on.

    
    #!/bin/bash
    # vim: ai ts=4 sts=4 et sw=4 ft=sh
    
    gitdirs="foo bar baz"
    for d in $gitdirs ; do
        if [ -d ${HOME}/${d} ] ; then
            cp prepare-commit-msg ${HOME}/${d}/.git/hooks
        fi
    done


There's only one disadvantage to doing this. Usually, you can just exit without saving the commit message and git will cancel the commit. But because the script modifies the message, there's no nice way of telling git you want to back out (unless someone can tell me how...). I get around this by saving the message and doing a **git reset --soft HEAD^** at the command line.
