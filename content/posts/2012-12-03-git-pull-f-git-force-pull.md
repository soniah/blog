---
author: sonia
comments: true
date: 2012-12-03
url: /2012/12/03/git-pull-f-git-force-pull/
title: git pull -f (git force pull)
categories:
- Linux
tags:
- Git
---

Git has a "force push" option (**git push -f remote branch**), but it doesn't have a "force pull" option (like **git pull -f remote branch**).

<!--more-->

This works:

{{< highlight shell >}}
% git fetch remote branch
% git reset --hard FETCH_HEAD
% git clean -df
{{< /highlight >}}

Or, as a function for your bash/zsh config file:

{{< highlight shell >}}
gpuf () {
   # git pull -f $1
   remote=${1:?"need remote to force pull from"}

   current_branch=$(git symbolic-ref -q HEAD)
   current_branch=${current_branch##refs/heads/}
   current_branch=${current_branch:-HEAD}
   if [ $current_branch = 'HEAD' ] ; then
       echo
       echo "On a detached head. Exiting..."
       exit 1
   fi  

   git fetch $remote $current_branch
   git reset --hard FETCH_HEAD
   git clean -df 
}
{{< /highlight >}}


