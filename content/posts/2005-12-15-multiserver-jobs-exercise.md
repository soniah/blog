---
author: sonia
comments: true
date: 2005-12-15 00:29:31+00:00
slug: multiserver-jobs-exercise
title: multiserver jobs exercise
wordpress_id: 17
categories:
- Other-Tech
tags:
- Exercises
- MSSQL
---

### Exercise





	
  1. Have a second instance of SQL Server running, either by:

	
    * installing a second instance of SQL Server

	
    * starting up a second Virtual PC




	
  2. If using Virtual PC's, check that you have network connectivity between both VPC's:

	
    * ipconfig

	
    * ping<!-- more -->




	
  3. Ensure that both instances of SQL are using **Mixed Mode Authentication**

	
  4. Using **Tools, Wizards, Management, Make Master Server Wizard**, setup Multiserver Jobs. Notice how an account called **MSXOperator** is created on both instances

	
  5. Create a simple job on the Master, and get it to run on the Secondary




### Hints





	
  * remember to regularly refresh your display in Enterprise Manager, especially the **Jobs** node

	
  * the job may take some minutes to copy. Be patient; if taking too long restart both agents

	
  * check your setup by running this select statement on both instances:



    
     SELECT * FROM msdb..systargetservers
