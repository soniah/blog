---
author: sonia
comments: true
date: 2006-02-08 03:37:58+00:00
slug: automatically-load-ssh-key-on-login
title: automatically load ssh key on login
wordpress_id: 18
categories:
- Linux
tags:
- Ssh
---


	
  * add **ssh-add** as a startup program under **System, Preferences, Sessions** (ssh-agent is started automatically by X) (**Applications, Preferences, More Preferences, Session** on Fedora)

	
  * when logged in via ssh or console, run:



    
    
     eval `ssh-agent`
     ssh-add
