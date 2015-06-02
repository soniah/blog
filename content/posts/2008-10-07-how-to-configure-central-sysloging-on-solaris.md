---
title: How to configure central syslog’ing on Solaris
author: Sonia Hamilton
date: 2008-10-07
url: /2008/10/07/how-to-configure-central-sysloging-on-solaris/
categories:
  - Other-Tech
tags:
  - Solaris
---
Quick notes; [see Solaris: Logging to a separate loghost, the easy way][1].

<!--more-->

  * edit /etc/inet/hosts, add in an alias for loghost eg **1.2.3.4 loghost**
  * **/etc/init.d/syslog restart** (Solaris 8), svcadm on later versions

Other useful links for &#8216;the Solaris way' (vs Linux):

  * [Rosetta Stone for Unix][2]
  * [Some Solaris Knowledge][3] (thanks Lindsay)

 [1]: http://woss.name/2007/06/17/solaris-logging-to-a-separate-loghost-the-easy-way/
 [2]: http://bhami.com/rosetta.html
 [3]: http://www.zagbot.com/solaris.html
