---
author: sonia
comments: true
date: 2007-10-25 04:26:58+00:00
slug: mysql-logging-and-logrotation
title: MySQL Logging and LogRotation
wordpress_id: 92
categories:
- Other-Tech
tags:
- MySQL
---

dev.msql.com [logging documentation](http://dev.mysql.com/doc/refman/5.0/en/log-files.html)

On Debian based systems, MySQL logging (and logrotation) is setup automatically so I've never had to worry about it. Unfortunately, I'm not using Debian at the moment...

The options used to start MySQL can be gleaned from **ps ax | grep mysql** ; in particular this will show the  **--datadir** setting, which is where logs are created by default.

**Troubleshooting Logs**



	
  * **--log** - the general query log - when clients connect and disconnect and all sql statements. By default, created with a name of **host_name.log**

	
  * ** --log-error** - diagnostic messages about startup and shutdown and abnormal conditions. By default, created with a name of **host_name.err**. If mysqld is invoked directly errors will be written to stderr; if mysqld is started by way of the **mysqld_safe** script (directly or via init.d) error logging may go to syslog (and therefore usually to /var/log)

	
  * **--log-slow-queries** - log queries that take longer than the _long_query_time_ server variable (10s by default) to run. By default, created with a name of **host_name-slow.log**


**Replication/Binary Logs**

todo

**LogRotation**

todo
