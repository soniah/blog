---
author: sonia
comments: true
date: 2010-04-30 06:31:29+00:00
slug: solaris-rbac-creating-limited-accounts
title: Solaris RBAC - creating limited accounts
wordpress_id: 693
categories:
- Other-Tech
tags:
- Solaris
---

Solaris has a feature called [RBAC](http://en.wikipedia.org/wiki/Role-based_access_control), that allows you to provide role-based security (I believe this is similar to [SELinux](http://en.wikipedia.org/wiki/Selinux)).

All the documentation and examples I've seen explain how to setup up a role that allows a normal user to do a higher privileged command (eg manage log files, manage printers). But I haven't been able to find an example of how to create a limited account, one that is _only_ allowed to run a fixed number of commands. Here's how I did it:

(Solaris 10 10/09 s10x_u8wos_08a X86)

Create a user foo with a profile shell and Limited profile:

    
    /etc/passwd
    foo:x:101:1::/export/home/foo:/usr/bin/pfsh
    /etc/user_attr
    foo::::type=normal;profiles=Limited


Create the Limited profile:

    
    /etc/security/prof_attr
    Limited:::Runner of limited commands:
    /etc/security/exec_attr
    Limited:suser:cmd:::/export/home/foo/bin/Address:uid=0


Create an example script:

    
    /export/home/foo/bin/Address
    #!/bin/sh
    /usr/sbin/ifconfig -a


Remove default auths and profile from all users. Note - this is required so that the foo user doesn't get the "Basic Solaris User" profile, which allows all user level binaries to be run. This however affects other accounts and services, and would require further testing:

    
    /etc/security/policy.conf
    # sonia AUTHS_GRANTED=solaris.device.cdrw
    # sonia PROFS_GRANTED=Basic Solaris User


(As root), check auths and profile of foo user:

    
    # auths foo
    auths: foo : No authorizations
    # profiles foo
     Limited
    # profiles -l foo
     Limited:
     /export/home/foo/bin/Address    uid=0


As foo user, run Address command:

    
    # su foo
    # /export/home/foo/bin/Address
    lo0: <snip>     <=== works as required
    # ls
    ls: not found   <=== as expected - foo user is limited


Create another user, test



	
  * if the shell is /usr/bin/bash - doesn't seem to cause problems. However, it may affect services - testing would be required.

	
  * if the shell is /usr/bin/pfsh:



    
    # ls
    ls: not found   <=== ie other accounts with profile shells need a profile explicitly assigned


If the default auths and profile _aren't_ removed from all users, we get this - foo user is allowed to run all user level binaries (the *):

    
    # auths foo
    solaris.device.cdrw,solaris.profmgr.read,solaris.jobs.users,solaris.mail.mailq,solaris.admin.usermgr.read,solaris.admin.logsvc.read,solaris.admin.fsmgr.read,solaris.admin.serialmgr.read,solaris.admin.diskmgr.read,solaris.admin.procmgr.user,solaris.compsys.read,solaris.admin.printer.read,solaris.admin.prodreg.read,solaris.admin.dcmgr.read,solaris.snmp.read,solaris.project.read,solaris.admin.patchmgr.read,solaris.network.hosts.read,solaris.admin.volmgr.read
    # profiles foo
     Limited
     Basic Solaris User
     All
    # profiles -l foo
     Limited:
     /export/home/foo/bin/Address    uid=0
     All:
     *
