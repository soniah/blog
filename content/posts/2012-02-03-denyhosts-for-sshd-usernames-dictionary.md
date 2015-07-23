---
title: Denyhosts for sshd – usernames dictionary
author: Sonia Hamilton
date: 2012-02-02
url: /2012/02/03/denyhosts-for-sshd-usernames-dictionary/
categories:
  - Linux
tags:
  - Ssh
---
I've just setup the venerable [denyhosts][1] on one of my servers, to stop the usual script-kiddies from *filling up my logs* (I'm not particularly worried about them getting in.).

<!--more-->

Anyway, here is [restricted-usernames.gz][2], a list of denied usernames from the log -- handy to add to your denyhosts [restricted-usernames file][3]. There's probably a better dictionary of usernames out there -- I'll attach it if I <del>find it</del> stumble upon it.

 [1]: http://denyhosts.sourceforge.net/
 [2]: http://blog2.snowfrog.net/wp-content/uploads/2012/02/restricted-usernames.gz
 [3]: http://denyhosts.sourceforge.net/faq.html#restricted
