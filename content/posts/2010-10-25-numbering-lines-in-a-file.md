---
author: sonia
comments: true
date: 2010-10-25 00:48:30+00:00
slug: numbering-lines-in-a-file
title: Numbering lines in a file
wordpress_id: 765
categories:
- Other-Tech
tags:
- Sed
---

Note to brain: line numbering in a file can be done using **nl** - easier than using sed...

    
    % nl -p -n rz /tmp/foo.txt > /tmp/bar.txt
    





	
  * -p    Specify that line numbering should not be restarted at logical page delimiters

	
  * -n format    Specify the line numbering output format.


