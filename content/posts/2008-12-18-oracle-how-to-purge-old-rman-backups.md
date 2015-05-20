---
author: sonia
comments: true
date: 2008-12-18 02:01:47+00:00
slug: oracle-how-to-purge-old-rman-backups
title: Oracle - how to purge old RMAN backups
wordpress_id: 194
categories:
- Other-Tech
tags:
- Oracle
---

Oracle runs on Linux, therefore I must be an Oracle expert (so goes management thinking). Here's how to correctly purge old RMAN backups when storage runs out of space (thanks Nakrob):

    
    Do not use rm to remove files. You must do it via RMAN.
    
    $ export NLS_DATE_FORMAT='DD-MM-YY HH24:MI'
    
    $ rman target / NOCATALOG
    
    RMAN > crosscheck backupset;
    This command will verify whether backup file is still on media.
    If it is unavailable, RMAN will mark it as UNAVAILABLE or EXPIRED.
    
    RAMN > delete expired backupset;
    or
    RMAN > delete expired backup;
    
    Note : If you manually rename or zip RMAN backup files, you must manually remove it from disk since RMAN
    does not recognize them.
    
    RMAN > report obsolete;
    The command lists all backups rendered obsolete based on rentention policy.
    Current Retention Policy is 'Recovery WINDOW OF 30 DAYS'.
    
    RMAN > delete obsolete;
    
    RMAN > list backup summary;
    It will show all backupset info kept in RMAN repository.
    If you want to see what RMAN keeps in each backupset, run 'list backupset N' where N is Backupset ID.
    
    RMAN > delete backupset N;
    or
    RMAN > delete backupset; (to delete all backups)
    
    Once fair amount of space is reclaimed, do full backup.
    Not sure how much full back space is needed but not less than 20G.
    
    RMAN > backup database;
    
    RMAN > list backup;
    Full backup may have more than one backupset.
    Look for last backupsets. It will list backup db files.
    
    RMAN > delete obsolete;
    Rerun this command to delete unwanted existing backupsets (if have) after completed full backup.
