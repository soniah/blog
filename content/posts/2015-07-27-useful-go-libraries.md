---
author: sonia
date: 2015-07-27
url: /2015/07/27/useful-go-libraries/
title: Useful Go Libraries
categories:
- Linux
tags:
- Golang
---

A list of [Go](https://golang.org/) libraries and tools I find useful.

<!--more-->

* [spf13/viper](https://github.com/spf13/viper) - configuration for
  apps, using command line flags, ENVIRONMENT, json, etcd/consul. Good for general
  devops 'munging' scripts
* [kr/pretty](https://github.com/kr/pretty) - pretty printing for Go
  values
* [mitchellh/mapstructure](https://github.com/mitchellh/mapstructure) -
  Go library for decoding generic map values into native Go structures.
* [spf13/cast](https://github.com/spf13/cast) - safe and easy casting
  from one type to another in Go
* [Jeffail/gabs](https://github.com/Jeffail/gabs) - parsing,
  creating and editing unknown or dynamic JSON in golang

# Snippets

## fatalIfErr, fatalIfNotOk

{{< highlight go >}}
// from https://github.com/FiloSottile/whosthere
func fatalIfErr(err error) {
  if err != nil {
    log.Fatal(err)
  }
}

// example
db, err := sql.Open("mysql", C.MySQL)
fatalIfErr(err)
fatalIfErr(db.Ping())

// also
func fatalIfNotOk(ok bool, msg string) {
    if !ok {
        log.Fatal("not ok: " + msg)
    }
}
{{< /highlight >}}

## runcmd

{{< highlight go >}}
// from https://stackoverflow.com/questions/6182369/exec-a-shell-command-in-go
func runcmd(cmd string, shell bool) []byte {
    if shell {
        out, err := exec.Command("bash", "-c", cmd).Output()
        if err != nil {
            panic("some error found")
        }
        return out
    } else {
        out, err := exec.Command(cmd).Output()
        if err != nil {
            panic("some error found")
        }
        return out
    }
}
{{< /highlight >}}
