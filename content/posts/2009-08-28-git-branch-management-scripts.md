---
title: git branch management scripts
author: Sonia Hamilton
date: 2009-08-27
url: /2009/08/28/git-branch-management-scripts/
categories:
  - Other-Tech
tags:
  - Git
---
A couple of scripts I (very) quickly wrote for managing git branches, so I don&#8217;t have to keep reading[ git cheat][1].

<!--more-->

No error checking or intelligence in the scripts -- YMMV.

Delete a tracking branch both locally and remotely:

<pre>% cat gitkillbranch
#!/bin/bash

asksure() {
echo -n "Are you sure (Y/N)? "
while read -r -n 1 -s answer; do
 if [[ $answer = [YyNn] ]]; then
 [[ $answer = [Yy] ]] && retval=0
 [[ $answer = [Nn] ]] && retval=1
 break
 fi
done
echo
return $retval
}

echo
echo "*********************************************************"
echo "This will delete the branch $1 both locally and remotely."
echo "*********************************************************"
echo

if asksure; then
 echo "sure"
 git br -d $1
 git br -r -d origin/${1}
 git push origin :${1}
else
 echo "Not deleting"
fi</pre>

Track all remote branches locally:

<pre>% cat gittrackall
#!/usr/bin/ruby

result = `git br -r`
result.each do |line|
 line.chomp!
 branch = line.split('/')[1]
 next if branch =~ /HEAD|master/
 puts branch
 `git branch --track #{branch} origin/#{branch}`
end</pre>

 [1]: http://cheat.errtheblog.com/s/git
