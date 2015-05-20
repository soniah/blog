---
author: sonia
comments: true
date: 2009-09-15 08:30:23+00:00
slug: ruby-rcov-rexml-error
title: 'Ruby rcov rexml error '
wordpress_id: 543
categories:
- Other-Tech
tags:
- Ruby
---

Ruby's rcov had a workaround for a breakage in the rexml library, but the workaround [broke](http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=517112). This causes _no implicit conversion from nil to integer_ on stderr. Quick solution:

    
    rcov-0.8.1.2.0/lib/rcov/report.rb
    -if RUBY_VERSION == "1.8.6" && defined? REXML::Formatters::Transitive
    +if ( RUBY_VERSION == "1.8.6" || RUBY_VERSION == "1.8.7" ) && defined? REXML::Formatters::Transitive


Versions:

    
    % cat /etc/issue.net
    Ubuntu 9.04
    % ruby --version
    ruby 1.8.7 (2008-08-11 patchlevel 72) [i486-linux]
    % gem list --local rcov
    rcov (0.8.1.2.0)
