---
author: sonia
date: 2014-12-03
url: /2014/12/03/building-the-development-version-of-terraform/
title: Building the development version of Terraform
categories:
- Linux
tags:
- Golang
- Terraform
---

Instructions on how to build the development version of [Terraform](https://www.terraform.io/).

<!--more-->

First you need to install [Go](http://en.wikipedia.org/wiki/Go_%28programming_language%29), I have a script for this that would be easy to adapt for your needs. It installs Go, but also downloads some common projects ([go-bindata](https://github.com/jteeuwen/go-bindata), [lint](https://github.com/jteeuwen/go-bindata)) and my own projects ([gosnmp](https://github.com/soniah/gosnmp), [evaler](https://github.com/soniah/evaler)).

{{< highlight shell >}}
#!/bin/bash

## install go

tgz=go1.3.3.linux-amd64.tar.gz
url=https://storage.googleapis.com/golang/$tgz

if ! [ -f /var/tmp/$tgz ] ; then
	cd /var/tmp
	wget $url
fi

if ! [ -d /usr/local/go ] ; then
	sudo tar -C /usr/local -xzf /var/tmp/$tgz
fi

## setup dev directory structure

mkdir -p ~/go/{sonia,thirdparty}/{bin,pkg,src}

cd ~/go/thirdparty/src
#---------------------

read -p "Install third party repos? (go-bindata, lint)"
if [[ $REPLY =~ ^[Yy]$ ]] ; then
	if ! [ -d github.com/jteeuwen/go-bindata ] ; then
		go get github.com/jteeuwen/go-bindata/...
		cp ~/go/thirdparty/bin/go-bindata ~/bin
	fi

	if ! [ -d github.com/golang/lint ] ; then
		go get github.com/golang/lint/golint
		cp ~/go/thirdparty/bin/golint ~/bin
	fi
fi

cd ~/go/sonia/src
#----------------

read -p "Install soniah repos? (gosnmp, evaler)"
if [[ $REPLY =~ ^[Yy]$ ]] ; then
	# do 'git clone' not 'go get' so origin is writeable
	dir=github.com/soniah
	if ! [ -d $dir/evaler ] ; then
		mkdir -p $dir
		cd $dir
		git clone git@github.com:soniah/evaler.git
		cd -
	fi

	dir=github.com/soniah
	if ! [ -d $dir/gosnmp ] ; then
		mkdir -p $dir
		cd $dir
		git clone git@github.com:soniah/gosnmp.git
		cd -
	fi
fi
{{< /highlight >}}

A common pattern in Go (which my setup script demonstrates) is to [split your code from thirdparty code](http://code.google.com/p/go-wiki/wiki/GOPATH). This requires configuring your shell (~/.zshrc, ~/.bashrc):

{{< highlight shell >}}
export GOPATH=~/go/thirdparty:~/go/sonia
export PATH=${GOPATH//://bin:}/bin:$PATH
{{< /highlight >}}

Then you need to follow the [Terraform instructions](https://github.com/hashicorp/terraform) for building, that is:

{{< highlight shell >}}
$ cd ~/go/thirdparty/src
$ go get -u github.com/mitchellh/gox
$ cd ~/go/thirdparty/src/github.com/hashicorp/terraform
$ make updatedeps
$ make dev
# put the binaries somewhere in your path, eg /usr/local/bin
$ sudo cp bin/terraform* /usr/local/bin
{{< /highlight >}}
