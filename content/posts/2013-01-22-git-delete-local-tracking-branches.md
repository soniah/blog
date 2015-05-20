---
author: sonia
comments: true
date: 2013-01-22 22:11:48+00:00
slug: git-delete-local-tracking-branches
title: git - delete local tracking branches
wordpress_id: 1775
categories:
- Linux
tags:
- Git
---

(Just a summary of [Stack Overflow "How do you Remove an Invalid Remote Branch Reference from Git?"](http://stackoverflow.com/questions/1072171/how-do-you-remove-an-invalid-remote-branch-reference-from-git)).

To delete a local tracking branch (without deleting the remote branch), do:

[sourcecode language="shell"]
git branch -rd remote/branch
[/sourcecode]

And of course to delete the remote branch:

[sourcecode language="shell"]
git push remote :branch
[/sourcecode]

Occasionally a gc will help, but usually shouldn't be used:

[sourcecode language="shell"]
git gc --prune=now
[/sourcecode]

So, when would you want to use this? Let's say the repository you're tracking has a lot of branches (eg the Linux Kernel). You start tracking branch "foo", do some work with it, merge some of it in to your branch "bar", then push "bar" up to the remote repository. Or, you've got a whole lot of dev branches you've merged pushed to your backup repository and also merged into your master branch.

In either case you've got a collection of tracking branches you don't want to see anymore, so clean them up:

[sourcecode language="shell"]
% git branch -r
  soniah/dev.a
  soniah/dev.b
  soniah/dev.c
  soniah/dev.d
  soniah/master

% git branch -rd soniah/dev.a
Deleted remote branch soniah/dev.a (was deadbeef).

% git branch -rd soniah/dev.b
Deleted remote branch soniah/dev.b (was deadbeef).

# now remote branches is cleaner:
% git branch -r
  soniah/dev.c
  soniah/dev.d
  soniah/master
[/sourcecode]

