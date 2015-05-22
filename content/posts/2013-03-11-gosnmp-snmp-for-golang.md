---
author: sonia
comments: true
date: 2013-03-11
url: /2013/03/11/gosnmp-snmp-for-golang/
title: GoSnmp - SNMP for GoLang
categories:
- Linux
tags:
- Golang
---

Today I released [soniah/gosnmp](http://github.com/soniah/gosnmp) - an update of [alouca/gosnmp](http://github.com/alouca).

<!--more-->

Many, many thanks to Andreas Louca for writing **alouca/gosnmp**. The major difference between his version and **soniah/gosnmp** is that the latter has tests written. (However the code could do with refactoring). The tests were used to find and correct errors in the following SNMP BER Types:



	
  * Counter32

	
  * Gauge32

	
  * Counter64

	
  * OctetString

	
  * ObjectIdentifier

	
  * IpAddress


Also, this version contains functions for treating the returned snmp values as `*big.Int` (convenient, as SNMP can return int32, uint32, and uint64 values)


