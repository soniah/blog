---
title: 'apt & Translation-en_AU'
author: Sonia Hamilton
date: 2007-02-23
url: /2007/02/22/apt-translation-en_au/
categories:
  - Linux
tags:
  - Ubuntu
---
On Ubuntu Edgy I notice that when I do an &#8216;apt-get update' I get  
messages like this:

<!--more-->

<pre>Get:1 <a href="http://au.archive.ubuntu.com">http://au.archive.ubuntu.com</a> edgy Release.gpg <a href="?q=wiki/goto/191B">191B</a>
 Ign <a href="http://au.archive.ubuntu.com">http://au.archive.ubuntu.com</a> edgy/main Translation-en_AU
 ^^^                                        ^^^^^^^^^^^^^^^^^

</pre>

Solution is to unset language before doing updates: 

<pre>$ unset LANG LANGUAGE
 $ sudo apt-get update
</pre>

Thanks to Michael Fox, SLUG list, 13 Jan 07.
