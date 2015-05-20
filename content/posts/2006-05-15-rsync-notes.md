---
author: sonia
comments: true
date: 2006-05-15 05:51:25+00:00
slug: rsync-notes
title: rsync notes
wordpress_id: 25
categories:
- Other-Tech
tags:
- Rsync
- Ssh
---




###  Summary



    
    
     $ rsync -av -e ssh --delete --force source_host:source_dir/ dest_dir
     $ rsync -av -e ssh --delete --force source dest_host:dest_dir/


**eg**

    
    
     $ rsync -av -e ssh                  sandia:stripes/music/spanish-french/ spanish-french/
     $ rsync -av -e ssh --delete --force sandia:stripes/music/spanish-french/ spanish-french/




###  Using SSH


Use rsync over ssh with the **-e** flag:

    
    
     $ rsync -av -e ssh source dest_host:dest_dir


To automate rsync over ssh backups, use **keychain**. For example, for a user called _backupuser_:

    
    
    
     $ cat ~sonia/bin/rsyncup.sh
     #!/bin/bash
     . /home/backupuser/.keychain/$HOSTNAME-sh
     rsync -av -e ssh  --delete --force /home /etc dest_host:home-etc-backup/



    
    
     $ crontab -l
     1 4 * * * ~sonia/bin/rsyncup.sh




###  Trailing Slash


_Summary_ - these are equivalent:

    
    
     rsync $myflags sandia:stripes/books/     books/
     rsync $myflags sandia:stripes/books      .


A **trailing slash** on the source directory syncs the directory contents, _but not the directory itself_; without a trailing slash the source directory itself will be synced. The trailing slash has no affect on the destination directory.

For example, with this source directory structure:

    
    
     ~/a
     ~/a/dir1
     ~/a/dir2



    
    
    
     $ rsync -av --stats ~/a/ destination_dir
     $ ls -F destination_dir
     dir1/ dir2/                 # ie synced as destination_dir/dir1



    
    
     $ rsync -av --stats ~/a destination_dir
     $ ls -F destination_dir
     a/
     $ ls -F destination_dir/a
     dir1/ dir2/                 # ie synced as destination_dir/a/dir1




###  Limiting Bandwidth


Limit bandwidth used by rsync with the **--bwlimit** option; the value is in kilobytes/s (many network speeds are measured in kilobits, which are 1/8th of kilobytes).

    
    
    
     $ rsync -av --bwlimit=256 src1 src2 dest




###  Deleting Files


If files are deleted from the source directory, they will only be deleted from the destination directory if the **--delete** option is used:

    
    
     $ rsync -av --delete ~/a/ destination_dir




### File Selection


Files can be included or excluded from syncing using **--include-from** or **--exclude-from**; it's better not to use both as things can get rather confusing...

    
    
     $ cat exclude.txt
     *tmp
     /etc/skel



    
    
     $ rsync -av src1 src2 --exclude-from=exclude.txt dest_host:dest_dir




###  Filepaths


You can specify that directories specified in the source path be created at the destination using the **-R** option (usually **not** desired):

    
    
     $ rsync -av -e ssh src_host:/var/www /dest
     $ ls -F /dest
     www/                     # notice /dest/var not created



    
    
     $ rsync -avR -e ssh src_host:/var/www /dest
     $ ls -F /dest
     var/
     $ ls -F /dest/var
     www/                    # ie synced as /dest/var/www, not /dest/www




###  Rsync on Windows





	
  * on Windows, install Cygwin, rsync, OpenSSH, vim

	
  * add **c:cygwinbin** to the PATH system environment variable

	
  * _either_ get into a bash shell and run rsync normally, by running cmd then **c:cygwincygwin.bat**, _or_

	
  * run rsync directly from the Windows command prompt:



    
    
     c:cygwinbinrsync -av -e ssh src dest_host:dest_dir
