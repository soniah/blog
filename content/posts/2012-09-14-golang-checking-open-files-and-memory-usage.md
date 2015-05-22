---
author: sonia
comments: true
date: 2012-09-14
url: /2012/09/14/golang-checking-open-files-and-memory-usage/
title: 'Golang: checking open files and memory usage'
categories:
- Linux
tags:
- Golang
---

Notes to myself more than anything, and not really specific to Go (but that's where I was using it).

<!--more-->

To watch the memory usage of a process with pid PID:

{{< highlight bash >}}
while [ 1 ] ; do
  grep VmSize  /proc/PID/status ; sleep 10
done
{{< /highlight >}}

To watch the number of file descriptors being used:

{{< highlight bash >}}
while [ 1 ] ; do
  sudo lsof -p PID | wc -l ; sleep 10
done
{{< /highlight >}}
