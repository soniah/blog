---
title: git hooks – prepare-commit-msg
author: Sonia Hamilton
date: 2011-06-22
url: /2011/06/22/git-hooks-prepare-commit-msg/
categories:
  - Other-Tech
tags:
  - Git
---
When I&#8217;m working with git, I like being able to see a list of files that have changed (new, modified, deleted, etc) in the commit message. So when I do a **git log**, rather than getting this:

<!--more-->

**Update:** foo commented that this was a &#8220;bad idea&#8221; (bordering on wrong?) and suggested I use options like **git log &#8211;stat** instead. See the comments below. Thanks foo!

When I&#8217;m working with git, I like being able to see a list of files that have changed (new, modified, deleted, etc) in the commit message. So when I do a **git log**, rather than getting this:

<pre>commit c1bcfdf4ebd9b0ae952b89f484558ee9eef720b3
Author: Sonia Hamilton
Date:   Fri Jun 17 21:15:53 2011 +1000

    dotjilot code changes</pre>

I get a nice message like this:

<pre>commit c1bcfdf4ebd9b0ae952b89f484558ee9eef720b3
Author: Sonia Hamilton
Date:   Fri Jun 17 21:15:53 2011 +1000

    dotjilot code changes
        modified:   setuplinux
        modified:   funcs</pre>

I used to manually edit the commit message on each commit, but git has a system of hooks that allows you to automate this sort of thing (look in the **repo/.git/hooks** directory for some examples). Here&#8217;s a script to automatically uncomment all changes in the commit message:

<pre>% cat prepare-commit-msg
#!/bin/sh
# use case statement for future flexibility - see prepare-commit-msg.sample
case "$2,$3" in
  *)
    /usr/bin/perl -i.bak -ne 's/^#// if /modified:|new file:|deleted:|renamed:/; print' "$1" ;;
esac</pre>

And here&#8217;s a quick script for setting this up across all your local repos. Remember &#8211; hooks aren&#8217;t synced between repos, so you need to do this on each machine you work on.

<pre>#!/bin/bash
# vim: ai ts=4 sts=4 et sw=4 ft=sh

gitdirs="foo bar baz"
for d in $gitdirs ; do
    if [ -d ${HOME}/${d} ] ; then
        cp prepare-commit-msg ${HOME}/${d}/.git/hooks
    fi
done</pre>

There&#8217;s only one disadvantage to doing this. Usually, you can just exit without saving the commit message and git will cancel the commit. But because the script modifies the message, there&#8217;s no nice way of telling git you want to back out (unless someone can tell me how&#8230;). I get around this by saving the message and doing a **git reset &#8211;soft HEAD^** at the command line.
