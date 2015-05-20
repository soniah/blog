---
title: rsync notes
author: Sonia Hamilton
date: 2006-05-15
url: /2006/05/14/rsync-notes/
categories:
  - Other-Tech
tags:
  - Rsync
  - Ssh
---
### Summary

<pre>$ rsync -av -e ssh --delete --force source_host:source_dir/ dest_dir
 $ rsync -av -e ssh --delete --force source dest_host:dest_dir/</pre>

**eg**

<pre>$ rsync -av -e ssh                  sandia:stripes/music/spanish-french/ spanish-french/
 $ rsync -av -e ssh --delete --force sandia:stripes/music/spanish-french/ spanish-french/</pre>

### Using SSH

Use rsync over ssh with the **-e** flag:

<pre>$ rsync -av -e ssh source dest_host:dest_dir</pre>

To automate rsync over ssh backups, use **keychain**. For example, for a user called *backupuser*:

<pre>$ cat ~sonia/bin/rsyncup.sh
 #!/bin/bash
 . /home/backupuser/.keychain/$HOSTNAME-sh
 rsync -av -e ssh  --delete --force /home /etc dest_host:home-etc-backup/</pre>

<pre>$ crontab -l
 1 4 * * * ~sonia/bin/rsyncup.sh</pre>

### Trailing Slash

*Summary* &#8211; these are equivalent:

<pre>rsync $myflags sandia:stripes/books/     books/
 rsync $myflags sandia:stripes/books      .</pre>

A **trailing slash** on the source directory syncs the directory contents, *but not the directory itself*; without a trailing slash the source directory itself will be synced. The trailing slash has no affect on the destination directory.

For example, with this source directory structure:

<pre>~/a
 ~/a/dir1
 ~/a/dir2</pre>

<pre>$ rsync -av --stats ~/a/ destination_dir
 $ ls -F destination_dir
 dir1/ dir2/                 # ie synced as destination_dir/dir1</pre>

<pre>$ rsync -av --stats ~/a destination_dir
 $ ls -F destination_dir
 a/
 $ ls -F destination_dir/a
 dir1/ dir2/                 # ie synced as destination_dir/a/dir1</pre>

### Limiting Bandwidth

Limit bandwidth used by rsync with the **&#8211;bwlimit** option; the value is in kilobytes/s (many network speeds are measured in kilobits, which are 1/8th of kilobytes).

<pre>$ rsync -av --bwlimit=256 src1 src2 dest</pre>

### Deleting Files

If files are deleted from the source directory, they will only be deleted from the destination directory if the **&#8211;delete** option is used:

<pre>$ rsync -av --delete ~/a/ destination_dir</pre>

### File Selection

Files can be included or excluded from syncing using **&#8211;include-from** or **&#8211;exclude-from**; it&#8217;s better not to use both as things can get rather confusing&#8230;

<pre>$ cat exclude.txt
 *tmp
 /etc/skel</pre>

<pre>$ rsync -av src1 src2 --exclude-from=exclude.txt dest_host:dest_dir</pre>

### Filepaths

You can specify that directories specified in the source path be created at the destination using the **-R** option (usually **not** desired):

<pre>$ rsync -av -e ssh src_host:/var/www /dest
 $ ls -F /dest
 www/                     # notice /dest/var not created</pre>

<pre>$ rsync -avR -e ssh src_host:/var/www /dest
 $ ls -F /dest
 var/
 $ ls -F /dest/var
 www/                    # ie synced as /dest/var/www, not /dest/www</pre>

### Rsync on Windows

  * on Windows, install Cygwin, rsync, OpenSSH, vim
  * add **c:cygwinbin** to the PATH system environment variable
  * *either* get into a bash shell and run rsync normally, by running cmd then **c:cygwincygwin.bat**, *or*
  * run rsync directly from the Windows command prompt:

<pre>c:cygwinbinrsync -av -e ssh src dest_host:dest_dir</pre>
