---
title: git – rebase and push script
author: Sonia Hamilton
date: 2011-07-18
url: /2011/07/18/git-rebase-and-push-script/
categories:
  - Linux
tags:
  - Git
---
For development projects, I use the standard git workflow ie master is my main branch, and I do development in branches (read more about this recommended workflow at [A successful Git branching model][1]**).

<!--more-->

(** this site also suggests always using **&#8211;no-ff** with merge &#8211; a practice I now follow &#8211; it certainly makes reading history easier)

<div id="attachment_1086" class="wp-caption aligncenter" style="width: 608px">
  <a href="http://blog.snowfrog.net/wp-content/uploads/2011/07/branch-model.png"><img class="size-full wp-image-1086" title="branch-model" src="http://blog.snowfrog.net/wp-content/uploads/2011/07/branch-model.png" alt="nvie.com - A successful Git branching model" width="600" height="262" /></a>
  
  <p class="wp-caption-text">
    nvie.com - A successful Git branching model
  </p>
</div>

When I&#8217;m happy with my work in a dev branch I cherry-pick or merge into master. I&#8217;ll then want to rebase my other dev branches against master, and push all branches to a &#8220;backup&#8221; server (ie a bare git repository). On my dev branches I&#8217;m frequently rewriting history with **git reset**, **git commit &#8211;amend**, and **git rebase -i**, but on my master branch I never rewrite history (ie only ever use **git revert**). So when I push dev branches I&#8217;m going to need to do a **git push -f**, whereas on the master a **git push** will suffice.

I&#8217;m doing this regularly, and it&#8217;s boring and error prone. So I&#8217;ve written a script to automate the whole process ie rebase each dev branch against master, and push all local branches somewhere else. If you have branches off (non-master) branches, this script won&#8217;t work. But I&#8217;ve found in my day-to-day development as a sysadmin ([devop][2]?) my branching isn&#8217;t that complicated, so this script is adequate.

<div id="attachment_1084" class="wp-caption aligncenter" style="width: 869px">
  <a href="http://blog.snowfrog.net/wp-content/uploads/2011/07/branching.png"><img class="size-full wp-image-1084  " title="branching" src="http://blog.snowfrog.net/wp-content/uploads/2011/07/branching.png" alt="If you branch off (non-master) branches, don't use this script! (image: Jon Loelger, &quot;Version Control with Git&quot;)" width="861" height="272" /></a>
  
  <p class="wp-caption-text">
    If you branch off (non-master) branches, don't use this script! (image: Jon Loelger, "Version Control with Git")
  </p>
</div>

<pre>% cat rebase.and.push
#!/bin/bash

# vim: ai ts=4 sts=4 et sw=4 ft=sh

# rebase all local branches against master, then force push
# them to supplied remote. Also push master

original_branch=$(git symbolic-ref -q HEAD)
original_branch=${original_branch##refs/heads/}
original_branch=${original_branch:-HEAD}

if [ $original_branch = 'HEAD' ] ; then
    echo
    echo "On a detached head. Exiting..."
    exit 1
fi

remote=${1:-origin}

# find all local branches
locals=`git br | sed 's/^  |* //' | grep -v master`

# rebase against master
for branch in $locals ; do
    echo
    echo "rebasing against master - $branch ..."
    git co $branch
    if ! [ $? -eq 0 ] ; then
        echo "Unable to checkout $branch. Exiting..."
        exit 1
    fi
    git rebase master
    if ! [ $? -eq 0 ] ; then
        echo "Exiting. Rebase failed..."
        exit 1
    fi
    git push -f $remote $branch
done

echo
echo "push master..."
git co master
if ! [ $? -eq 0 ] ; then
    echo "Unable to checkout master. Exiting..."
    exit 1
fi
git push $remote master

echo
echo "Returning to original branch..."
git co $original_branch</pre>

 [1]: http://nvie.com/posts/a-successful-git-branching-model/
 [2]: http://devopsdownunder.org/
