---
title: Connect to mysql from OpenOffice using ODBC
author: Sonia Hamilton
date: 2008-06-05
url: /2008/06/05/connect-to-mysql-from-openoffice-using-odbc/
categories:
  - Other-Tech
tags:
  - MySQL
---
There's an article [here][1] that explains how to connect to a mysql database from OpenOffice.org Base using odbc, 

<!--more-->

but the author makes it sound like rocket science. It's easy -- summary:

  * <pre>sudo aptitude install unixodbc libmyodbc unixodbc-bin</pre>

  * <pre>sudo ODBCConfig</pre>
    
      * driver is **/usr/lib/odbc/libmyodbc.so**
      * setup is **/usr/lib/odbc/libodbcmyS.so**
  * run the wizard, connect using the saved odbc configuration

 [1]: http://www.linux.com/feature/60185
