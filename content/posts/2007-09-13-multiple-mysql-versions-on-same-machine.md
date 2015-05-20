---
author: sonia
comments: true
date: 2007-09-13 01:51:42+00:00
slug: multiple-mysql-versions-on-same-machine
title: multiple mysql versions on same machine
wordpress_id: 75
categories:
- Other-Tech
tags:
- MySQL
---

Examples of working with multiple mysql versions on the same machine:

`/usr/local/mysql/bin/mysqldump -uroot --sock=/tmp/mysql5.sock directaccesscms > directaccesscms_tpldb1.sql`
`mysqldump -uroot --sock=/tmp/mysql5.sock directaccesscms > directaccesscms_tpldb1.sql`
`/root/mysql-5.0.37-solaris8-sparc/bin/mysql --sock=/tmp/mysql5.sock`
`/root/mysql-5.0.37-solaris8-sparc/bin/mysql --sock=/tmp/mysql5.sock seonodes < seonodes.sql`
