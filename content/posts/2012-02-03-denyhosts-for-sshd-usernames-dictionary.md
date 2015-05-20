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
I&#8217;ve just setup the venerable [denyhosts][1] on one of my servers, to stop the usual script-kiddies from *filling up my logs* (I&#8217;m not particularly worried about them getting in&#8230;).

Anyway, here is [restricted-usernames.gz][2], a list of denied usernames from the log &#8211; handy to add to your denyhosts [restricted-usernames file][3]. There&#8217;s probably a better dictionary of usernames out there &#8211; I&#8217;ll attach it if I <del>find it</del> stumble upon it.

 [1]: http://denyhosts.sourceforge.net/
 [2]: http://blog.snowfrog.net/wp-content/uploads/2012/02/restricted-usernames.gz
 [3]: http://denyhosts.sourceforge.net/faq.html#restricted
