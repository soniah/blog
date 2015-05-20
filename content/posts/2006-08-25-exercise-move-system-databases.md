---
author: sonia
comments: true
date: 2006-08-25 00:28:06+00:00
slug: exercise-move-system-databases
title: exercise - move system databases
wordpress_id: 38
categories:
- Other-Tech
tags:
- Exercises
- MSSQL
- retag_progress
---

In this exerise, you are required to move two of the system databases (**master** and **model**) to **c:data**. Here are some web pages that may help:



	
  * [KB224071](http://support.microsoft.com/kb/224071/)

	
  * [sql-server-performance.com SQL Startup Parameters](http://www.sql-server-performance.com/rd_sql_server_startup_parameters.asp)


**Steps:**



	
  1. move **master**

	
    * change the startup properties for the server, to point to a different location for master

	
    * stop the server using Administrative Tools, Services

	
    * manually move master's database files using Windows Explorer to c:data

	
    * start the server using Administrative Tools, Services

	
    * in Enterprise Manager, check the properties of the master database, to ensure that master is running from the new location<!-- more -->




	
  2. move **model**

	
    * change the startup properties of the server, to use the correct trace flag

	
    * restart the server using Administrative Tools, Services

	
    * detach model using **sp_detach_db**

	
    * manually move model's database files using Windows Explorer to c:data

	
    * attach model using **sp_attach_db**

	
    * in Enterprise Manager, check the properties of the model database, to ensure that model is running from the new location





If you make a mistake moving master and SQL Server won't start, you can edit the registry directly at:

    
     HKLMSOFTWAREMicrosoftMSSQLServerMSSQLServerParameters
