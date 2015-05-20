---
author: sonia
comments: true
date: 2005-11-17 02:46:41+00:00
slug: reset-lost-root-password
title: Reset lost MySQL root password
wordpress_id: 11
categories:
- Other-Tech
tags:
- MySQL
---


	
  * stop mysql, and start in mode that ignores permissions



    
    
    /etc/init.d/mysqld stop
    /usr/sbin/mysqld --skip-grant-tables &





	
  * login as root



    
    
     mysql -u root mysql





	
  * change root password (note: SET PASSWORD won't work, due to --skip-grant-tables)



    
    
     mysql> use mysql; mysql> update user set password=password('secret') where user='root';mysql> q





	
  * stop mysql by killing processes, restart the database as normal



    
    
     killall mysqld /etc/init.d/mysqld start
