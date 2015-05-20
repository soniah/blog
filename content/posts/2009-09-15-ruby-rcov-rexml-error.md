---
title: Ruby rcov rexml error
author: Sonia Hamilton
date: 2009-09-15
url: /2009/09/15/ruby-rcov-rexml-error/
categories:
  - Other-Tech
tags:
  - Ruby
---
Ruby&#8217;s rcov had a workaround for a breakage in the rexml library, but the workaround [broke][1]. This causes *no implicit conversion from nil to integer* on stderr. Quick solution:

<pre>rcov-0.8.1.2.0/lib/rcov/report.rb
-if RUBY_VERSION == "1.8.6" && defined? REXML::Formatters::Transitive
+if ( RUBY_VERSION == "1.8.6" || RUBY_VERSION == "1.8.7" ) && defined? REXML::Formatters::Transitive</pre>

Versions:

<pre>% cat /etc/issue.net
Ubuntu 9.04
% ruby --version
ruby 1.8.7 (2008-08-11 patchlevel 72) [i486-linux]
% gem list --local rcov
rcov (0.8.1.2.0)</pre>

 [1]: http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=517112
