---
author: sonia
date: 2013-02-10
url: /2013/02/10/gsnmpgo-snmp-for-golang-using-gsnmp/
title: gsnmpgo - SNMP for Golang using gsnmp
categories:
- Linux
tags:
- CGo
- Go
- Golang
- SNMP
---

Update 8/Mar/13. Work on gsnmpgo has halted. Making the gsnmp C library multithreaded was proving too time consuming. Use http://github.com/soniah/gosnmp instead.

<!--more-->

## Previously...


I recently released [gsnmpgo](http://github.com/soniah/gsnmpgo) - a Go/CGo snmp library using gsnmp. Pull requests welcome!

From the [gsnmpgo documentation](http://godoc.org/github.com/soniah/gsnmpgo), here's an example of usage:

{{< highlight go >}}
// do an snmp get; RFC 4088 is used for uris
uri := `snmp://public@192.168.1.10//(1.3.6.1.2.1.1.1.0)`
params := gsnmpgo.NewDefaultParams(uri)
results, err := gsnmpgo.Query(params)
if err != nil {
    fmt.Println(err)
    os.Exit(1)
}

// check your results
gsnmpgo.Dump(results)

// turn on debugging
gsnmpgo.Debug = true
{{< /highlight >}}
