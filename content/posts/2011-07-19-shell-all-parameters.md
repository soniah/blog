---
title: 'shell – all parameters – $* vs $@'
author: Sonia Hamilton
date: 2011-07-19
url: /2011/07/19/shell-all-parameters/
categories:
  - Linux
tags:
  - Shell
---
Both **$*** and **$@** expand to &#8220;all positional parameters&#8221;; in a nutshell -- **&#8220;$@&#8221;** is *often* desired as it handles spaces correctly; see man bash &#8220;Special Parameters&#8221;.

<!--more-->

<pre>% ls my*     
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
myfoo my foo myqux    &lt;-- probably not desired :-|

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
done</pre>
