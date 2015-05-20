---
author: sonia
comments: true
date: 2012-10-09 01:52:35+00:00
slug: sending-email-from-shell-via-mutt
title: Sending email from shell via mutt
wordpress_id: 1713
categories:
- Linux
tags:
- mutt
---

A quick example of sending email from the shell via mutt.

[sourcecode language="shell"]
% cat msg.txt 
pdf attached. Sonia.

for i in *.pdf ; do              
  mutt -s "pdf - $i" -a $i -- 'foo@hotmail.com' < msg.txt
done
[/sourcecode]

No rocket science, just saving me from RTFM'ing next time...


