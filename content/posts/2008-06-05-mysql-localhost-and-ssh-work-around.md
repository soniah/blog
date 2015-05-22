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

But this doesn&#8217;t work easily for mysql &#8211; if you tunnel a port from localhost (eg localhost:3306) to the target db, mysql client tools will see &#8216;localhost&#8217; and try to connect via the local socket. Very broken &#8211; there&#8217;s bugs lodged [here][1] and [here][2] about this (and lots of chest beating and wailing, too).

**Solution:** tunnel ssh via an intermediate machine. For example:

<pre>intermediate$ ssh -o GatewayPorts=yes -L 3306:targetdb:3306 targetdb
localhost$ mysql -h intermediate -P 3306</pre>

GatewayPorts &#8211; dangerous yes &#8211; but so is life&#8230;

**Update**

The problem seems to have been fixed; either that or I was having a very blond moment last time I tried using **&#8211; &#8211; protocol**.

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

However graphical tools like OpenOffice Base, GMySqlCC and MySQL Query Browser either don&#8217;t obey the &#8211; &#8211; protocol=tcp flag or don&#8217;t have a place to set it, and therefore try to connect via the local socket file when connecting to localhost. Aarghhhhh&#8230;.

**Update 3**

Using 127.0.0.1 instead of localhost works for OpenOffice &#8211; yay.

 [1]: http://bugs.mysql.com/bug.php?id=27361
 [2]: http://bugs.mysql.com/bug.php?id=31577
