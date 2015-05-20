---
title: atime, ctime, mtime
author: Sonia Hamilton
date: 2007-09-20
url: /2007/09/20/atime-ctime-mtime/
categories:
  - Linux
---
`<br />
You should almost never use atime or ctime in find; mtime<br />
is almost always what you're after.  In particular, atime<br />
is useless if you do backups since it will always reflect<br />
the time of the last backup or greater.`  
`<br />
> atime: When the file was last read or written to.<br />
> ctime: when the inode (metadata) was last changed.  Metadata changes<br />
>        that are tracked include file creation, change of ownership,<br />
>        change of permissions.<br />
``<br />
A nice way to see the differences is to play with the 'stat' command:<br />
`<!--more-->

  
` $ touch eg<br />
$ stat --printf=" atime=%xn mtime=%yn ctime=%zn" eg<br />
atime=2006-10-30 14:47:13.000000000 +1100<br />
mtime=2006-10-30 14:47:13.000000000 +1100<br />
ctime=2006-10-30 14:47:13.000000000 +1100<br />
$ echo fish > eg	# should change mtime<br />
$ stat --printf=" atime=%xn mtime=%yn ctime=%zn" eg<br />
atime=2006-10-30 14:47:13.000000000 +1100<br />
mtime=2006-10-30 14:47:35.000000000 +1100<br />
ctime=2006-10-30 14:47:35.000000000 +1100<br />
$ cat eg	# should change atime only<br />
fish<br />
$ stat --printf=" atime=%xn mtime=%yn ctime=%zn" eg<br />
atime=2006-10-30 14:48:01.000000000 +1100<br />
mtime=2006-10-30 14:47:35.000000000 +1100<br />
ctime=2006-10-30 14:47:35.000000000 +1100<br />
$<br />
$ chmod go-wr eg	# should change ctime only<br />
$ stat --printf=" atime=%xn mtime=%yn ctime=%zn" eg<br />
atime=2006-10-30 14:48:01.000000000 +1100<br />
mtime=2006-10-30 14:47:35.000000000 +1100<br />
ctime=2006-10-30 14:48:14.000000000 +1100<br />
$ echo dog > eg<br />
$ stat --printf=" atime=%xn mtime=%yn ctime=%zn" eg<br />
atime=2006-10-30 14:48:01.000000000 +1100<br />
mtime=2006-10-30 14:48:33.000000000 +1100<br />
ctime=2006-10-30 14:48:33.000000000 +1100<br />
``<br />
Note that ctime is always greater than or equal to mtime<br />
since mtime changes the node info, (in particular the<br />
size attribute I guess!)<br />
`  
Thanks to Matthew Hannigan, SLUG list
