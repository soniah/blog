---
title: Connect to MySQL across network using MS Access
author: Sonia Hamilton
date: 2005-11-17
url: /2005/11/16/connect-to-mysql-from-network-using-ms-access/
categories:
  - Other-Tech
tags:
  - MSAccess
  - MySQL
---
Connect to MySQL across network using MS Access
<!--more-->
  * comment out line in /etc/mysql/my.cnf that reads: 
    <pre>bind-address = 127.0.0.1</pre>
    
      * grant root access across network (see [MySQL Documentation][1])
    <pre>mysql&gt; use mysql;
 mysql&gt; select Host, User, Password from user;
 mysql&gt; update user set host='%' where user = 'root';
 mysql&gt; q</pre>
    
      * restart
    
    <!--more-->
    
    <pre>$ /etc/init.d/mysql restart</pre>
    
      * install/configure odbc on server
    <pre>$ aptitude install libmyodbc</pre>
    
      * configure Access on client 
          * download/install MyODBC
          * create a new database (not a project)
          * File, Get External Data, Link Tables, ODBC Databases
          * Create a MyODBC DSN

 [1]: http://dev.mysql.com/doc/refman/4.1/en/connection-access.html
