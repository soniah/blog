---
author: sonia
comments: true
date: 2007-11-15 01:16:23+00:00
slug: expect-notes
title: expect notes
wordpress_id: 100
categories:
- Other-Tech
tags:
- Expect
- Perl
---

(draft)

[Expect Language](http://expect.nist.gov/), [Expect Book](http://).

**Summary**



	
  * set timeout x (in seconds)

	
  * spawn

	
  * expect

	
  * send


<!-- more -->**Example of Using with Perl and [Expect.pm](http://search.cpan.org/~rgiersig/Expect-1.21/Expect.pod)**

`#!/usr/bin/perl -w
use Expect;
my %accounts = ('user' => 'secret' );
foreach my $key (sort keys %accounts ) {
my $password = $accounts{$key};
my $exp = Expect->spawn('ssh root@host.foo.bar');
$exp->expect(2,[ qr/mailer/i, sub {     my $self = shift; $self->send("adduser $keyn"); }] );
$exp->send("passwd $keyn");
$exp->expect(2, [ qr/password:/i, sub { my $self = shift; $self->send("$passwordn"); }] );
$exp->expect(2, [ qr/password:/i, sub { my $self = shift; $self->send("$passwordn"); }] );
$exp->expect(2, [ qr/bar/i ] ); $exp->hard_close();
}
`

**Actions - Pattern-Command Pairs**

Patterns can be directly associated with Commands - "Actions".

`expect {
eof {break}
timeout {exit}
"fred" {send "flintstoner"}
"denied" {close}
"\? " {interact +}
}`



	
  * _interact_ - returns the keyboard to the user - in the above example typing the + key then returns to expect

	
  * be aware of r vs n - use r with send, use rn when looking for an end-of-line in patterns

	
  * _eof_ - spawned program exits

	
  * _timeout_ - spawned program doesn't respond within time

	
  * _default_ = eof + timeout

	
  * _close_ - close spawned program: do when you don't want to wait for spawned program to eof and you want to do more in the script


