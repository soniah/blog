---
title: MySQL Replication Notes
author: Sonia Hamilton
date: 2007-10-23
url: /2007/10/23/mysql-replication-notes/
categories:
  - Other-Tech
tags:
  - MySQL
---
dev.mysql.com [replication documentation][1]. Replication on MySQL is similar to *Log Shipping* on MS SQL; the default is *statement level* replication, but newer versions also offer *row-based* replication.

<!--more-->

See also:

https://www.digitalocean.com/community/tutorials/how-to-set-up-master-slave-replication-in-mysql

**Setting Up**

On the Master:

  * create the account that will be used by each slave for replication:
<pre class="brush: bash; title: ; notranslate" title="">&gt; create user 'repl'@'%' identified by 'secret';
&gt; grant replication slave on *.* to 'repl'@'%';
&gt; flush privileges;
</pre>

  * enable for replication by editing modify **/etc/my.cnf** (fuller example below):
<!--more-->

<pre class="brush: bash; title: ; notranslate" title="">[mysqld]
server-id=1               # number needs to be unique amongst all servers - can be any number
log-bin=mysql-bin         # can be left empty, but convention is to call mysql-bin
binlog-ignore-db=mysql    # any databases not to replicate
# if using any InnoDB tables, for the greatest possible durability and consistency set:
innodb_flush_log_at_trx_commit=1
sync_binlog=1
.
$ /etc/init.d/mysql restart
</pre>

  * stop updates, record the log file name and position, copy data:
<pre class="brush: bash; title: ; notranslate" title="">mysql&gt; flush tables with read lock;
mysql&gt; show master statusG
# the following step *must* be done in another terminal:
$ mysqlhotcopy --method=scp --user=root --password=secret database root@dest_host:/var/lib/mysql
mysql&gt; unlock tables; # release locks in the original terminal
</pre>

  * other methods of copying data: 
      * if only using MyISAM the **LOAD DATA FROM MASTER** command can be used *without having to stop the master*; even though it&#8217;s usage is [deprecated][2] there&#8217;s no equivalent replacement. Additional permissions have to be assigned to the slave repl account (xx) and some network settings need to be temporarily changed (??), and a global read lock needs to be held on the master (thus preventing updates while transferring data)
      * data can also be copied using [mysqldump][3] or by [dumping the raw files][4]. If using InnoDB there&#8217;s [also][4] a commercial product called [Hot Backup][5].
  * if using different storage engines between the master and slave, don&#8217;t put the engine statements in the CREATE or ALTER TABLE statements (as they&#8217;ll be replicated). Either use SET storage_engine followed by CREATE TABLE, or stop the slave and issue ALTER TABLE statements on the slave; see [documentation][6].
  * Binary log files must be removed when they&#8217;re no longer needed because MySQL doesn&#8217;t do so automatically. Use **purge master logs to &#8216;mysql-bin.1234&#8242;;** O&#8217;Reilly&#8217;s *High Performance MySQL* has a log purge script (section 7.5), as well as other useful scripts for managing replication

On the Slave:

  * enable for replication by editing modify **/etc/my.cnf** &#8211; only need to set a unique *server-id*, unless this slave will also act as a master for other slaves
  * restart mysql, check that data copied ok with *mysqlhotcopy* by doing a *show tables;* (etc&#8230;) in the new database
  * start replication:
<pre class="brush: bash; title: ; notranslate" title="">mysql&gt; change master to master host = 'master host', master user = 'repl', master_password = 'secret', master_log_file = 'master_log_file', master_log_pos = 'master_log_pos';
mysql&gt; start slave;
</pre>

Note: this information is stored in the file data_dir/master.info, so the password isn&#8217;t very secure

  * to *quickly* add *another slave*, see [this topic][7] (shutdown an existing slave, copy the data directory with logs and info files, set a unique server-id, start existing and new slave)

**Master .my.cnf** should look like:

<pre class="brush: bash; title: ; notranslate" title="">[mysqld]
server-id = 71
log-bin=mysql-bin # use a standard name
relay-log=relay-bin # use a standard name
log=/var/log/mysql/mysql.log # general logging
log-slow-queries=/var/log/mysql/mysql-slow.log # log slow queries
log-error=/var/log/mysql/mysql-error.log # log errors
binlog-ignore-db=mysql # as master, don't send this to my slaves
log-slave-updates # this master is also a slave
replicate-do-db=foodb # as slave, only pull this db from *my* master
</pre>

**Slave .my.cnf** should look like:

<pre class="brush: bash; title: ; notranslate" title="">[mysqld]
server-id=72
log-bin=mysql-bin # use a standard name
relay-log=relay-bin # use a standard name
log=/var/log/mysql/mysql.log # general logging
log-slow-queries=/var/log/mysql/mysql-slow.log # log slow queries
log-error=/var/log/mysql/mysql-error.log # log errors
</pre>

**Monitoring/Troubleshooting **

See [Troubleshooting Replication][8].

On the Master:

  * **show master statusG** &#8211; shows the binary log file name and position. O&#8217;Reilly&#8217;s *High Performance MySQL* has a heartbeat script (section 7.5)
  * **show processlistG** &#8211; the master uses one thread to provide replication to slaves (**Command: Binlog Dump**). No **state** means replication hasn&#8217;t been setup correctly. Good **states** are *Sending binlog event to slave, Finished reading one binlog; switching to next binlog, Has sent all binlog to slave; waiting for binlog to be updated*.
  * **show master logsG** &#8211; shows names of existing binary log files
  * **$ mysqlbinlog mysql-bin.1234** &#8211; allows you to read through binary and relay logs on both Master and Slave. Has the standard -u -h -p options, as well as -o to specify offset to start at

On the Slave:

  * **show slave statusG** ([documentation][9]) &#8211; key things to watch for are: 
      * *Seconds\_Behind\_Master* should be close to zero
      * *Slave\_IO\_Running* and *Slave\_SQL\_Running* should both be &#8216;Yes&#8217;
      * *Read\_Master\_Log_Pos* should only be slightly behind the position given by *show master status* on the master.
      * *Exec\_Master\_Log_Pos* should only be slightly behind *Read\_Master\_Log_Pos*
      * watch *Last_Errno* and *Last_Error* for errors and all the *Replicate/Ignore DB/Table* fields for data not being replicated. In an emergency, troublesome statements can be skipped over using TODO.
  * **show process listG** &#8211; the slave uses two threads to implement replication &#8211; the *I/O thread* reads events from the master and stores them in the relay log; and the *SQL* thread reads statements from the relay log and applies them. A good state for the I/O thread is *Waiting for master to send event*; see doco for many other states. Good states for the SQL thread are *Reading event from the relay log; and Has read all relay log; waiting for the slave I/O thread to update it*
  * **start slave;** see [documentation][10].
  * **stop slave;** or even better **stop slave sql_thread;** Statements continue to be read and written to relay log, but they aren&#8217;t applied, allowing a backup of the slave to be done then allowing the slave to catch more rapidly when restarted &#8211; see [documentation][11].
  * to prevent replication automatically occurring on a restart, start up server with *&#8211;skip-slave-start* to skip the saved .info files (or delete those files beforehand to wipe replication completely).

See Also:

  * [How-To Forge Master-Master Replication][12]
  * [How-To Forge Backups w/o Service Interuption (Replication)][13]

 [1]: http://dev.mysql.com/doc/refman/5.0/en/replication.html
 [2]: http://dev.mysql.com/doc/refman/5.0/en/load-data-from-master.html
 [3]: http://dev.mysql.com/doc/refman/5.0/en/replication-howto-mysqldump.html
 [4]: http://dev.mysql.com/doc/refman/5.0/en/replication-howto-rawdata.html
 [5]: http://www.innodb.com/hot-backup
 [6]: http://dev.mysql.com/doc/refman/5.0/en/replication-solutions-diffengines.html
 [7]: http://dev.mysql.com/doc/refman/5.0/en/replication-howto-additionalslaves.html
 [8]: http://dev.mysql.com/doc/refman/5.0/en/replication-problems.html
 [9]: http://dev.mysql.com/doc/refman/5.0/en/show-slave-status.html
 [10]: http://dev.mysql.com/doc/refman/5.0/en/start-slave.html
 [11]: http://dev.mysql.com/doc/refman/5.0/en/replication-administration-pausing.html
 [12]: http://www.howtoforge.com/mysql5_master_master_replication_debian_etch
 [13]: http://www.howtoforge.com/back_up_mysql_dbs_without_interruptions
