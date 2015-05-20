---
author: sonia
comments: true
date: 2005-11-15 02:53:47+00:00
slug: mysql-notes
title: MySQL notes
wordpress_id: 9
categories:
- Other-Tech
tags:
- MySQL
---

### Cheat Sheets





	
  * [Neal Parikh](http://www.nparikh.org/unix/mysql.php)




###   Notes





	
  * connect after initial install



    
    
     $ mysql





	
  * change root password



    
    <!-- more -->
     mysql> SET PASSWORD=PASSWORD('secret')
     mysql> flush privileges;


or

    
    
     mysql> UPDATE user SET password=PASSWORD('secret')
     mysql> WHERE user='root' AND host='localhost';





	
  * connect after changing password



    
    
     $ mysql -u root -p





	
  * secure a bit



    
    
     msyql> show databases;
     mysql> drop database test;
     mysql> use mysql;
     mysql> select Host, User, Password from user where host = '%' or user = ''; -> delete appropriate a/c's
     mysql> flush privileges;





	
  * create a database



    
    
     mysql> CREATE DATABASE foodb;





	
  * import a schema or dumped database



    
    
     mysql -u root -p foodb < schema.sql





	
  * setup an application account with minimal privileges, and test



    
    
     mysql> DROP USER foouser; (if already exists)
     mysql> GRANT SELECT,INSERT,UPDATE,DELETE ON foodb.*
         -> TO 'foouser'@'localhost' IDENTIFIED BY 'secret';
     mysql> FLUSH PRIVILEGES;
     mysql> q
     $ mysql -u foouser -p
     mysql> show databases; -> should show only show foodb





	
  * higher privileges



    
    
     mysql> GRANT ALL PRIVILEGES ON foodb.*
     mysql> TO foouser'@'localhost' IDENTIFIED BY 'secret';
     mysql> FLUSH PRIVILEGES;
