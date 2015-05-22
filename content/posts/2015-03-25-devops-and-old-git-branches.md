---
author: sonia
comments: true
date: 2015-03-25
url: /2015/03/25/devops-and-old-git-branches/
title: Devops and Old Git Branches
wordpress_id: 2057
categories:
- Linux
tags:
- Git
---

A guest blog post I wrote on managing git branches when doing devops.

When doing Devops we all know that using source code control is a “good thing” — indeed it would be hard to imagine doing Devops without it. But if you’re using [Puppet and R10K](http://garylarizza.com/blog/2014/08/31/r10k-plus-directory-environments/) for your configuration management you can end up having hundreds of old branches lying around — branches like **XYZ-123**, **XYZ-123.fixed**, **XYZ-123.fixed.old** and so on. Which branches to cleanup, which to keep? How to easily cleanup the old branches? This article demonstrates some git configurations and scripts  that make working with hundreds of git branches easier...

Go to [Devops and Old Git Branches](http://www.icesystems.com.au/devops-and-old-git-branches/) to read the full article.
