---
author: sonia
comments: true
date: 2010-09-28 07:14:47+00:00
slug: password-caching-with-sshpass
title: password caching with sshpass
wordpress_id: 747
categories:
- Other-Tech
---

[sshpass](http://sourceforge.net/projects/sshpass/) - a tool for _non-interactively performing password authentication with SSH's so called "interactive keyboard password authentication"_ - useful for automation scripts where you are unable to use ssh keys.

Of course using ssh keys plus an ssh-agent or ssh keychain (even for [cron jobs](http://blog.snowfrog.net/2007/11/15/ssh-ssh-agent-keychain-and-cron-notes/)) is more secure. But I'm working with a proprietary, linux based system where some pointy-headed-boss decided that it's safer to disable key based authentication, because, well, I don't know (because they don't understand key based authentication?).

A work mate came across sshpass, and we use it by caching the password in an env variable. Slightly safer than the older version, where our [expect](http://www.nist.gov/mel/msid/expect.cfm) scripts just pulled the password out of a file :-o

[More ssh notes](http://blog.snowfrog.net/tag/ssh/).
