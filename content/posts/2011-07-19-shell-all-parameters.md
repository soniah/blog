---
author: sonia
comments: true
date: 2011-07-19 06:08:45+00:00
slug: shell-all-parameters
title: shell - all parameters - $* vs $@
wordpress_id: 1097
categories:
- Linux
tags:
- Shell
---

Both **$*** and **$@** expand to "all positional parameters"; in a nutshell - **"$@"** is _often_ desired as it handles spaces correctly; see man bash "Special Parameters".

    
    % ls my*     
    myfoo  my foo  myqux
    
    ----------------
    
    % ./star_test my*
    $*
    myfoo
    my     :-(
    foo    :-(
    myqux
    
    $@
    myfoo
    my     :-(
    foo    :-(
    myqux
    
    "$*"
    myfoo my foo myqux    <-- probably not desired :-|
    
    "$@"
    myfoo
    my foo  :-)
    myqux
    
    ----------------
    
    % cat star_test
    #!/bin/bash
    echo '$*'
    ./pargs $*
    echo
    
    echo '$@'
    ./pargs $@
    echo
    
    echo '"$*"'
    ./pargs "$*"
    echo
    
    echo '"$@"'
    ./pargs "$@"
    
    ----------------
    
    % cat pargs
    #!/bin/bash
    for i ; do
        echo $i
    done
