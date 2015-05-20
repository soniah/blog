---
author: sonia
comments: true
date: 2006-08-23 00:29:30+00:00
slug: howto-move-sql-server-system-databases
title: howto move sql server system databases
wordpress_id: 36
categories:
- Other-Tech
tags:
- MSSQL
---

Here's a couple of links on how to move the MS SQL Server system databases:



	
  * [KB224071](http://support.microsoft.com/kb/224071/)

	
  * [sql-server-performance.com SQL Startup Parameters](http://www.sql-server-performance.com/rd_sql_server_startup_parameters.asp)


In a nutshell:

	
  * for master, change startup parameters in Server Properties, stop SQL Server, move files, start SQL Server

	
  * for other system databases, restart SQL Server using Trace Flag 3608 (-T3608 startup param), use **sp_detach_db** and **sp_attach_db**, restart without Trace Flag

	
  * if SQL Server won't start because of an error in the startup settings, the settings can be edited here:



    
     HKLM/SOFTWARE/Microsoft/MSSQLServer/MSSQLServerParameters
