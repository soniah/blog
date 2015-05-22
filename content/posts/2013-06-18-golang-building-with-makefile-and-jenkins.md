---
author: sonia
comments: true
date: 2013-06-18
url: /2013/06/18/golang-building-with-makefile-and-jenkins/
title: Golang - building with Makefile and Jenkins
wordpress_id: 1865
categories:
- Linux
tags:
- Golang
- Jenkins
- Make
---

I've recently been working on a large Go project, and one of the deliverables was that the project be buildable using Jenkins. I was unfamiliar with Jenkins, and there didn't seem to be any documentation around on how to build Go executables.


### Project Structure


First of all an aside on project structure. For my first project I had a **GOPATH** of **~/go** and the following directory structure:

    
    ~/go
      |--bin
      |--pkg
      |--src


But as I wrote more Go projects, it made more sense to separate each project into it's own directory structure:

    
    ~/go
      |--project1
        |--bin
        |--pkg
        |--src
      |--project2
        |--bin
        |--pkg
        |--src


With this directory structure I set **GOPATH** on the command line or in a Makefile:

[sourcecode lang="shell"]
% cd ~go/project2/src/github.com/soniah/gosnmp
% GOPATH=~go/project2 go build
[/sourcecode]


### Makefile


For smaller projects you can just produce a binary using **go run** or **go build**. But a Makefile will be needed for larger projects, as they will have other deliverables besides a binary - for example manpages or an operating system installer like a .deb for Ubuntu/Debian.

[sourcecode lang="shell"]
GOROOT := /usr/lib/go
GOPATH := /var/lib/jenkins/workspace/go/project2

myhostname := $(shell hostname)
ifeq (${myhostname}, laptop)
    GOPATH := /home/sonia/go/project2
else ifeq (${myhostname}, testmachine)
    GOPATH := /home/u1234/go/project2
    GOROOT := /usr/local/go
endif

build: build-stamp
build-stamp: file1.go file2.go file3.go
    # always format code
    GOPATH=$(GOPATH) go fmt $^
    # binary
    GOPATH=$(GOPATH) go build -o project2 -v $^
    # docs
    markdown README.mkd > README.html
    help2man --no-info --include=help2man.roff --name "Project2" ./project2 > project2.roff
    man -Tps -l project2.roff > project2-man.ps
    ps2pdf project2-man.ps project2-man.pdf
    # mark as done
    touch $@
[/sourcecode]


### Jenkins


With a working Makefile, building under Jenkins will now be easier. The objective is to have Jenkins automatically build a new binary/package whenever a developer pushes to one of the git/mercurial/bzr repos that makeup the various components of your project.

However if your project contains multiple components, you'll soon come across a problem. For example Project2 was using **github.com/droundy/goopt** and **github.com/mattn/go-sqlite3**. To see the problem, create a New Job using **Build a free-style software project**. Under **Source Code Management**, choose something like **Git**. Under the second Advanced button, you'll need to change the option **Local subdirectory for repo (optional)** to point to the path of a component's repo. **But** this setting is a global setting for all git repos - so the build won't work as you add a second and third component.

The solution is to install to Jenkins the [Multiple SCMs Plugin](http://wiki.jenkins-ci.org/display/JENKINS/Multiple+SCMs+Plugin). Then in your Jenkins Job you'll be able to set the local subdirectory for each component. For example in Project2:



	
  * the **goopt** local subdirectory was set to **project2/src/github.com/droundy/goopt**

	
  * the **go-sqlite3** local subdirectory was set to **project2/src/github.com/mattn/go-sqlite3**




### Other Jenkins  Settings


Here are some other useful setting for building Go projects on Jenkins:



	
  * if you're building 32 and 64 bit binaries (on different build servers), use the setting **Restrict where this project can be run** with something like "32bit&&precise&&ubuntu"

	
  * separate out your Go code from other languages - **Advanced Project Options**, **Use custom workspace**, "/var/lib/jenkins/workspace/go"


