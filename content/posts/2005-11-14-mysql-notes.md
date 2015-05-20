---
title: MySQL notes
author: Sonia Hamilton
date: 2005-11-15
url: /2005/11/14/mysql-notes/
categories:
  - Other-Tech
tags:
  - MySQL
---
### Cheat Sheets

  * [Neal Parikh][1]

### Notes

  * connect after initial install

<pre>$ mysql</pre>

  * change root password

<pre><!--more-->
 mysql&gt; SET PASSWORD=PASSWORD('secret')
 mysql&gt; flush privileges;</pre>

or

<pre>mysql&gt; UPDATE user SET password=PASSWORD('secret')
 mysql&gt; WHERE user='root' AND host='localhost';</pre>

  * connect after changing password

<pre>$ mysql -u root -p</pre>

  * secure a bit

<pre>msyql&gt; show databases;
 mysql&gt; drop database test;
 mysql&gt; use mysql;
 mysql&gt; select Host, User, Password from user where host = '%' or user = ''; -&gt; delete appropriate a/c's
 mysql&gt; flush privileges;</pre>

  * create a database

<pre>mysql&gt; CREATE DATABASE foodb;</pre>

  * import a schema or dumped database

<pre>mysql -u root -p foodb &lt; schema.sql</pre>

  * setup an application account with minimal privileges, and test

<pre>mysql&gt; DROP USER foouser; (if already exists)
 mysql&gt; GRANT SELECT,INSERT,UPDATE,DELETE ON foodb.*
     -&gt; TO 'foouser'@'localhost' IDENTIFIED BY 'secret';
 mysql&gt; FLUSH PRIVILEGES;
 mysql&gt; q
 $ mysql -u foouser -p
 mysql&gt; show databases; -&gt; should show only show foodb</pre>

  * higher privileges

<pre>mysql&gt; GRANT ALL PRIVILEGES ON foodb.*
 mysql&gt; TO foouser'@'localhost' IDENTIFIED BY 'secret';
 mysql&gt; FLUSH PRIVILEGES;</pre>

 [1]: http://www.nparikh.org/unix/mysql.php
