---
author: sonia
comments: true
date: 2008-03-19 05:48:19+00:00
slug: suid-sgid-sticky-bit-permissions
title: suid, sgid, sticky bit, permissions
wordpress_id: 119
categories:
- Linux
---

I've been going to a few job interviews recently. One the standard '_tricky_' (oooooh) Linux questions is "_explain suid, sgid, sticky bit, etc_". I usually don't rote learn this sort of stuff (that's what manpages and Google are for), here's my summary:



	
  * **4000** (chmod u+s) is **suid**; for _files_ execute as owning user (often root).

	
  * **2000** (chmod g+s) is **sgid**; for _files_ execute as owning group (often root); for _directories_ the group on newly created files will be set to the directory's group rather than the creator's group. Typically used for shared directories.

	
  * **suid** and **sgid** are ignored on scripts, due to the security risk

	
  * **1000** (chmod +t) is **sticky** bit ("save **text** image"); for _files_ it used to be 'pin in memory' but is now ignored; for _directories_ only root, file owner and directory owner can delete a file (even if non-owners have directory write permissions). Typically used for /tmp. **---t------**

	
  * capital letters when doing **ls -al** usually means the permissions have been set incorrectly eg **-r-S------** SUID is set, but owner execute is not set. However (?check?) **-rw------T** means no update of "last modified time"; usually used for swap _files_ (not very common nowadays - swap is usually a partition).


**Directory Permissions**



	
  * **read** list files

	
  * **write** add or remove files

	
  * **execute** open or execute files, cd into directory


**Also, [Access, Change, Modify](http://articles.rootsmith.ca/linux/unix-access-modify-and-change-times)**

Here are the definitions of the different UNIX time information on a file with how they are typically referred to in man pages and the option to list the particular time with the ls command.

Access Time | **atime** | -ul
This is the time that the file was last _accessed _or_ read_, unless **noatime** has been used for the mount point. (Mutt is the rare application that relies on access times, this [Archlinux article](https://wiki.archlinux.org/index.php/fstab#atime_options) discusses Mutt and **relatime**).

Change Time | **ctime** | -cl
This is the time that the_ inode information_ (permissions, name, etc, the metadata, as it were) was last modified.

Modify Time | **mtime** | -l
This is the last time the _actual contents_ of the file were last modified.

_atime_ doesn’t change when the file contents are written to, but both _ctime_ and _mtime_ do. Opening a file in an editor will of course read the file, thus changing the _atime_; but using_ cat foo > bar_ won't change the _atime_ of bar.

**Addendum**

An old Unix hand told me this trick: directories for mount points should be created **d--x--x--x**. That way if the directory is unmounted, it's obvious that "this directory is a mount point".
