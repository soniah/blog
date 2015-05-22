---
author: sonia
comments: true
date: 2012-10-09
url: /2012/10/09/sending-email-from-shell-via-mutt/
title: Sending email from shell via mutt
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


