---
author: sonia
comments: true
date: 2011-07-28 07:45:47+00:00
slug: rsyncp-provide-ssh-password-to-rsync-using-expect
title: rsyncp - provide ssh password to rsync using expect
wordpress_id: 1103
categories:
- Linux
tags:
- Expect
- Rsync
- Ssh
---

A script I wrote - rsyncp. It allows you to provide a password to rsync over ssh, when you're unable to use ssh key-based authentication:

    
    % cat ~/bin/rsyncp
    #!/usr/bin/expect
    eval spawn rsync $argv
    expect  "*?assword:" { send "secretstuffr"}
    expect eof


You can then use rsyncp in another script, like this:

    
    for h in foo bar ; do
      rsyncp -av --progress srcdir/ $h:dstdir/
    done


And before you add a comment saying _use [ssh keys](http://blog.snowfrog.net/2008/09/05/how-to-use-putty-with-ssh-keys-on-windows/) or [keychain](http://blog.snowfrog.net/2009/06/09/source-keychain-credentials-in-perl/), this is totally insecure_, I agree with you! Key based authentication is disabled on the target server, and I'm still trying to resolve the _politics_ around this at my current company, and [sshpass](http://www.cyberciti.biz/faq/noninteractive-shell-script-ssh-password-provider/) seems broken <sigh>
