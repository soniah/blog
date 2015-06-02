---
title: password caching with sshpass
author: Sonia Hamilton
date: 2010-09-28
url: /2010/09/28/password-caching-with-sshpass/
categories:
  - Other-Tech
---
[sshpass][1] -- a tool for *non-interactively performing password authentication with SSH's so called &#8220;interactive keyboard password authentication&#8221;* -- useful for automation scripts where you are unable to use ssh keys.

<!--more-->

Of course using ssh keys plus an ssh-agent or ssh keychain (even for [cron jobs][2]) is more secure. But I'm working with a proprietary, linux based system where some pointy-headed-boss decided that it's safer to disable key based authentication, because, well, I don't know (because they don't understand key based authentication?).

A work mate came across sshpass, and we use it by caching the password in an env variable. Slightly safer than the older version, where our [expect][3] scripts just pulled the password out of a file :-o

[More ssh notes][4].

 [1]: http://sourceforge.net/projects/sshpass/
 [2]: http://blog.snowfrog.net/2007/11/15/ssh-ssh-agent-keychain-and-cron-notes/
 [3]: http://www.nist.gov/mel/msid/expect.cfm
 [4]: http://blog.snowfrog.net/tag/ssh/
