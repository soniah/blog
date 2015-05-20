---
author: sonia
comments: true
date: 2005-11-17 02:51:30+00:00
slug: connect-to-mysql-from-network-using-ms-access
title: Connect to MySQL across network using MS Access
wordpress_id: 12
categories:
- Other-Tech
tags:
- MSAccess
- MySQL
---


	
  * comment out line in /etc/mysql/my.cnf that reads:

    
     bind-address = 127.0.0.1



	
    * grant root access across network (see [MySQL Documentation](http://dev.mysql.com/doc/refman/4.1/en/connection-access.html))



    
     mysql> use mysql;
     mysql> select Host, User, Password from user;
     mysql> update user set host='%' where user = 'root';
     mysql> q



	
    * restart


<!-- more -->

    
     $ /etc/init.d/mysql restart



	
    * install/configure odbc on server



    
     $ aptitude install libmyodbc



	
    * configure Access on client

	
      * download/install MyODBC

	
      * create a new database (not a project)

	
      * File, Get External Data, Link Tables, ODBC Databases

	
      * Create a MyODBC DSN








