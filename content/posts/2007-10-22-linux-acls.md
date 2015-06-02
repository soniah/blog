---
title: Linux ACLs
author: Sonia Hamilton
date: 2007-10-22
url: /2007/10/22/linux-acls/
categories:
  - Linux
---
Linux **ACL**s (Access Control Lists) can be a bit difficult at first -- here&#8217;s my understanding of how they work:

<!--more-->

**Commands:**

  * There&#8217;s only 2 commands needed -- ***getfacl*** and ***setfacl*** -- display and change acls

**Files:**

When you do a ***getfacl*** on a file, you&#8217;ll get this sort of entry:  
`<br />
$ ls -al index.html<br />
-rw-rw-r--+ 1 root siteadm 0 Nov 30  2005 index.html<br />
.<br />
$ getfacl --all-effective index.html<br />
# file: index.html<br />
# owner: root<br />
# group: siteadm<br />
user::rw-<br />
user:apache:rw-                 #effective:rw-<br />
group::r--                      #effective:r--<br />
mask::rw-<br />
other::r--<br />
`

  * <!--more-->Notice the 
    
    **+** at the end of the ***ls -al*** entry -- indicating ***acls***, and the use of the **--all-effective** option with **getfacl**
  * The *first* and *last* entries *always always always* correspond to normal user/owner and other file permissions eg user/owner has read/write and other has read:
`<br />
user::rw-      ->    -rw (for user/owner)<br />
other::r--    ->    -rw (for other)<br />
`

  * For applications that ***do*** understand acls, permissions are exactly as listed in the middle bunch of entries, masked by the mask entry ie the user apache will get rw-, the group (siteadm in this case) will get r--:
`<br />
user:apache:rw-<br />
group::r--<br />
mask::rw-<br />
`

  * For applications that ***don&#8217;t*** understand acls, permissions correspond to the ***mask*** ie rw-, to ensure that non-acl aware applications will keep working. Notice how the ls -al output displays the mask entry in the group area:
`<br />
-rw-rw-r--+ 1 root siteadm 0 Nov 30  2005 index.html<br />
mask::rw-<br />
`</ul> 

To change acls you use the ***setacl*** command, which is pretty straighforward. For example:  
`<br />
$ setfacl -m u:apache:rw- foo.txt<br />
$ setfacl -m user:jan:rwx,group:mysql:rwx bar.txt<br />
`  
**Directories:**

Acls need to be considered for directories *themselves* (eg can user fred delete a particular directory?) and for all objects *underneath* a directory.

  * for directories *themselves,* setting and getting acls is just the same as for files
  * for all objects underneath a directory, you have to consider the &#8220;Default ACL&#8221; -- a special kind of acl that defines the access permissions of all *new* objects created under a folder. Note -- it doesn&#8217;t effect *existing* objects!
  * ***setfacl*** uses the ***-d flag*** to create default acl entries
  * the same rules apply for all **default** entries as they do for normal entries: ie the first and last (user and other) entries are directly used, the middle bunch of entries interact with the mask, etc, etc.
