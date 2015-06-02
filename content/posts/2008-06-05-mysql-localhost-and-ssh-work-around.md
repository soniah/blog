---
title: mysql, localhost, and ssh work-around
author: Sonia Hamilton
date: 2008-06-05
url: /2008/06/05/mysql-localhost-and-ssh-work-around/
categories:
  - Other-Tech
tags:
  - MySQL
  - Ssh
---
I use ssh to tunnel all the time, especially to get around brain-dead firewalls.

<!--more-->

But this doesn't work easily for mysql -- if you tunnel a port from localhost (eg localhost:3306) to the target db, mysql client tools will see &#8216;localhost' and try to connect via the local socket. Very broken -- there's bugs lodged [here][1] and [here][2] about this (and lots of chest beating and wailing, too).

**Solution:** tunnel ssh via an intermediate machine. For example:

<pre>intermediate$ ssh -o GatewayPorts=yes -L 3306:targetdb:3306 targetdb
localhost$ mysql -h intermediate -P 3306</pre>

GatewayPorts -- dangerous yes -- but so is life.

**Update**

The problem seems to have been fixed; either that or I was having a very blond moment last time I tried using **-- -- protocol**.

<pre>localhost$ mysql --version
localhost$ mysql  Ver 14.12 Distrib 5.0.51a, for debian-linux-gnu (i486) using readline 5.2
localhost$ ssh -fN -L3306:targetdb:3306 targetdb
localhost$ mysql --protocol=tcp -hlocalhost -uroot
Welcome to the MySQL monitor.  Commands end with ; or g.
Your MySQL connection id is 14788104
Server version: 4.0.21-Max-log
Type 'help;' or 'h' for help. Type 'c' to clear the buffer.
mysql&gt;</pre>

**Update 2**

However graphical tools like OpenOffice Base, GMySqlCC and MySQL Query Browser either don't obey the -- -- protocol=tcp flag or don't have a place to set it, and therefore try to connect via the local socket file when connecting to localhost. Aarghhhhh..

**Update 3**

Using 127.0.0.1 instead of localhost works for OpenOffice -- yay.

 [1]: http://bugs.mysql.com/bug.php?id=27361
 [2]: http://bugs.mysql.com/bug.php?id=31577
