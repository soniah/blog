---
title: MySQL Security
author: Sonia Hamilton
date: 2007-10-15
url: /2007/10/15/mysql-security/
categories:
  - Other-Tech
tags:
  - MySQL
---
Some guidelines for understanding MySQL security:

<!--more-->

  * security tables have a dual primary key of *username + host* -- ie if there are two entries, **fred@localhost** and **fred@%**, *they are different users to mysql  
    *
  * more specific entries are considered before less specific entries ie **localhost** before **%.fubar.com** before **%**, **fred** before **[blank]**. A % host entry is considered last, as is a blank username
  * host entries are considered before username entries. If there's a tie eg **[blank]@localhost** versus **fred@%**, the hostname entry wins ie **[blank]@localhost** wins over **fred@%**. This is a ***Big Gotcha!!*** (especially since MySQL creates a [blank]@localhost entry by default) Solution: delete all entries except root@localhost (or root@%), then only have one entry per user.

<!--more-->Tables:

  * **mysql.****user:** controls userids and global permisions -- consulted during initial user connection. A permission (such as select) granted here is global and applies to all databases
  * **mysql.db:** controls access to individual databases. This table has a triple primary key consisting of host, db, user. If MySQL doesn't find an exact match on host/db/user but *does* find a match on %/db/user, it looks in the **host** table for a match
  * **mysql.host:** essentially an extension of the db table -- when a host/db entry matches in both tables, the entries must both be positive. In effect this allows you to grant a privilege to most users but deny them from a specific host

Statements:

  * GRANT/REVOKE privilege ON table1, &#8230; TO user \[IDENTIFIED BY &#8216;password'\] \[WITH GRANT OPTION\]; FLUSH PRIVILEGES;
  * privilege can be ALL, or things like SELECT, DELETE, etc
  * table can be \* (all tables in the current database) or \*.* all tables all databases
  * user means all users with that name, or you can specify a specific host with user@host
  * SET PASSWORD FOR &#8216;fred'@'localhost' = PASSWORD(&#8216;secret');
