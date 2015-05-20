---
title: Solaris RBAC – creating limited accounts
author: Sonia Hamilton
date: 2010-04-30
url: /2010/04/30/solaris-rbac-creating-limited-accounts/
categories:
  - Other-Tech
tags:
  - Solaris
---
Solaris has a feature called [RBAC][1], that allows you to provide role-based security (I believe this is similar to [SELinux][2]).

All the documentation and examples I&#8217;ve seen explain how to setup up a role that allows a normal user to do a higher privileged command (eg manage log files, manage printers). But I haven&#8217;t been able to find an example of how to create a limited account, one that is *only* allowed to run a fixed number of commands. Here&#8217;s how I did it:

(Solaris 10 10/09 s10x\_u8wos\_08a X86)

Create a user foo with a profile shell and Limited profile:

<pre>/etc/passwd
foo:x:101:1::/export/home/foo:/usr/bin/pfsh
/etc/user_attr
foo::::type=normal;profiles=Limited</pre>

Create the Limited profile:

<pre>/etc/security/prof_attr
Limited:::Runner of limited commands:
/etc/security/exec_attr
Limited:suser:cmd:::/export/home/foo/bin/Address:uid=0</pre>

Create an example script:

<pre>/export/home/foo/bin/Address
#!/bin/sh
/usr/sbin/ifconfig -a</pre>

Remove default auths and profile from all users. Note &#8211; this is required so that the foo user doesn&#8217;t get the &#8220;Basic Solaris User&#8221; profile, which allows all user level binaries to be run. This however affects other accounts and services, and would require further testing:

<pre>/etc/security/policy.conf
# sonia AUTHS_GRANTED=solaris.device.cdrw
# sonia PROFS_GRANTED=Basic Solaris User</pre>

(As root), check auths and profile of foo user:

<pre># auths foo
auths: foo : No authorizations
# profiles foo
 Limited
# profiles -l foo
 Limited:
 /export/home/foo/bin/Address    uid=0</pre>

As foo user, run Address command:

<pre># su foo
# /export/home/foo/bin/Address
lo0: &lt;snip&gt;     &lt;=== works as required
# ls
ls: not found   &lt;=== as expected - foo user is limited</pre>

Create another user, test

  * if the shell is /usr/bin/bash &#8211; doesn&#8217;t seem to cause problems. However, it may affect services &#8211; testing would be required.
  * if the shell is /usr/bin/pfsh:

<pre># ls
ls: not found   &lt;=== ie other accounts with profile shells need a profile explicitly assigned</pre>

If the default auths and profile *aren&#8217;t* removed from all users, we get this &#8211; foo user is allowed to run all user level binaries (the *):

<pre># auths foo
solaris.device.cdrw,solaris.profmgr.read,solaris.jobs.users,solaris.mail.mailq,solaris.admin.usermgr.read,solaris.admin.logsvc.read,solaris.admin.fsmgr.read,solaris.admin.serialmgr.read,solaris.admin.diskmgr.read,solaris.admin.procmgr.user,solaris.compsys.read,solaris.admin.printer.read,solaris.admin.prodreg.read,solaris.admin.dcmgr.read,solaris.snmp.read,solaris.project.read,solaris.admin.patchmgr.read,solaris.network.hosts.read,solaris.admin.volmgr.read
# profiles foo
 Limited
 Basic Solaris User
 All
# profiles -l foo
 Limited:
 /export/home/foo/bin/Address    uid=0
 All:
 *</pre>

 [1]: http://en.wikipedia.org/wiki/Role-based_access_control
 [2]: http://en.wikipedia.org/wiki/Selinux
