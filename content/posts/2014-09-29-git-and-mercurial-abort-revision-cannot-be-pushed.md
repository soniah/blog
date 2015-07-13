---
author: sonia
date: 2014-09-29
url: /2014/09/29/git-and-mercurial-abort-revision-cannot-be-pushed/
title: 'Git and mercurial abort: revision cannot be pushed'
categories:
- Linux
tags:
- Salt
---

I've been migrating some repositories from Mercurial to Git; as part of this migration process some users want to keep using Mercurial locally until they have time to learn git.

<!--more-->

First install the [hg-git](http://hg-git.github.io/) tools; for example on Ubuntu:

{{< highlight bash >}}
sudo aptitude install python-setuptools python-dev
sudo easy_install hg-git
{{< /highlight >}}

Make sure the following is in your ~/.hgrc:

{{< highlight bash >}}
[extensions]
hgext.bookmarks =
hggit = 
{{< /highlight >}}

Then, in your existing mercurial repository, add a new remote that points to the git repository. For example for a BitBucket repository:

{{< highlight bash >}}
cd <mercurial repository>
cat .hg/hgrc
[paths]
# the original hg repository
default = https://username@abcde.org/foo/barhg
# the git version (on BitBucket in this case)
bbgit   = git+ssh://git@bitbucket.org:foo/bar.git
{{< /highlight >}}

Then you can go an _hg push bbgit_ to push from your local hg repository to the remote git repository.



### mercurial abort: revision cannot be pushed



You may get the error _mercurial abort: revision cannot be pushed since it doesn't have a ref_ when pushing from hg to git, or you might notice that your hg work isn't being pushed. The solution here is to reset the hg bookmark for git's master branch:

{{< highlight bash >}}
hg book -f -r tip master
hg push bbgit
{{< /highlight >}}

If you find yourself doing this regularly, this small shell function (in your ~/.bashrc) will help:

{{< highlight bash >}}
hggitpush () {
   # $1 is hg remote name in hgrc for repo
   # $2 is branch (defaults to master)
   hg book -f -r tip ${2:-master}
   hg push $1
}
{{< /highlight >}}

Then from your shell you can run commands like:

{{< highlight bash >}}
hggitpush bbgit dev
hggitpush foogit      # defaults to pushing to master
{{< /highlight >}}

