---
author: sonia
comments: true
date: 2007-12-05 05:24:18+00:00
slug: svn-over-an-ssh-tunnel
title: svn over an ssh tunnel
wordpress_id: 105
categories:
- Other-Tech
tags:
- Ssh
- Subversion
---

Often a subversion server is on an internal server that can't be reached by a DMZ server, and ssh+svn isn't setup. Here's a quick recipe for ssh tunnelling from the subversion server to the DMZ server and using svn.
`
root@svnserver$ ssh -R dmzserver 3690:svnserver:3690
root@dmzserver$ svn co --username sonia svn://localhost/unix/trunk/foo/ # so root not used
root@dmzserver$ svn ci --username sonia --password secret
`
