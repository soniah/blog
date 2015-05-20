---
author: sonia
comments: true
date: 2007-08-05 22:34:57+00:00
slug: find-50-biggest-files
title: Find 50 biggest files
wordpress_id: 68
categories:
- Linux
---

Here's how to find the 50 biggest files on a partition:

`sudo find / -xdev -type f -printf "%15s    %pn" |sort -nr | head -50 | less`

Thanks to Erik de Castro Lopo, SLUG list.
