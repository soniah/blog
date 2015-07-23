---
title: Find 50 biggest files
author: Sonia Hamilton
date: 2007-08-05
url: /2007/08/05/find-50-biggest-files/
categories:
  - Linux
---
Here's how to find the 50 biggest files on a partition:

<!--more-->

`sudo find / -xdev -type f -printf "%15s    %pn" |sort -nr | head -50 | less`

Thanks to Erik de Castro Lopo, SLUG list.
