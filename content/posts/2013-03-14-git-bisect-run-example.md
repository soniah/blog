---
author: sonia
comments: true
date: 2013-03-14 23:55:06+00:00
slug: git-bisect-run-example
title: git bisect run - example
wordpress_id: 1814
categories:
- Linux
tags:
- Git
- Golang
---

[Git bisect](http://www.kernel.org/pub/software/scm/git/docs/git-bisect.html) is a great tool for finding bugs in a program. But many examples show manual uses of git bisect - here's an example of automating the process using **git bisect run**.



## tl;dr



Using **git bisect run** is easy if you've make small atomic commits and you have good tests. **run** makes a large debug easier (compared to manually doing **git bisect good** and **git bisect bad**) - you're less likely to make errors due to boredom. And run means you can use an iterative process - use rebase to split bad commits then just run again.



## Example



So I had an elusive bug in a long running process (an snmp poller, calculator and aggregator for a large network). I had a point where the program was **good**, but I'd added more features since good and now results were **bad**. The first step was to write a shell script to be called from **git bisect run**:

[sourcecode language="shell"]
% cat bisect.sh
#!/bin/bash
# copy this to ~ before running with `git bisect run ~/bisect.sh`

cp ~/Makefile .
make clean

# make modifies manpage output, so stash after build
if make &> /dev/null ; then
	git stash
	git stash clear
else
	git stash
	git stash clear
	exit 125
fi

sudo cat /var/tmp/empty > /var/log/abc/abc-poller.log
sudo ./abc-poller --tmp --once -d 2 -c 150 || exit 125
echo "=== poller finished"

percent=`godir=/var/tmp/data/abcmon/poll_queue/new ~/checker | \
  tail -1 | awk '{print $5}' | awk -F. '{print $1}'`
echo "=== percent is $percent"
(( percent < 5 ))
[/sourcecode]

Things that make writing the test script easier:



	
  * first get it working outside of **git bisect run** - usually means echoing results along the way

	
  * already having a test suite that produces a quantified pass/fail output, In my case the I had already written the checker program, whose last line of output contained a "percentage failure" figure



Next step was having an abbreviated log of commits to refer to:

[sourcecode language="shell"]
% git log --oneline
f00f232 sql.go - better debugging       # bad                                                                                                                                                        
9780d44 dummy .gitignore, so out dir preserved
0de0796 Makefile for nsch1abcs01
a2f6c96 defaults - 20 workers, udp 15
b8ee3d9 GOMAXPROCS()
04f21ba start v0.0.2
dbc6a60 Makefile: Jenkins as default for env vars
557a5e3 more work on stats
ef6a453 remove excessive debugging
ccc4644 remove file buffering - wasn't writing..???
98bf4b1 stats write failing
9a9682d move type queue_t struct
467aeed buffered writes for queue file
148a8cc stats: + device_run, device_ok
c61be42 done chan *Stats_t; calculate_value() bool
0e41461 debugging - print out device_id as %5s
7cbe167 default workers 5000, correct stop/start commands
544e8d7 gather statistics
6990cf2 rename data chan to device_id
5e8562b rename sql -> sqlconn; global var
fd52d89 remove dead code
4d7b9b1 device_for() - err if count != 1
6ceb305 deb: fail if version main.go isn't same changelog
5ce1855 deb: rules producing abc-poller_0.0.1_amd64.deb
db5bff4 deb: cleaned up Makefile, roffs
76674c2 JSON -> SQL; version 0.0.1
4cf198e deb: basic removal of 64 references
d980f26 deb: rename 64 to vanilla
b933570 deb: remove 32 bit stuff
970bd82 current debug level is 2; adjust output
70f8921 Revert "deb build - don't init, cron while testing"
855ce00 default debug is 2; misc tidy
f3d80e1 remove timeoutOpt - no longer used
48ced38 misc tidys before release
a3fe13c runonceOpt, revert cycling code  # good
24cd998 use passed in udpOpt
5ca1830 remove stash/sender.old.go
06b9566 remove gsnmpgo; use gosnmp
bffd430 rules: add note about "too many open files"
[/sourcecode]

Mark bad and good, start the run, go and have a coffee :-)

[sourcecode language="shell"]
% git bisect start f00f232 a3fe13c
% git bisect run ~/bisect.sh
# lots of output
[/sourcecode]

I get the result that the ominously named **557a5e3 more work on stats** is the first bad commit - I remember it as one of those large "kitchen sink" commits done at the end of the day. So "first rule of fightclub git" remembered - **always do small atomic commits**.

I have a useful shell function **gri()** - I used that to interactively rebase and break up 557a5e3 into many small commits:

[sourcecode language="shell"]
gri () {
  git rebase -i HEAD~${1:-7}
}
[/sourcecode]

After rebasing git log looked like this - notice the many small commits named "bisect1" etc:

[sourcecode language="shell"]
382b3ee defaults - 20 workers, udp 15
11db314 GOMAXPROCS()
4b547ea start v0.0.2
c92feef Makefile: Jenkins as default for env vars
8fcc595 bisect6: calc/noncalc
ad3a18f bisect5: tweak debug msgs
311bb8d bisect4: mv stats init
957c234 bisect3: remove stats from send_gosnmp()
3c01d62 bisect2: use Add(); Calcs/NonCalcs
947cb27 bisect1: move Stats_t; Add()
ef6a453 remove excessive debugging
ccc4644 remove file buffering - wasn't writing..???
98bf4b1 stats write failing
[/sourcecode]

And here's the real win of writing bisect.sh - you can just keep rebasing and running until you've narrowed down the bad code to a few lines:

[sourcecode language="shell"]
=== poller finished
=== percent is 49
947cb27fd57642dc545ee23090d7ae8fd8b14b3f is the first bad commit
commit 947cb27fd57642dc545ee23090d7ae8fd8b14b3f
Author: Sonia Hamilton <sonia@snowfrog.net>
Date:   Thu Mar 14 10:02:42 2013 +1100

    bisect1: move Stats_t; Add()
[/sourcecode]

I do another interactive rebase, fix the logic error, and then HEAD is good.

