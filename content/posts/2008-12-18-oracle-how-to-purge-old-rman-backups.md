---
title: Oracle – how to purge old RMAN backups
author: Sonia Hamilton
date: 2008-12-18
url: /2008/12/18/oracle-how-to-purge-old-rman-backups/
categories:
  - Other-Tech
tags:
  - Oracle
---
Oracle runs on Linux, therefore I must be an Oracle expert (so goes management thinking). Here&#8217;s how to correctly purge old RMAN backups when storage runs out of space (thanks Nakrob):

<pre>Do not use rm to remove files. You must do it via RMAN.

$ export NLS_DATE_FORMAT='DD-MM-YY HH24:MI'

$ rman target / NOCATALOG

RMAN &gt; crosscheck backupset;
This command will verify whether backup file is still on media.
If it is unavailable, RMAN will mark it as UNAVAILABLE or EXPIRED.

RAMN &gt; delete expired backupset;
or
RMAN &gt; delete expired backup;

Note : If you manually rename or zip RMAN backup files, you must manually remove it from disk since RMAN
does not recognize them.

RMAN &gt; report obsolete;
The command lists all backups rendered obsolete based on rentention policy.
Current Retention Policy is 'Recovery WINDOW OF 30 DAYS'.

RMAN &gt; delete obsolete;

RMAN &gt; list backup summary;
It will show all backupset info kept in RMAN repository.
If you want to see what RMAN keeps in each backupset, run 'list backupset N' where N is Backupset ID.

RMAN &gt; delete backupset N;
or
RMAN &gt; delete backupset; (to delete all backups)

Once fair amount of space is reclaimed, do full backup.
Not sure how much full back space is needed but not less than 20G.

RMAN &gt; backup database;

RMAN &gt; list backup;
Full backup may have more than one backupset.
Look for last backupsets. It will list backup db files.

RMAN &gt; delete obsolete;
Rerun this command to delete unwanted existing backupsets (if have) after completed full backup.</pre>
