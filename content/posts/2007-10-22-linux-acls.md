---
author: sonia
comments: true
date: 2007-10-22 05:13:07+00:00
slug: linux-acls
title: Linux ACLs
wordpress_id: 89
categories:
- Linux
---

Linux **ACL**s (Access Control Lists) can be a bit difficult at first - here's my understanding of how they work:

**Commands:**



	
  * There's only 2 commands needed - _**getfacl**_ and _**setfacl**_ - display and change acls


**Files:**

When you do a _**getfacl**_ on a file, you'll get this sort of entry:
`
$ ls -al index.html
-rw-rw-r--+ 1 root siteadm 0 Nov 30  2005 index.html
.
$ getfacl --all-effective index.html
# file: index.html
# owner: root
# group: siteadm
user::rw-
user:apache:rw-                 #effective:rw-
group::r--                      #effective:r--
mask::rw-
other::r--
`



	
  * <!-- more -->Notice the **+** at the end of the **_ls -al_** entry  - indicating _**acls**_, and the use of the **--all-effective** option with **getfacl**

	
  * The _first_ and _last_ entries _always always always_ correspond to normal user/owner and other file permissions eg user/owner has read/write and other has read:

`
user::rw-      ->    -rw (for user/owner)
other::r--    ->    -rw (for other)
`
	
  * For applications that _**do**_ understand acls, permissions are exactly as listed in the middle bunch of entries, masked by the mask entry ie the user apache will get rw-, the group (siteadm in this case) will get r--:

`
user:apache:rw-
group::r--
mask::rw-
`
	
  * For applications that _**don't**_ understand acls, permissions correspond to the _**mask**_ ie rw-, to ensure that non-acl aware applications will keep working. Notice how the ls -al output displays the mask entry in the group area:

`
-rw-rw-r--+ 1 root siteadm 0 Nov 30  2005 index.html
mask::rw-
`
To change acls you use the _**setacl**_ command, which is pretty straighforward. For example:
`
$ setfacl -m u:apache:rw- foo.txt
$ setfacl -m user:jan:rwx,group:mysql:rwx bar.txt
`
**Directories:**

Acls need to be considered for directories _themselves_ (eg can user fred delete a particular directory?) and for all objects _underneath_ a directory.



	
  * for directories _themselves,_ setting and getting acls is just the same as for files

	
  * for all objects underneath a directory, you have to consider the "Default ACL" - a special kind of acl that defines the access permissions of all _new_ objects created under a folder. Note - it doesn't effect _existing_ objects!

	
  * _**setfacl**_ uses the _**-d flag**_ to create default acl entries

	
  * the same rules apply for all **default** entries as they do for normal entries: ie the first and last (user and other) entries are directly used, the middle bunch of entries interact with the mask, etc, etc.


