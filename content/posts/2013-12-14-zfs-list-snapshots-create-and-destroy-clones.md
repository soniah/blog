---
author: sonia
comments: true
date: 2013-12-14
url: /2013/12/14/zfs-list-snapshots-create-and-destroy-clones/
title: ZFS List Snapshots, Create and Destroy Clones
categories:
- Linux
tags:
- BSD
- FreeBSD
- ZFS
---

I'm using [FreeNAS](http://www.freenas.org/) for my storage at home, liking it a lot. But the web interface can get rather slow when searching for snapshots, [as always the shell is faster](http://en.wikipedia.org/wiki/In_the_Beginning..._Was_the_Command_Line).

<!--more-->

Some notes for me on listing ZFS snapshots, and creating and destroying clones.

[sourcecode lang="shell"]
cd /mnt/vol01/bjj
zfs list -t snapshot | grep bjj | grep -v vobs
zfs clone vol01/bjj@auto-20131214.12d vol01/bjj/auto-20131214.12d
cd auto-20131214.12d

# after recovery tasks, umount snapshot
cd /mnt/vol01/bjj
umount auto-20131214.12d
rmdir auto-20131214.12d

# usually want to umount not destroy, as a
# destroy may cascade delete other dependent snapshots
zfs destroy vol01/bjj/foo
[/sourcecode]
