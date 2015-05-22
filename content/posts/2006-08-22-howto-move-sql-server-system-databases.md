---
title: howto move sql server system databases
author: Sonia Hamilton
date: 2006-08-23
url: /2006/08/22/howto-move-sql-server-system-databases/
categories:
  - Other-Tech
tags:
  - MSSQL
---
Here&#8217;s a couple of links on how to move the MS SQL Server system databases:
<!--more-->


  * [KB224071][1]
  * [sql-server-performance.com SQL Startup Parameters][2]

In a nutshell:

  * for master, change startup parameters in Server Properties, stop SQL Server, move files, start SQL Server
  * for other system databases, restart SQL Server using Trace Flag 3608 (-T3608 startup param), use **sp\_detach\_db** and **sp\_attach\_db**, restart without Trace Flag
  * if SQL Server won&#8217;t start because of an error in the startup settings, the settings can be edited here:

<pre>HKLM/SOFTWARE/Microsoft/MSSQLServer/MSSQLServerParameters</pre>

 [1]: http://support.microsoft.com/kb/224071/
 [2]: http://www.sql-server-performance.com/rd_sql_server_startup_parameters.asp
