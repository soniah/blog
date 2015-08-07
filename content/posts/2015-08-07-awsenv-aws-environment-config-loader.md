---
author: sonia
date: 2015-08-07
url: /2015/08/07/awsenv-aws-environment-config-loader/
title: awsenv AWS environment config loader
categories:
- Linux
tags:
- TODO
---

Today I released [soniah/awsenv](https://github.com/soniah/awsenv) - a
small binary for helping load aws environment variables.

<!--more-->

**awsenv** is a small binary that loads AWS environment variables for an AWS
profile from **~/.aws/credentials** - useful if you're regularly switching
credentials and using tools like [Vagrant](https://www.vagrantup.com/). In
addition to `aws_access_key_id` and `aws_secret_access_key`, it will also
optionally load settings for `aws_keyname` and `aws_keypath`.

The accepted flags can be displayed using `-h`:

```
% awsenv -h
Usage:
  awsenv [OPTIONS] Profile

Application Options:
  -v, --verbose   Verbose output
  -f, --filename= Credentials file (~/.aws/credentials)

Help Options:
  -h, --help      Show this help message

Arguments:
  Profile
```
