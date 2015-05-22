---
title: MySQL Logging and LogRotation
author: Sonia Hamilton
date: 2007-10-25
url: /2007/10/24/mysql-logging-and-logrotation/
categories:
  - Other-Tech
tags:
  - MySQL
---
dev.msql.com [logging documentation][1]

On Debian based systems, MySQL logging (and logrotation) is setup automatically so I&#8217;ve never had to worry about it. Unfortunately, I&#8217;m not using Debian at the moment&#8230;

<!--more-->

The options used to start MySQL can be gleaned from **ps ax | grep mysql** ; in particular this will show the **&#8211;datadir** setting, which is where logs are created by default.

**Troubleshooting Logs**

  * **&#8211;log** &#8211; the general query log &#8211; when clients connect and disconnect and all sql statements. By default, created with a name of **host_name.log**
  * ** &#8211;log-error** &#8211; diagnostic messages about startup and shutdown and abnormal conditions. By default, created with a name of **host_name.err**. If mysqld is invoked directly errors will be written to stderr; if mysqld is started by way of the **mysqld_safe** script (directly or via init.d) error logging may go to syslog (and therefore usually to /var/log)
  * **&#8211;log-slow-queries** &#8211; log queries that take longer than the *long\_query\_time* server variable (10s by default) to run. By default, created with a name of **host_name-slow.log**

**Replication/Binary Logs**

todo

**LogRotation**

todo

 [1]: http://dev.mysql.com/doc/refman/5.0/en/log-files.html
