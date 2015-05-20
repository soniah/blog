---
author: sonia
comments: true
date: 2011-06-23 02:05:12+00:00
slug: ssh-fix-long-login-times-disable-kerberos
title: ssh - fix long login times - disable Kerberos
wordpress_id: 1052
categories:
- Other-Tech
tags:
- Ssh
---

If ssh logins are taking a long time (but are ultimately successful), it may be because Kerberos (gssapi) is being attempted as an authentication method, and the destination is incorrectly configured (often seems to be CentOS or RHEL):

    
    % ssh -v foo
    ...
    debug1: Authentications that can continue: publickey,gssapi-with-mic,password
                                                         ^^^^^^^^^^^^^^^


**Quick fix:** disable Kerberos on the client:

    
    % cat ~/.ssh/config
    ...
    GSSAPIAuthentication no


Of course the problem could also be DNS or other network issues. Thanks to [Waiting for SSH login prompt](http://linuxsysadminblog.com/2009/07/waiting-for-ssh-login-prompt/).
