---
title: Solaris ps output truncated at 80 columns
author: Sonia Hamilton
date: 2010-06-10
url: /2010/06/10/solaris-ps-output-truncated-at-80-columns/
jabber_published:
  - 1276131356
categories:
  - Other-Tech
tags:
  - Solaris
---
When running the ps command on Solaris, the output is truncated at 80 columns &#8211; really annoying when the command line to start up a process (typically a daemon) is really long. This has been annoying me for ages, and I finally found a (sort of) solution &#8211; use a different ps, and run as root:

<pre># uname -a
SunOS fubar 5.9 Generic_118558-24 sun4u sparc SUNW,UltraAX-i2

# which ps
/usr/bin/ps

# /usr/ucb/ps auxwww 2&gt; /dev/null | grep 22480
root     22480  0.0  0.1 1896 1232 ?        S 10:22:11  0:00 ptymonitor --oob-fd 49 --stderr-mode MUX
--pty --term screen --rows 47 --cols 177
--termios 38400:38400:3.1C.7F.15.4.FF.FF.11.13.1A.100.12.17.16.100.100.100.F:B40:E3B:544505:8
--ttlg --gid 0 --uid 0 --wait-time 60 bash --rcfile /home/fubar/deployment/bin/dotbashrc_install.sh
</pre>

This can also be made to work for non-root users by granting the account the proc_owner privilege. For example, for the user fred:

<pre>/etc/security/prof_attr
Process Query:::Query Processes as Root:

/etc/security/exec_attr
Process Query:suser:cmd:::/usr/ucb/ps:privs=proc_owner;uid=0;euid=0;gid=0;egid=0

/etc/user_attr
fred::::type=normal;profiles=Process Query

passwd -e fred
/usr/bin/pfksh

cd ~fred
echo "export PS1='% '" &gt;&gt; .profile
</pre>
