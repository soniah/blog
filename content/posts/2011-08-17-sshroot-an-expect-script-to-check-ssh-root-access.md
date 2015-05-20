---
author: sonia
comments: true
date: 2011-08-17 07:04:43+00:00
published: false
slug: sshroot-an-expect-script-to-check-ssh-root-access
title: sshroot - an expect script to check ssh root access
wordpress_id: 1134
categories:
- Linux
tags:
- Expect
- Ssh
---

Sometimes I want to be able to check from as script if I can ssh to a host at root. However if I can't, my script will hang asking for the root's password - catch22!

Here's a quick little expect <del>hack</del> script that checks - it returns true (0) or (1) false.

    
    #!/usr/bin/expect
    set controlC 03
    set controlD 04
    eval spawn ssh -l root $argv
    set timeout 3
    expect {
        "*?assword:" {
            send -- "$controlC"
            exit 1
        }
        timeout {
            send -- "$controlD"
            exit 0
        }
    }
