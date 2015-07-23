---
title: ssh – fix long login times – disable Kerberos
author: Sonia Hamilton
date: 2011-06-23
url: /2011/06/23/ssh-fix-long-login-times-disable-kerberos/
categories:
  - Other-Tech
tags:
  - Ssh
---
If ssh logins are taking a long time (but are ultimately successful), it may be because Kerberos (gssapi) is being attempted as an authentication method, and the destination is incorrectly configured (often seems to be CentOS or RHEL):

<!--more-->

<pre>% ssh -v foo
...
debug1: Authentications that can continue: publickey,gssapi-with-mic,password
                                                     ^^^^^^^^^^^^^^^</pre>

**Quick fix:** disable Kerberos on the client:

<pre>% cat ~/.ssh/config
...
GSSAPIAuthentication no</pre>

Of course the problem could also be DNS or other network issues. Thanks to [Waiting for SSH login prompt][1].

 [1]: http://linuxsysadminblog.com/2009/07/waiting-for-ssh-login-prompt/
