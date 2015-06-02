---
title: suid, sgid, sticky bit, permissions
author: Sonia Hamilton
date: 2008-03-19
url: /2008/03/19/suid-sgid-sticky-bit-permissions/
categories:
  - Linux
---
I've been going to a few job interviews recently. One the standard &#8216;*tricky*&#8216; (oooooh) Linux questions is &#8220;*explain suid, sgid, sticky bit, etc*&#8220;.

<!--more-->

I usually don't rote learn this sort of stuff (that's what manpages and Google are for), here's my summary:

  * **4000** (chmod u+s) is **suid**; for *files* execute as owning user (often root).
  * **2000** (chmod g+s) is **sgid**; for *files* execute as owning group (often root); for *directories* the group on newly created files will be set to the directory's group rather than the creator's group. Typically used for shared directories.
  * **suid** and **sgid** are ignored on scripts, due to the security risk
  * **1000** (chmod +t) is **sticky** bit (&#8220;save **text** image&#8221;); for *files* it used to be &#8216;pin in memory' but is now ignored; for *directories* only root, file owner and directory owner can delete a file (even if non-owners have directory write permissions). Typically used for /tmp. **&#8212;t&#8212;&#8212;**
  * capital letters when doing **ls -al** usually means the permissions have been set incorrectly eg **-r-S&#8212;&#8212;** SUID is set, but owner execute is not set. However (?check?) **-rw&#8212;&#8212;T** means no update of &#8220;last modified time&#8221;; usually used for swap *files* (not very common nowadays -- swap is usually a partition).

**Directory Permissions**

  * **read** list files
  * **write** add or remove files
  * **execute** open or execute files, cd into directory

**Also, [Access, Change, Modify][1]**

Here are the definitions of the different UNIX time information on a file with how they are typically referred to in man pages and the option to list the particular time with the ls command.

Access Time | **atime** | -ul  
This is the time that the file was last *accessed *or* read*, unless **noatime** has been used for the mount point. (Mutt is the rare application that relies on access times, this [Archlinux article][2] discusses Mutt and **relatime**).

Change Time | **ctime** | -cl  
This is the time that the* inode information* (permissions, name, etc, the metadata, as it were) was last modified.

Modify Time | **mtime** | -l  
This is the last time the *actual contents* of the file were last modified.

*atime* doesn’t change when the file contents are written to, but both *ctime* and *mtime* do. Opening a file in an editor will of course read the file, thus changing the *atime*; but using* cat foo > bar* won't change the *atime* of bar.

**Addendum**

An old Unix hand told me this trick: directories for mount points should be created **d--x--x--x**. That way if the directory is unmounted, it's obvious that &#8220;this directory is a mount point&#8221;.

 [1]: http://articles.rootsmith.ca/linux/unix-access-modify-and-change-times
 [2]: https://wiki.archlinux.org/index.php/fstab#atime_options
