---
title: Reset lost MySQL root password
author: Sonia Hamilton
date: 2005-11-17
url: /2005/11/16/reset-lost-root-password/
categories:
  - Other-Tech
tags:
  - MySQL
---
Reset lost MySQL root password
<!--more-->
  * stop mysql, and start in mode that ignores permissions

<pre>/etc/init.d/mysqld stop
/usr/sbin/mysqld --skip-grant-tables &</pre>

  * login as root

<pre>mysql -u root mysql</pre>

  * change root password (note: SET PASSWORD won&#8217;t work, due to --skip-grant-tables)

<pre>mysql&gt; use mysql; mysql&gt; update user set password=password('secret') where user='root';mysql&gt; q</pre>

  * stop mysql by killing processes, restart the database as normal

<pre>killall mysqld /etc/init.d/mysqld start</pre>
