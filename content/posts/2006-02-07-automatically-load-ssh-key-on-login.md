---
title: automatically load ssh key on login
author: Sonia Hamilton
date: 2006-02-08
url: /2006/02/07/automatically-load-ssh-key-on-login/
categories:
  - Linux
tags:
  - Ssh
---
  * add **ssh-add** as a startup program under **System, Preferences, Sessions** (ssh-agent is started automatically by X) (**Applications, Preferences, More Preferences, Session** on Fedora)
  * when logged in via ssh or console, run:

<pre>eval `ssh-agent`
 ssh-add</pre>
