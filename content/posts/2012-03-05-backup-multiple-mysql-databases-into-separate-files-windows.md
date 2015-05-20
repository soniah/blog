---
author: sonia
comments: true
date: 2012-03-05 21:19:19+00:00
slug: backup-multiple-mysql-databases-into-separate-files-windows
title: Backup multiple MySQL databases into separate files - Windows
wordpress_id: 1450
categories:
- Other-Tech
tags:
- MySQL
- Windows
---

Years ago I wrote a post on how to [Backup multiple MySQL databases into separate files](http://blog.snowfrog.net/2005/11/16/backup-multiple-databases-into-separate-files/) (Linux). I get a lot of questions about how to do the same on Windows; here's a script submitted by one of my readers:

    
    :: MySQl DB user
    set dbuser=xxxx
    
    :: MySQl DB users password
    set dbpass=xxxx
    
    :: Switch to the MySQL data directory and collect the folder names
    pushd "C:\Documents and Settings\All Users\Application Data\MySQL\MySQL Server 5.5\data"
    
    :: Loop through the folders and use the fnames for the sql filenames, collects all databases automatically this way
    
    echo "hello"
    
    echo "Pass each name to mysqldump.exe and output an individual .sql file for each"
    
    FOR /D %%F IN (*) DO (
    "C:\Program Files\MySQL\MySQL Server 5.5\bin\mysqldump.exe" --user=%dbuser% --password=%dbpass% --databases %%F > "C:\SQLBackup\%%F.%backupdate%.sql"
    )
