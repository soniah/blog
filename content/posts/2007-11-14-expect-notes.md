---
title: expect notes
author: Sonia Hamilton
date: 2007-11-15
url: /2007/11/14/expect-notes/
categories:
  - Other-Tech
tags:
  - Expect
  - Perl
---
(draft)

[Expect Language][1], [Expect Book][2].

**Summary**

<!--more-->

  * set timeout x (in seconds)
  * spawn
  * expect
  * send

**Example of Using with Perl and [Expect.pm][3]**

`#!/usr/bin/perl -w<br />
use Expect;<br />
my %accounts = ('user' => 'secret' );<br />
foreach my $key (sort keys %accounts ) {<br />
my $password = $accounts{$key};<br />
my $exp = Expect->spawn('ssh root@host.foo.bar');<br />
$exp->expect(2,[ qr/mailer/i, sub {     my $self = shift; $self->send("adduser $keyn"); }] );<br />
$exp->send("passwd $keyn");<br />
$exp->expect(2, [ qr/password:/i, sub { my $self = shift; $self->send("$passwordn"); }] );<br />
$exp->expect(2, [ qr/password:/i, sub { my $self = shift; $self->send("$passwordn"); }] );<br />
$exp->expect(2, [ qr/bar/i ] ); $exp->hard_close();<br />
}<br />
`

**Actions &#8211; Pattern-Command Pairs**

Patterns can be directly associated with Commands &#8211; &#8220;Actions&#8221;.

`expect {<br />
eof {break}<br />
timeout {exit}<br />
"fred" {send "flintstoner"}<br />
"denied" {close}<br />
"\? " {interact +}<br />
}`

  * *interact* &#8211; returns the keyboard to the user &#8211; in the above example typing the + key then returns to expect
  * be aware of r vs n &#8211; use r with send, use rn when looking for an end-of-line in patterns
  * *eof* &#8211; spawned program exits
  * *timeout* &#8211; spawned program doesn&#8217;t respond within time
  * *default* = eof + timeout
  * *close* &#8211; close spawned program: do when you don&#8217;t want to wait for spawned program to eof and you want to do more in the script

 [1]: http://expect.nist.gov/
 [2]: http://
 [3]: http://search.cpan.org/~rgiersig/Expect-1.21/Expect.pod
