---
author: sonia
comments: true
date: 2008-06-05 07:48:57+00:00
slug: connect-to-mysql-from-openoffice-using-odbc
title: Connect to mysql from OpenOffice using ODBC
wordpress_id: 125
categories:
- Other-Tech
tags:
- MySQL
---

There's an article [here](http://www.linux.com/feature/60185) that explains how to connect to a mysql database from OpenOffice.org Base using odbc, but the author makes it sound like rocket science. It's easy - summary:



	
  * 

    
    sudo aptitude install unixodbc libmyodbc unixodbc-bin




	
  * 

    
    sudo ODBCConfig



	
    * driver is **/usr/lib/odbc/libmyodbc.so**

	
    * setup is **/usr/lib/odbc/libodbcmyS.so**




	
  * run the wizard, connect using the saved odbc configuration


