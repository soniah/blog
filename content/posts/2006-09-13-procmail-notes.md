---
title: procmail notes
author: Sonia Hamilton
date: 2006-09-14
url: /2006/09/13/procmail-notes/
categories:
  - Linux
tags:
  - Procmail
---
procmail notes
<!--more-->

### Good procmail sites

  * [Timo&#8217;s procmail tips][1]
  * [ii.com -- procmail quickstart][2]
  * [procmail tips][3]
  * [Halcyon guide][4]
  * [Partmaps procmail FAQ][5]
  * [Stimpy&#8217;s formail tutorial][6]

### Procmail commands can consist of&#8230;

  * a statement

<pre>FOO=`formail ... | sed ...`</pre>

  * a recipe

### A recipe consists of three parts&#8230;

  * a colon line
  * zero or more condition lines
  * an action section

<pre>:0
 email_folder/</pre>

<pre>:0
 * From: ...
 email_folder/</pre>

### An action is one of&#8230;

  * a folder

<pre>email_folder
 email_folder/</pre>

  * a forward

<pre>!foo@bar</pre>

  * a pipe (with **:0 fwh** or **:0 fwb** colon flags)

<pre>| formail -I ...</pre>

  * a curly brace

<pre>{</pre>

### Curly Braces

A curly brace starts a nesting block ie a recipe can be:

  * a colon line, zero or more conditions, and curly brackets

<pre>:0
 {
     ...
 }</pre>

<pre>:0
 * From: ...
 {
     ...
 }</pre>

Inside curly brackets there must be one or more recipes.

### How to do if-else

*Do if-else using the E colon line flag*

<pre>:0
 {
     :0
     * ^From: ...
     # deliver to default destination (inbox)
     ${DEFAULT}
 }
 :0E
 {
     # else
     ...
 }</pre>

 [1]: http://lipas.uwasa.fi/~ts/info/proctips.html
 [2]: http://www.ii.com/internet/robots/procmail/qs/
 [3]: http://pm-doc.sourceforge.net/pm-tips.html
 [4]: http://www.inwa.net/~m3047/procmail/procmail-guide.html
 [5]: http://partmaps.org/era/procmail/mini-faq.html
 [6]: http://www.stimpy.net/procmail/tutorial/formail.html
