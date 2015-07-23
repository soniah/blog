---
title: multiple mysql versions on same machine
author: Sonia Hamilton
date: 2007-09-13
url: /2007/09/12/multiple-mysql-versions-on-same-machine/
categories:
  - Other-Tech
tags:
  - MySQL
---
Examples of working with multiple mysql versions on the same machine:

<!--more-->

`/usr/local/mysql/bin/mysqldump -uroot --sock=/tmp/mysql5.sock directaccesscms > directaccesscms_tpldb1.sql`  
`mysqldump -uroot --sock=/tmp/mysql5.sock directaccesscms > directaccesscms_tpldb1.sql`  
`/root/mysql-5.0.37-solaris8-sparc/bin/mysql --sock=/tmp/mysql5.sock`  
`/root/mysql-5.0.37-solaris8-sparc/bin/mysql --sock=/tmp/mysql5.sock seonodes < seonodes.sql`
