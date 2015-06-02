---
title: Numbering lines in a file
author: Sonia Hamilton
date: 2010-10-25
url: /2010/10/25/numbering-lines-in-a-file/
categories:
  - Other-Tech
tags:
  - Sed
---
Note to brain: line numbering in a file can be done using **nl** -- easier than using sed&#8230;

<!--more-->

<pre>% nl -p -n rz /tmp/foo.txt &gt; /tmp/bar.txt
</pre>

  * -p Specify that line numbering should not be restarted at logical page delimiters
  * -n format Specify the line numbering output format.
