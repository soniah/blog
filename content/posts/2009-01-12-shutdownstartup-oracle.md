---
title: Shutdown/Startup Oracle
author: Sonia Hamilton
date: 2009-01-11
url: /2009/01/12/shutdownstartup-oracle/
categories:
  - Other-Tech
tags:
  - Oracle
---
Some notes on shutting down and starting up Oracle, taken from an email.
<!--more-->


<div dir="ltr">
  <span style="font-family:tahoma;font-size:x-small;">Please be corrected in Note Section if you do need to do abort shutdown.</span>
</div>

<div dir="ltr">
  <span style="font-family:tahoma;font-size:x-small;">After abort shutdown, we do need to startup and shutdown database again. </span>
</div>

<div dir="ltr">
  <span style="font-family:tahoma;font-size:x-small;">Then second shutdown will bring database down cleanly.</span>
</div>

<div dir="ltr">
  <span style="font-family:tahoma;font-size:x-small;">After that you can backup database files.</span>
</div>

<div>
  Logon UNIX as "oracle"
</div>

<div>
  <span style="color:#ff0000;">================</span>
</div>

<div>
  <span style="color:#ff0000;"><strong>TO STOP DATABASE</strong></span>
</div>

<div>
  <span style="color:#ff0000;">================</span>
</div>

<div>
  1. Invoke SQL*Plus
</div>

<div>
  $ <span style="color:#ff0000;">sqlplus " / as sysdba"</span>
</div>

<div>
  SQL > <span style="color:#ff0000;">shutdown immediate;</span>
</div>

<div>
  .
</div>

<div>
  .
</div>

<div>
  Shutdown messages
</div>

<div>
  .
</div>

<div>
  Database closed.
</div>

<div>
  SQL > <span style="color:#ff0000;">exit;</span>
</div>

<div>
  <span style="color:#ff0000;"> </span>
</div>

<div>
  <em>Note : If there are connections to DB, Oracle may take some</em><em> time</em><em> to rollback each connection</em><em>'s</em><em> job and then </em><em>close the session</em><em>. Once all connect</em><em>ions are disconnected</em><em>, it will bring database down.</em>
</div>

<div>
  <em>During shutting down, Oracle will write</em><em> message to</em><em> in log file.</em><em> </em>
</div>

<div>
  <em>Please tail </em><em>the</em><em> file to see progression messages.</em>
</div>

<div>
  <em>tail -f /opt/oracle/db_1020/admin/psms01/bdump/alert_psms01.log</em>
</div>

<div>
  <em>If database is not down at reasonable time, you can terminate </em><em>command</em><em> by Ctrl+C,</em><em> </em><em>t</em><em>hen</em>
</div>

<div>
  <em>SQL> exit;</em>
</div>

<div>
  <em>$ sqlplus " / as sysdba"</em>
</div>

<div>
  <em>SQL > shutdown abort;</em>
</div>

<div>
  <em>SQL > exit;</em>
</div>

<div>
  <em>$ sqlplus " / as sysdba"</em>
</div>

<div>
  <em>SQL > shutdown immediate;</em>
</div>

<div>
  <em>SQL > exit;</em>
</div>

<div>
  <em>The above steps should be done as </em><em>the </em><em>last choice and only </em><em>when<br /> </em><em>database is not</em><em> </em><em>down as normal.</em>
</div>

<div>
  2. Shutdown Database Listener
</div>

<div>
  $ <span style="color:#ff0000;">lsnrctl stop </span>
</div>

<div>
  3. Verify Oracle Processes
</div>

<div>
  $ ps -ef |grep pmon
</div>

<div>
  $ ps -ef |grep tnslsnr
</div>

<div>
  No such process shown if step 1 & 2 are successfully done.
</div>

<div>
  <span style="color:#339966;">=================</span>
</div>

<div>
  <span style="color:#339966;"><strong>TO ST</strong><strong>ART</strong><strong> DATABASE</strong></span>
</div>

<div>
  <span style="color:#339966;">=================</span>
</div>

<div>
  1. Start Database Listener
</div>

<div>
  $ <span style="color:#339966;">lsnrctl st</span><span style="color:#339966;">art</span>
</div>

<div>
  2. Invoke SQL*Plus
</div>

<div>
  $ <span style="color:#339966;">sqlplus " / as sysdba"</span>
</div>

<div>
  SQL > <span style="color:#339966;">startup</span><span style="color:#339966;">;</span>
</div>

<div>
  .
</div>

<div>
  .
</div>

<div>
  Starting up messages
</div>

<div>
  .
</div>

<div>
  Database open.
</div>

<div>
  SQL > <span style="color:#339966;">exit;</span>
</div>

<div>
  3. Verify Oracle Processes
</div>

<div>
  $ ps -ef |grep pmon
</div>

<div>
  $ ps -ef |grep tnslsnr
</div>

<div>
  One process is expected for each 'ps' command.
</div>

<div>
  4. Test Connnection
</div>

<div>
  $ <span style="color:#339966;">sqlplus " / as sysdba"</span>
</div>

<div>
  SQL > <span style="color:#339966;">select </span><span style="color:#339966;">instance_name, host_name, </span>
</div>

<div>
  <span style="color:#339966;"> to_char(startup_time, 'DD-MON-YY HH24:MI'), status </span>
</div>

<div>
  <span style="color:#339966;"> from v$instance;</span>
</div>

<div>
  Status must be OPEN.
</div>
