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

* [fatih/vimgo](https://github.com/fatih/vim-go) - amazing Vim plugin
  for Go - auto format and vet code, fix imports, syntax highlighting,
  and many other features
* [spf13/viper](https://github.com/spf13/viper) - configuration for
  apps, using command line flags, ENVIRONMENT, json, etcd/consul. Good for
  general devops 'munging' scripts
* [Jeffail/gabs](https://github.com/Jeffail/gabs) - provides a dynamic language
  approach to JSON
* [mitchellh/mapstructure](https://github.com/mitchellh/mapstructure) -
  JSON decoding tools - varying structure, weakly typed fields, squashing arrays
* [spf13/cast](https://github.com/spf13/cast) - safe and easy casting
  from one type to another in Go - useful for JSON, YAML, etc
* [kr/pretty](https://github.com/kr/pretty) - pretty printing for Go
  values
* [armon/go-metrics](http://github.com/armon/go-metrics) - for exporting
  performance and runtime metrics to external metrics systems (i.e.
  statsite, statsd)
* [ryanuber/columnize](http://github.com/ryanuber/columnize) - easy
  column formatted output for golang
* [package terminal](https://godoc.org/golang.org/x/crypto/ssh/terminal)
  - support functions for dealing with terminals - raw mode, reading
  passwords, foreground colors
* [Songmu/prompter](https://github.com/Songmu/prompter) - utility for
  easy prompting - Choose, Password, Prompt, etc
* [gholt/brimtext](https://github.com/gholt/brimtext) - tools for
  working with text - tables, colours, etc

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
// run a command using the shell; no need to split args
// from https://stackoverflow.com/questions/6182369/exec-a-shell-command-in-go
func runcmd(cmd string, shell bool) []byte {
    if shell {
        out, err := exec.Command("bash", "-c", cmd).Output()
        if err != nil {
            log.Fatal(err)
            panic("some error found")
        }
        return out
    }
    out, err := exec.Command(cmd).Output()
    if err != nil {
        log.Fatal(err)
    }
    return out
}
{{< /highlight >}}
