---
author: sonia
comments: true
date: 2013-06-03
url: /2013/06/03/golang-profiling-libraries-and-gosnmp-for-snmp/
title: Golang - profiling libraries and GoSNMP for SNMP
categories:
- Linux
tags:
- Golang
---

There is already a great article on [Profiling Go Programs](blog.golang.org/2011/06/profiling-go-programs.html). However that article only discusses how to profile a standalone binary - what about a library?

For example, I've been working on the [GoSNMP SNMP library](http://github.com/soniah/gosnmp), here's how I profiled it (it wasn't obvious):

[sourcecode lang="shell"]
# produce cpu profiling information from the tests - this part was well documented
% go test -cpuprofile cpu.out

# compile the test binary to pkg.test but do not run it (from `go help test`)
# this part wasn't obvious
% go test -c

# now run pprof using `go teste -c` output
# using gosnmp.test - this part wasn't obvious
% go tool pprof gosnmp.test cpu.out
[/sourcecode]

Doing a memory profile was similar:

[sourcecode lang="shell"]
% go test -memprofile mem.out
% go test -c
% go tool pprof gosnmp.test mem.out
[/sourcecode]

