---
title: Backup multiple MySQL databases into separate files – Windows
author: Sonia Hamilton
date: 2012-03-05
url: /2012/03/06/backup-multiple-mysql-databases-into-separate-files-windows/
categories:
  - Other-Tech
tags:
  - MySQL
  - Windows
---

Years ago I wrote a post on how to [Backup multiple MySQL databases into separate files][1] (Linux).

<!--more-->

I get a lot of questions about how to do the same on Windows; here's a script submitted by one of my readers:

<pre>:: MySQl DB user
set dbuser=xxxx

:: MySQl DB users password
set dbpass=xxxx

:: Switch to the MySQL data directory and collect the folder names
pushd "C:\Documents and Settings\All Users\Application Data\MySQL\MySQL Server 5.5\data"

:: Loop through the folders and use the fnames for the sql filenames, collects all databases automatically this way

echo "hello"

echo "Pass each name to mysqldump.exe and output an individual .sql file for each"

FOR /D %%F IN (*) DO (
"C:\Program Files\MySQL\MySQL Server 5.5\bin\mysqldump.exe" --user=%dbuser% --password=%dbpass% --databases %%F &gt; "C:\SQLBackup\%%F.%backupdate%.sql"
)</pre>

 [1]: http://blog.snowfrog.net/2005/11/16/backup-multiple-databases-into-separate-files/
