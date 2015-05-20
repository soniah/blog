---
author: sonia
comments: true
date: 2007-02-23 02:34:19+00:00
slug: apt-translation-en_au
title: apt & Translation-en_AU
wordpress_id: 52
categories:
- Linux
tags:
- Ubuntu
---

On Ubuntu Edgy I notice that when I do an 'apt-get update' I get
messages like this:


    
    
     Get:1 <a href="http://au.archive.ubuntu.com">http://au.archive.ubuntu.com</a> edgy Release.gpg <a href="?q=wiki/goto/191B">191B</a>
     Ign <a href="http://au.archive.ubuntu.com">http://au.archive.ubuntu.com</a> edgy/main Translation-en_AU
     ^^^                                        ^^^^^^^^^^^^^^^^^
    
    





Solution is to unset language before doing updates:




    
    
     $ unset LANG LANGUAGE
     $ sudo apt-get update
    





Thanks to Michael Fox, SLUG list, 13 Jan 07.

