---
author: sonia
comments: true
date: 2009-01-11 23:56:35+00:00
slug: shutdownstartup-oracle
title: Shutdown/Startup Oracle
wordpress_id: 219
categories:
- Other-Tech
tags:
- Oracle
---

Some notes on shutting down and starting up Oracle, taken from an email.



Please be corrected in Note Section if you do need to do abort shutdown.




After abort shutdown, we do need to startup and shutdown database again. 




Then second shutdown will bring database down cleanly.




After that you can backup database files.




Logon UNIX as "oracle"




================




**TO STOP DATABASE**




================




1. Invoke SQL*Plus




$ sqlplus " / as sysdba"




SQL > shutdown immediate;




...




...




Shutdown messages




...




Database closed.




SQL > exit;







_Note : If there are connections to DB, Oracle may take some__ time__ to rollback each connection__'s__ job and then __close the session__. Once all connect__ions are disconnected__, it will bring database down._




_During shutting down, Oracle will write__ message to__ in log file.__ _




_Please tail __the__ file to see progression messages._




_tail -f  /opt/oracle/db_1020/admin/psms01/bdump/alert_psms01.log_




_If database is not down at reasonable time, you can terminate __command__ by Ctrl+C,__ __t__hen_




_SQL> exit;_




_$ sqlplus " / as sysdba"_




_SQL > shutdown abort;_




_SQL > exit;_




_$ sqlplus " / as sysdba"_




_SQL > shutdown immediate;_




_SQL > exit;_




_The above steps should be done as __the __last choice and only __when
__database is not__ __down as normal._




2. Shutdown Database Listener




$ lsnrctl stop 




3. Verify Oracle Processes




$  ps -ef |grep pmon




$  ps -ef |grep tnslsnr




No such process shown if step 1 & 2 are successfully done.




=================




**TO ST****ART**** DATABASE**




=================




1. Start Database Listener




$ lsnrctl start




2. Invoke SQL*Plus




$ sqlplus " / as sysdba"




SQL > startup;




...




...




Starting up messages




...




Database open.




SQL > exit;




3. Verify Oracle Processes




$  ps -ef |grep pmon




$  ps -ef |grep tnslsnr




One process is expected for each 'ps' command.




4. Test Connnection




$ sqlplus " / as sysdba"




SQL > select instance_name, host_name, 




to_char(startup_time, 'DD-MON-YY HH24:MI'), status 




from   v$instance;




Status must be OPEN.
