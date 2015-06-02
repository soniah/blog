---
title: ssh, sudo, tty, shell
author: Sonia Hamilton
date: 2011-07-14
url: /2011/07/14/ssh-sudo-tty-shell/
categories:
  - Other-Tech
tags:
  - Shell
---
A nice little script snippet I like to remember for automating quick stuff across multiple hosts. **-t** forces tty (so sudo will work); **-q** quiet -- disable banners; **-c** script (&#8220;command&#8221;) to su. Presumes sudo doesn't prompt for a password; otherwise, see [Expect][1] and [Exploring Expect][2] :-)

<!--more-->

<pre>for h in $hosts ; do
  echo -e "nnhost: $hn------------------------------------"
  ssh -t -q $h "sudo su - -c "magic_stuff" "
done</pre>

 [1]: http://www.nist.gov/el/msid/expect.cfm
 [2]: http://oreilly.com/catalog/9781565920903
