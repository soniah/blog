---
title: Backup multiple MySQL databases into separate files
author: Sonia Hamilton
date: 2005-11-17
url: /2005/11/16/backup-multiple-databases-into-separate-files/
categories:
  - Other-Tech
tags:
  - MySQL
---
Backup multiple MySQL databases into separate files
<!--more-->
**Update:** want to know how to do this on Windows? See my post [Backup multiple MySQL databases into separate files – Windows][1].

<pre>#!/bin/bash
# sonia 16-nov-05
# backup each mysql db into a different file, rather than one big file
# as with --all-databases - will make restores easier

USER="root"
PASSWORD="secret"
OUTPUTDIR="/var/lib/bacula"
MYSQLDUMP="/usr/bin/mysqldump"
MYSQL="/usr/bin/mysql"

# clean up any old backups - save space
rm "$OUTPUTDIR/*bak" &gt; /dev/null 2&gt;&1

# get a list of databases
databases=`$MYSQL --user=$USER --password=$PASSWORD \
 -e "SHOW DATABASES;" | tr -d "| " | grep -v Database`

# dump each database in turn
for db in $databases; do
    echo $db
    $MYSQLDUMP --force --opt --user=$USER --password=$PASSWORD \
    --databases $db &gt; "$OUTPUTDIR/$db.bak"
done</pre>

 [1]: http://blog2.snowfrog.net/2012/03/06/backup-multiple-mysql-databases-into-separate-files-windows/
