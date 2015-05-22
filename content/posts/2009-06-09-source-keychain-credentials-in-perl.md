---
title: Source keychain credentials in Perl
author: Sonia Hamilton
date: 2009-06-09
url: /2009/06/09/source-keychain-credentials-in-perl/
categories:
  - Other-Tech
tags:
  - Cron
  - Perl
  - Ssh
---
I use [keychain][1] for securely [caching my ssh key credentials when running scripts from cron][2].

<!--more-->

[Here&#8217;s][3] how to use keychain with Perl scripts:

<pre>Create a wrapper script:
source ~/.keychain/hostname-sh
run_perl_program.pl</pre>

To run a one-off command do:

<pre>system("source ~/.keychain/hostname-sh; cmd");</pre>

 [1]: http://www.gentoo.org/proj/en/keychain/
 [2]: http://blog.snowfrog.net/2007/11/15/ssh-ssh-agent-keychain-and-cron-notes/
 [3]: http://www.mail-archive.com/centos@centos.org/msg12887.html
