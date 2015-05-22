---
title: rsyncp – provide ssh password to rsync using expect
author: Sonia Hamilton
date: 2011-07-28
url: /2011/07/28/rsyncp-provide-ssh-password-to-rsync-using-expect/
categories:
  - Linux
tags:
  - Expect
  - Rsync
  - Ssh
---
A script I wrote &#8211; rsyncp. It allows you to provide a password to rsync over ssh, when you&#8217;re unable to use ssh key-based authentication:

<pre>% cat ~/bin/rsyncp
#!/usr/bin/expect
eval spawn rsync $argv
expect  "*?assword:" { send "secretstuffr"}
expect eof</pre>

You can then use rsyncp in another script, like this:

<pre>for h in foo bar ; do
  rsyncp -av --progress srcdir/ $h:dstdir/
done</pre>

And before you add a comment saying *use [ssh keys][1] or [keychain][2], this is totally insecure*, I agree with you! Key based authentication is disabled on the target server, and I&#8217;m still trying to resolve the *politics* around this at my current company, and [sshpass][3] seems broken <sigh>

 [1]: http://blog.snowfrog.net/2008/09/05/how-to-use-putty-with-ssh-keys-on-windows/
 [2]: http://blog.snowfrog.net/2009/06/09/source-keychain-credentials-in-perl/
 [3]: http://www.cyberciti.biz/faq/noninteractive-shell-script-ssh-password-provider/
