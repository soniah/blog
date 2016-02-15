---
author: sonia
draft: true
date: 2016-02-15
url: /2016/02/15/a-small-m4-recipe/
title: A Small m4 Recipe
categories:
- Linux
tags:
- Linux
- m4
- Ruby
---

"They" say that [Linux m4 is a useful
tool](https://en.wikipedia.org/wiki/M4_%28computer_language%29) but
I've never had the time to get my head around it. This is a small recipe.

<!--more-->

I find `m4` difficult because the examples are more complex than what I
need, therefore I never use it, therefore I never get better at it.
Here's a starter example, which could've been done with any number of
other tools (`sed`, `perl`, etc). But why `m4`?  Because it does the
job and no installation is required on (locked down) Linux servers.

This snippet dynamically generates an ssh config file (with
`ProxyCommand`):

~~~
divert(-1)dnl
define(`SLAVEX',slavex)
define(`USERX',userx)
define(`MASTERX',masterx)
divert(0)dnl
StrictHostKeyChecking no
Host SLAVEX
  ProxyCommand ssh -W %h:%p USERX@MASTERX
~~~

In `ruby` use it like this:

{{< highlight ruby >}}
m4cmd = "m4 -Dslavex=#{row[:ip]} -Duserx=#{row[:jump_user]}
  -Dmasterx=#{row[:jump_ip]} ssh_config.m4 > ../ssh_config.toll"
`#{m4cmd}`
{{< /highlight >}}

I use variables like `userx` so they don't accidently get **rescanned** by `m4`:

*m4 copies its input (from files or standard input) to standard output.
It checks each token (a name, a quoted string, or any single character
that’s not a part of either a name or a string) to see if it’s the name
of a macro. If so, the token is replaced by the macro’s value, and then
that text is pushed back onto the input to be rescanned. (**If you’re new
to m4, this repeated scanning may surprise you**, but it’s one key to m4's
power.)*
