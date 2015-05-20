---
author: sonia
comments: true
date: 2012-08-03 05:26:57+00:00
slug: perl-debug-fork-with-no-x
title: Perl - debug fork() with no X
wordpress_id: 1657
categories:
- Linux
tags:
- Perl
---

Here's how to debug a Perl program that's running remotely on a server that doesn't have X. It's pretty simple, these are just notes for me...

You've ssh'd into a remote server (headless), to debug a perl script that forks:

[sourcecode language="perl"]
$SIG{CHLD} = sub {
  while (1) {
    my $nino = waitpid(-1, WNOHANG);
    last if $nino <= 0;
    if ($?) {
      &log("ERROR: Child process $nino exited with $?");
    }
    $children--;
  }

# let's fork!
my $pid = fork();
if (not defined $pid) {
  &log("ERROR: fork(): resources not available");
}
elsif ($pid > 0) {
  # parent
  $children++;
  next;
}
else {
  # child
  $SIG{CHLD} = $SIG{TERM} = $SIG{INT} = 'DEFAULT';
  do_stuff($arg1, $arg2);
  exit;
}
[/sourcecode]

But when you start debugging, you get output like this (which tells you what to do):

[sourcecode language="perl"]
######### Forked, but do not know how to create a new TTY. #########
  Since two debuggers fight for the same TTY, input is severely entangled.

  I know how to switch the output to a different window in xterms, OS/2
  consoles, and Mac OS X Terminal.app only.  For a manual switch, put the name
  of the created TTY in $DB::fork_TTY, or define a function
  DB::get_fork_TTY() returning this.

  On UNIX-like systems one can get the name of a TTY for the given window
  by typing tty, and disconnect the shell from TTY by sleep 1000000.
[/sourcecode]

The easiest solution is to install a minimal X on the target server, then reconnect via ssh, check your DISPLAY variable, then start up the debugger in xterm.

[sourcecode language="bash"]
server% sudo aptitude install xinit xterm

client% ssh -X server                # reconnect, to setup DISPLAY

server% env | grep -i disp
DISPLAY=localhost:11.0               # DISPLAY is good

server% xterm &                      # an xterm should display locally

server% perl -d foo.pl               # start debugging
[/sourcecode]

After forking, one or more additional xterms will display for each child, allowing you to debug.


