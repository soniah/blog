---
author: sonia
comments: true
date: 2008-04-01 01:04:19+00:00
slug: ubuntu-repositories-explained-security-etc
title: Ubuntu Repositories Explained - gutsy-security, gutsy-updates, etc
wordpress_id: 121
categories:
- Other-Tech
tags:
- Ubuntu
---

Copied verbatim from [Jeff Waugh's post](http://lists.slug.org.au/archives/slug/2008/03/msg00386.html) on [SLUG](http://lists.slug.org.au/listinfo/slug):

> But anything worthy of going into ${ubuntu_release}-updates is surely
> worth putting straight into ${ubuntu_release} ? Or is it just me?

Post-release, that archive is never touched. It means that users get to
choose how much damage they're willing to accept:

* release: Don't touch it, I like consistency, even with my bugs.

* release-security: I'll accept patches to existing versions (and very
  rare version upgrades if absolutely necessary) in the process of keeping
  my system secure.

* release-updates: Okay, some bugs are worth fixing, and I trust you this
  much (holds up two fingers like Maxwell Smart).

* release-backports: I have something akin to technology ADHD, needing
  the latest of everything I can possibly get, but I'm a sooky little
  wuss-fart because I can't handle running the development branch.

* devel: I can take it. Seriously. If you break my X, I shall become more
  powerful than you could possibly imagine. I'll file and maybe even fix
  the bugs and I'll do it even if power management is not so much 'managed'
  as vomited all over the wall. Come get some.

* debian: We do the work so you don't have to.
