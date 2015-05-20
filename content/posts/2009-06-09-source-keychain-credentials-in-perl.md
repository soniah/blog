---
author: sonia
comments: true
date: 2009-06-09 01:16:43+00:00
slug: source-keychain-credentials-in-perl
title: Source keychain credentials in Perl
wordpress_id: 496
categories:
- Other-Tech
tags:
- Cron
- Perl
- Ssh
---

I use [keychain](http://www.gentoo.org/proj/en/keychain/) for securely [caching my ssh key credentials when running scripts from cron](http://blog.snowfrog.net/2007/11/15/ssh-ssh-agent-keychain-and-cron-notes/).

[Here's](http://www.mail-archive.com/centos@centos.org/msg12887.html) how to use keychain with Perl scripts:

    
    Create a wrapper script:
    source ~/.keychain/hostname-sh
    run_perl_program.pl


To run a one-off command do:

    
    system("source ~/.keychain/hostname-sh; cmd");
