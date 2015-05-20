---
author: sonia
comments: true
date: 2009-06-29 00:59:03+00:00
slug: oracle-rman-backups
title: Oracle RMAN backups
wordpress_id: 513
categories:
- Other-Tech
tags:
- Oracle
---

More notes on Oracle RMAN backups, see also [Oracle – how to purge old RMAN backups](http://blog.snowfrog.net/2008/12/18/oracle-how-to-purge-old-rman-backups/). Thanks Raoul for your email...

    
    
    
    
    Are the backups being deleted using RMAN or simply 'rm'?
    
    Oracle's RMAN can be set up to manage this for you based on RETENTION POLICY.  Eg, set retention policy to recovery window of 14 days and
    it will regard any backups older than 14 days to be OBSOLETE. Obsolete backups can be removed regularly using this:
     DELETE NOPROMPT OBSOLETE;
    in a script that RMAN runs, for example, the daily backup script.
    
    Here's a quick rundown of the rman commands you might find useful:
    
    -- list all configuration parameters
    SHOW ALL;
    
    -- check for spurious files in FRA (backup location)
    -- typically, these can be safely deleted
    -- but check messages/output first.
    CATALOG RECOVERY AREA NOPROMPT;
    
    -- check to see what backups are available in the backup
    -- destination area (refresh with what's available)
    -- missing ones are marked as EXPIRED
    CROSSCHECK BACKUPSET;
    CROSSCHECK COPY;
    
    -- delete all obsolete backups
    -- this physically removes the backup pieces from the backup
    -- destination and removes knowledge of them from the control
    -- file this is performed based on the RETENTION policy
    DELETE NOPROMPT OBSOLETE;
    
    -- delete all expired backups, etc
    -- this is clearing the knowledge of such EXPIRED (missing)
    -- backups from the control file
    DELETE NOPROMPT EXPIRED BACKUP;
    DELETE NOPROMPT EXPIRED COPY;
    
    Once you've set the retention policy, then the following backup script (or one like it) will remove old backups automatically.
    
    -- full back, deleting archive logs after backing them up
    backup device type disk tag '%TAG' database;
    backup device type disk tag '%TAG' archivelog all not backed up delete all input;
    allocate channel for maintenance type disk;
    delete noprompt obsolete device type disk;
    release channel;
    
    Example of what to do if system runs out of disk space due to archive logs:
    
    crosscheck archivelog all;
    delete expired archivelog all;
    backup archivelog all delete input;
    backup database;



