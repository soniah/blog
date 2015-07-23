---
title: Oracle and shmmax and shmall
author: Sonia Hamilton
date: 2009-02-16
url: /2009/02/16/oracleoracle-and-shmmax-and-shmall/
categories:
  - Linux
tags:
  - Oracle
---
A [good article][1] on Oracle and shmmax and shmall. In a nutshell:

<!--more-->

  * **shmall** it is not the maximum amount of memory which can be allocated, it is the maximum size of any shared memory chunk -- how big a bite you want per bite from free memory.
  * **shmmax** -- its value determines the maximum amount of memory that ALL shared memory can take. the actual setting is derived… the maximum amount of memory = shmall * pagesize where pagesize = getconf PAGE_SIZE and shmall = cat /proc/sys/kernel/shmall

 [1]: http://www.pythian.com/blogs/245/the-mysterious-world-of-shmmax-and-shmall
