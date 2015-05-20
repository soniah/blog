---
title: svn over an ssh tunnel
author: Sonia Hamilton
date: 2007-12-05
url: /2007/12/04/svn-over-an-ssh-tunnel/
categories:
  - Other-Tech
tags:
  - Ssh
  - Subversion
---
Often a subversion server is on an internal server that can&#8217;t be reached by a DMZ server, and ssh+svn isn&#8217;t setup. Here&#8217;s a quick recipe for ssh tunnelling from the subversion server to the DMZ server and using svn.  
`<br />
root@svnserver$ ssh -R dmzserver 3690:svnserver:3690<br />
root@dmzserver$ svn co --username sonia svn://localhost/unix/trunk/foo/ # so root not used<br />
root@dmzserver$ svn ci --username sonia --password secret<br />
`
