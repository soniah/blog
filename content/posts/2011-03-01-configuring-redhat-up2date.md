---
title: Configuring RedHat up2date
author: Sonia Hamilton
date: 2011-03-01
url: /2011/03/01/configuring-redhat-up2date/
jabber_published:
  - 1298943129
categories:
  - Linux
---
A nice little [snippet ][1]I came across yesterday on configuring RedHat up2date.

The controlling configuration file is **/etc/sysconfig/rhn/sources** . Handy in a firewalled environment (aren&#8217;t they all?) and/or an an environment with poor infrastructure. It also mentions the (standard) disabling of the rhn plugin via **/etc/yum/pluginconf.d/rhnplugin.conf**.

[Original post][1]:

<!--more-->

<pre>A key point you left out that would be a problem for RHEL5:

"Disable the RHN repo by changing enabled to 0 in
/etc/yum/pluginconf.d/rhnplugin.conf"

If your server has access to RHN, there may be some need to disable it
for the up2date, too...

Kevin

-----Original Message-----
From: nahant-list-bounces redhat com
[mailto:nahant-list-bounces redhat com] On Behalf Of Jon Fraley
Sent: Tuesday, January 06, 2009 12:26 PM
To: Red Hat Enterprise Linux 4 (Nahant) Discussion List
Subject: Re: How to upgrade from RHEL 4 update 3 to RHEL 4 update 6

Download the iso images for the update you want,  mount them and copy
all the rpm's to a specific directory.  Edit /etc/sysconfig/rhn/sources
comment out the line

#up2date default

and change this line to point to your rpm's

#dir my-favorite-rpms /var/spool/RPMS/
dir my-favorite-rpms /my/copied/rpms

save the file and now run up2date

This has worked for us.  There was a knowledgebase article for rhel4 but
now it is for rhel5

http://kbase.redhat.com/faq/docs/DOC-9733</pre>

 [1]: http://www.redhat.com/archives/nahant-list/2009-January/msg00026.html
