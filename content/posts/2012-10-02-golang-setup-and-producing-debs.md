---
author: sonia
comments: true
date: 2012-10-02
url: /2012/10/02/golang-setup-and-producing-debs/
title: Golang - setup and producing .debs
categories:
- Linux
tags:
- Debian
- Golang
- Ubuntu
---

Here's the setup I use for compiling Go binaries, as well as for writing .deb's to package them and [markdown](http://en.wikipedia.org/wiki/Markdown) for README's - _notes for me_.

<!--more-->

Install build pre-requisites:

[sourcecode language="bash"]
sudo aptitude install gcc libc6-dev libc6-dev-i386 make \
  markdown build-essential debhelper dh-make fakeroot devscripts
[/sourcecode]

Install Go from source (so can cross-compile). Download from [Go Downloads](http://code.google.com/p/go/downloads/list) eg go1.0.2.src.tar.gz

[sourcecode language="bash"]
sudo tar -C /usr/local -xzf go1.0.2.src.tar.gz ; cd /usr/local/go/src
sudo GOARCH=amd64 ./all.bash ; sudo GOARCH=386 ./all.bash
[/sourcecode]

Add to /etc/profile, source or re-login:
[sourcecode language="bash"]
export GOROOT="/usr/local/go"
export PATH="$GOROOT/bin:$PATH"
[/sourcecode]


