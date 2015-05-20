---
author: sonia
comments: true
date: 2007-10-23 01:35:35+00:00
slug: mysql-replication-notes
title: MySQL Replication Notes
wordpress_id: 90
categories:
- Other-Tech
tags:
- MySQL
---

dev.mysql.com [replication documentation](http://dev.mysql.com/doc/refman/5.0/en/replication.html). Replication on MySQL is similar to _Log Shipping_ on MS SQL; the default is _statement level_ replication, but newer versions also offer _row-based_ replication.

See also:

https://www.digitalocean.com/community/tutorials/how-to-set-up-master-slave-replication-in-mysql

**Setting Up**

On the Master:



	
  * create the account that will be used by each slave for replication:


[sourcecode lang="shell"]
> create user 'repl'@'%' identified by 'secret';
> grant replication slave on *.* to 'repl'@'%';
> flush privileges;
[/sourcecode]

	
  * enable for replication by editing modify **/etc/my.cnf** (fuller example below):

<!-- more -->

[sourcecode lang="shell"]
[mysqld]
server-id=1               # number needs to be unique amongst all servers - can be any number
log-bin=mysql-bin         # can be left empty, but convention is to call mysql-bin
binlog-ignore-db=mysql    # any databases not to replicate
# if using any InnoDB tables, for the greatest possible durability and consistency set:
innodb_flush_log_at_trx_commit=1
sync_binlog=1
.
$ /etc/init.d/mysql restart
[/sourcecode]

	
  * stop updates, record the log file name and position, copy data:


[sourcecode lang="shell"]
mysql> flush tables with read lock;
mysql> show master statusG
# the following step *must* be done in another terminal:
$ mysqlhotcopy --method=scp --user=root --password=secret database root@dest_host:/var/lib/mysql
mysql> unlock tables; # release locks in the original terminal
[/sourcecode]
	
  * other methods of copying data:

	
    * if only using MyISAM the **LOAD DATA FROM MASTER** command can be used _without having to stop the master_; even though it's usage is [deprecated](http://dev.mysql.com/doc/refman/5.0/en/load-data-from-master.html) there's no equivalent replacement. Additional permissions have to be assigned to the slave repl account (xx) and some network settings need to be temporarily changed (??), and a global read lock needs to be held on the master (thus preventing updates while transferring data)

	
    * data can also be copied using [mysqldump](http://dev.mysql.com/doc/refman/5.0/en/replication-howto-mysqldump.html) or by [dumping the raw files](http://dev.mysql.com/doc/refman/5.0/en/replication-howto-rawdata.html). If using InnoDB there's [also](http://dev.mysql.com/doc/refman/5.0/en/replication-howto-rawdata.html) a commercial product called [Hot Backup](http://www.innodb.com/hot-backup).




	
  * if using different storage engines between the master and slave, don't put the engine statements in the CREATE or ALTER TABLE statements (as they'll be replicated). Either use SET storage_engine followed by CREATE TABLE, or stop the slave and issue ALTER TABLE statements on the slave; see [documentation](http://dev.mysql.com/doc/refman/5.0/en/replication-solutions-diffengines.html).

	
  * Binary log files must be removed when they're no longer needed because MySQL doesn't do so automatically. Use **purge master logs to 'mysql-bin.1234';** O'Reilly's _High Performance MySQL_ has a log purge script (section 7.5), as well as other useful scripts for managing replication


On the Slave:

	
  * enable for replication by editing modify **/etc/my.cnf** - only need to set a unique _server-id_, unless this slave will also act as a master for other slaves

	
  * restart mysql, check that data copied ok with _mysqlhotcopy_ by doing a _show tables;_ (etc...) in the new database

	
  * start replication:


[sourcecode lang="shell"]
mysql> change master to master host = 'master host', master user = 'repl', master_password = 'secret', master_log_file = 'master_log_file', master_log_pos = 'master_log_pos';
mysql> start slave;
[/sourcecode]

Note: this information is stored in the file data_dir/master.info, so the password isn't very secure
	
  * to _quickly_ add _another slave_, see [this topic](http://dev.mysql.com/doc/refman/5.0/en/replication-howto-additionalslaves.html) (shutdown an existing slave, copy the data directory with logs and info files, set a unique server-id, start existing and new slave)


**Master .my.cnf** should look like:

[sourcecode lang="shell"]
[mysqld]
server-id = 71
log-bin=mysql-bin # use a standard name
relay-log=relay-bin # use a standard name
log=/var/log/mysql/mysql.log # general logging
log-slow-queries=/var/log/mysql/mysql-slow.log # log slow queries
log-error=/var/log/mysql/mysql-error.log # log errors
binlog-ignore-db=mysql # as master, don't send this to my slaves
log-slave-updates # this master is also a slave
replicate-do-db=foodb # as slave, only pull this db from *my* master
[/sourcecode]

**Slave .my.cnf** should look like:
[sourcecode lang="shell"]
[mysqld]
server-id=72
log-bin=mysql-bin # use a standard name
relay-log=relay-bin # use a standard name
log=/var/log/mysql/mysql.log # general logging
log-slow-queries=/var/log/mysql/mysql-slow.log # log slow queries
log-error=/var/log/mysql/mysql-error.log # log errors
[/sourcecode]

**Monitoring/Troubleshooting **

See [Troubleshooting Replication](http://dev.mysql.com/doc/refman/5.0/en/replication-problems.html).

On the Master:



	
  * **show master statusG** - shows the binary log file name and position. O'Reilly's _High Performance MySQL_ has a heartbeat script (section 7.5)

	
  * **show processlistG** - the master uses one thread to provide replication to slaves (**Command: Binlog Dump**). No **state** means replication hasn't been setup correctly. Good **states** are _Sending binlog event to slave, Finished reading one binlog; switching to next binlog, Has sent all binlog to slave; waiting for binlog to be updated_.

	
  * **show master logsG** - shows names of existing binary log files

	
  * **$ mysqlbinlog mysql-bin.1234** - allows you to read through binary and relay logs on both Master and Slave. Has the standard -u -h -p options, as well as -o to specify offset to start at


On the Slave:

	
  * **show slave statusG** ([documentation](http://dev.mysql.com/doc/refman/5.0/en/show-slave-status.html)) - key things to watch for are:

	
    * _Seconds_Behind_Master_ should be close to zero

	
    * _Slave_IO_Running_ and _Slave_SQL_Running_ should both be 'Yes'

	
    * _Read_Master_Log_Pos_ should only be slightly behind the position given by _show master status_ on the master.

	
    * _Exec_Master_Log_Pos_ should only be slightly behind _Read_Master_Log_Pos_

	
    * watch _Last_Errno_ and _Last_Error_ for errors and all the _Replicate/Ignore DB/Table_ fields for data not being replicated. In an emergency, troublesome statements can be skipped over using TODO.




	
  * **show process listG** - the slave uses two threads to implement replication - the _I/O thread_ reads events from the master and stores them in the relay log; and the _SQL_ thread reads statements from the relay log and applies them. A good state for the I/O thread is _Waiting for master to send event_; see doco for many other states. Good states for  the SQL thread are _Reading event from the relay log; and Has read all relay log; waiting for the slave I/O thread to update it_

	
  * **start slave;** see [documentation](http://dev.mysql.com/doc/refman/5.0/en/start-slave.html).

	
  * **stop slave;** or even better **stop slave sql_thread;** Statements continue to be read and written to relay log, but they aren't applied, allowing a backup of the slave to be done then allowing the slave to catch more rapidly when restarted - see [documentation](http://dev.mysql.com/doc/refman/5.0/en/replication-administration-pausing.html).

	
  * to prevent replication automatically occurring on a restart, start up server with _--skip-slave-start_ to skip the saved .info files (or delete those files beforehand to wipe replication completely).


See Also:

	
  * [How-To Forge Master-Master Replication](http://www.howtoforge.com/mysql5_master_master_replication_debian_etch)

	
  * [How-To Forge Backups w/o Service Interuption (Replication)](http://www.howtoforge.com/back_up_mysql_dbs_without_interruptions)


