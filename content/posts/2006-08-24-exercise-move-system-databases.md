---
title: exercise – move system databases
author: Sonia Hamilton
date: 2006-08-25
url: /2006/08/24/exercise-move-system-databases/
categories:
  - Other-Tech
tags:
  - Exercises
  - MSSQL
  - retag_progress
---
In this exerise, you are required to move two of the system databases (**master** and **model**) to **c:data**. Here are some web pages that may help:
<!--more-->


  * [KB224071][1]
  * [sql-server-performance.com SQL Startup Parameters][2]

**Steps:**

  1. move **master** 
      * change the startup properties for the server, to point to a different location for master
      * stop the server using Administrative Tools, Services
      * manually move master&#8217;s database files using Windows Explorer to c:data
      * start the server using Administrative Tools, Services
      * in Enterprise Manager, check the properties of the master database, to ensure that master is running from the new location<!--more-->

  2. move **model** 
      * change the startup properties of the server, to use the correct trace flag
      * restart the server using Administrative Tools, Services
      * detach model using **sp\_detach\_db**
      * manually move model&#8217;s database files using Windows Explorer to c:data
      * attach model using **sp\_attach\_db**
      * in Enterprise Manager, check the properties of the model database, to ensure that model is running from the new location

If you make a mistake moving master and SQL Server won&#8217;t start, you can edit the registry directly at:

<pre>HKLMSOFTWAREMicrosoftMSSQLServerMSSQLServerParameters</pre>

 [1]: http://support.microsoft.com/kb/224071/
 [2]: http://www.sql-server-performance.com/rd_sql_server_startup_parameters.asp
