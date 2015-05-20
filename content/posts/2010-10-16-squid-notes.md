---
title: Squid Notes
author: Sonia Hamilton
date: 2010-10-16
url: /2010/10/16/squid-notes/
jabber_published:
  - 1287233278
categories:
  - Other-Tech
tags:
  - Squid
---
*Some quick Squid notes, from O&#8217;Reilly&#8217;s &#8220;[Squid The Definitive Guide][1]&#8220;***  
**

**Debugging**

<pre># check config file changes:
% squid -k parse

# load conf file changes:
% squid -k reconfigure

# start in foreground, display debug info:
% squid -N -d1  -&gt; look for "Ready to serve requests" message</pre>

Edit your squid.conf file and set the debug_options line to this:

<pre>debug_options ALL,1 33,2</pre>

Now, Squid writes a message to **cache.log** for each client request and another for each reply. The messages contain the request method, URI, whether the request/reply is allowed or denied, and the name of the last ACL that matched it.

**Rule order &#8211; AND vs OR**

  * ACL elements are OR&#8217;d together  ie \*any\* success causes success eg

<pre>acl FOO src 1.2.3.4 5.6.7.8</pre>

  * access rules are AND&#8217;d together ie \*any\* failure causes failure eg

<pre>http_access allow FOO BAR BAZ</pre>

*Or, as O&#8217;Reilly explains:*

Recall that Squid uses OR logic when searching ACL elements. Any single value in an acl can cause a match.  It&#8217;s the opposite for access rules, however. For http_access and the other rule sets, Squid uses AND logic. Consider this generic example:

<pre>access_list allow ACL1 ACL2 ACL3</pre>

For this rule to be a match, the request must match each of ACL1, ACL2, and ACL3.  If any of those ACLs don&#8217;t match the request, Squid stops searching this rule and proceeds to the next.

**dstdomain vs dst**

<span style="text-decoration:underline;">dstdomain .foo.com</span> will match <span style="text-decoration:underline;">http://foo.com</span> AND <span style="text-decoration:underline;">http://whatever.foo.com</span>

It&#8217;s generally better to use **dstdomain** rather than **dst** in ACL&#8217;s:

  * normally users request by domain name not ip address, and unless there is an entry in Squid&#8217;s ip cache, specifying dst will cause delays from dns lookups.
  * target domains can change their ip address, requiring updating the config file
  * *nota bene:* an entry of **dst foo.com** will actually get cached as an ip address
  * however if the intention is to block access to URLs, users can bypass by requesting the ip directly (http://1.2.3.4/pr0n), unless TODO

 [1]: http://squidbook.org/
