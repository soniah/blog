---
author: sonia
comments: true
date: 2010-10-08 02:16:51+00:00
slug: a-script-for-loop-mounting-iso-files
title: A script for loop mounting .iso files
wordpress_id: 753
categories:
- Linux
tags:
- iso
---

Every time I go to loop mount an iso file, it's long enough since I last did it that I have to "re-google".

Hence, a quick little script. No rocket science...

    
    % cat isomount
    #!/bin/bash
    
    if [ $# -eq 0 -o $# -gt 2 ] ; then
     echo "Usage: isomount foo.iso mountdir [defaults to /mnt]"
     exit 1
    fi
    
    target=${2:-/mnt}
    
    if grep -q "$target.*iso9660" `mount` ; then
     echo "$target already mounted - unmounting"
     sudo umount "$target"
    fi
    
    sudo mount -o loop -t iso9660 $1 "$target"
