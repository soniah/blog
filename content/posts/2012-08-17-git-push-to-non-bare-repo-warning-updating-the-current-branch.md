---
author: sonia
comments: true
date: 2012-08-17
url: /2012/08/17/git-push-to-non-bare-repo-warning-updating-the-current-branch/
title: 'git push to non-bare repo: warning: updating the current branch'
categories:
- Linux
tags:
- Git
---

Some doco for my work mates, and others learners of git...

<!--more-->

When I was starting with git (many moons ago), learning to pull from a remote repository was easy. But [the book I read](http://pragprog.com/book/tsgit/pragmatic-version-control-using-git) didn't explain how to push to a remote repository. There was [lots of doco on pushing to github](https://help.github.com/), but I wanted to push and pull between my own repositories. When I pushed, I got messages saying **warning: updating the current branch**, and sometimes I'd have to manually clean up the remote branch - yuk.

{{< highlight bash >}}
localbox% git push remotebox master
Counting objects: 1, done.
Writing objects: 100% (1/1), 252 bytes, done.
Total 1 (delta 0), reused 0 (delta 0)
remote: warning: updating the current branch
To sonia@remotebox.net:/home/sonia/dotfiles
   f387640..13740c5  master -> master
{{< /highlight >}}

Then I learned about [bare repositories](http://www.kernel.org/pub/software/scm/git/docs/git-clone.html). Sweet, now I could cleanly push to (bare) remote repositories:

{{< highlight bash >}}
# convention with bare repositories is .git suffix

remotebox% git clone --bare dotfiles dotfiles.git
Cloning into bare repository 'dotfiles.git'...
done.
{{< /highlight >}}

But what if you **want to push to a non-bare repo**? Firewalls mean you often have to hop across several machines using ssh tunnels, and setting up bare repositories all over the place is 'non-optimal'. Or, you want to push between laptops. Or, whatever...

Here's a recipe - just push to a dummy branch (I usually call it 'push'), then do a normal merge on the remote:

{{< highlight bash >}}
# I'm on localbox and I want to push to remotebox, which isn't bare
# git br -a shows me all the remote branches:

localbox% git br -a
* master
  remotes/bourke/master
  remotes/bourke/foo
  remotes/bourke/bar

# pushing to master, foo or bar will give problems, let's push to 'push'

localbox% git push remotebox master:push
Total 0 (delta 0), reused 0 (delta 0)
To sonia@remotebox.net:/home/sonia/dotfiles
 * [new branch]      master -> push

# let's look at that command:

% git push remotebox master:push
           ^         ^      ^
           remote    |      ^
                     from   |
                            to

# ie I'm pushing from master branch to the push branch on remotebox
{{< /highlight >}}

On the remotebox, merge in the push:

{{< highlight bash >}}
remotebox% git br -a               # check all my branches
* master
  foo
  bar
  push

remotebox% git co master           # checkout master
remotebox% git merge push          # merge push into master
remotebox% git br -d push          # cleanup
{{< /highlight >}}

Et Voilà! Done.

**Update**

After a bit more reading on git, I realised that there is another solution. You can push to any branch on a non-bare repository, as long as that branch isn't currently checked out on the remote.

**PS** I have lots of shortcuts in my ~/.gitconfig, like **co** and **br**. Saves typing!

{{< highlight bash >}}
[color]
    ui = auto
[color "branch"]
    current = green
    local = yellow
    remote = red
[color "diff"]
    meta = blue bold
    frag = magenta bold
    old = red bold
    new = green bold
[alias]
    ci = commit
    co = checkout
    st = status
    br = branch
    sb = show-branch
    sbs = show-branch --sha1-name
    gr = log --graph --oneline --left-right
    cl = clean -x -d -f
    dt = difftool
    difft = difftool
[push]
    default = matching
[receive]
    denyCurrentBranch = warn
{{< /highlight >}}
