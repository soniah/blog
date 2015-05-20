---
author: sonia
comments: true
date: 2007-09-20 06:29:49+00:00
slug: atime-ctime-mtime
title: atime, ctime, mtime
wordpress_id: 83
categories:
- Linux
---

`
You should almost never use atime or ctime in find; mtime
is almost always what you're after.  In particular, atime
is useless if you do backups since it will always reflect
the time of the last backup or greater.`
`
> atime: When the file was last read or written to.
> ctime: when the inode (metadata) was last changed.  Metadata changes
>        that are tracked include file creation, change of ownership,
>        change of permissions.
``
A nice way to see the differences is to play with the 'stat' command:
`<!-- more -->
` $ touch eg
$ stat --printf=" atime=%xn mtime=%yn ctime=%zn" eg
atime=2006-10-30 14:47:13.000000000 +1100
mtime=2006-10-30 14:47:13.000000000 +1100
ctime=2006-10-30 14:47:13.000000000 +1100
$ echo fish > eg	# should change mtime
$ stat --printf=" atime=%xn mtime=%yn ctime=%zn" eg
atime=2006-10-30 14:47:13.000000000 +1100
mtime=2006-10-30 14:47:35.000000000 +1100
ctime=2006-10-30 14:47:35.000000000 +1100
$ cat eg	# should change atime only
fish
$ stat --printf=" atime=%xn mtime=%yn ctime=%zn" eg
atime=2006-10-30 14:48:01.000000000 +1100
mtime=2006-10-30 14:47:35.000000000 +1100
ctime=2006-10-30 14:47:35.000000000 +1100
$
$ chmod go-wr eg	# should change ctime only
$ stat --printf=" atime=%xn mtime=%yn ctime=%zn" eg
atime=2006-10-30 14:48:01.000000000 +1100
mtime=2006-10-30 14:47:35.000000000 +1100
ctime=2006-10-30 14:48:14.000000000 +1100
$ echo dog > eg
$ stat --printf=" atime=%xn mtime=%yn ctime=%zn" eg
atime=2006-10-30 14:48:01.000000000 +1100
mtime=2006-10-30 14:48:33.000000000 +1100
ctime=2006-10-30 14:48:33.000000000 +1100
``
Note that ctime is always greater than or equal to mtime
since mtime changes the node info, (in particular the
size attribute I guess!)
`
Thanks to Matthew Hannigan, SLUG list
