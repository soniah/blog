---
title: Exiting from consoles attached to Solaris zones
author: Sonia Hamilton
date: 2010-07-20
url: /2010/07/20/exiting-from-consoles-attached-to-solaris-zones/
jabber_published:
  - 1279610258
categories:
  - Other-Tech
tags:
  - Solaris
---
(More of a &#8220;note-to-brain&#8221; than a &#8220;how-to&#8221;).

When creating a new Solaris zone, one of the steps involves connecting to the zone&#8217;s console for the initial configuration:

<pre># zlogin -C examplezone
</pre>

The zone then runs through the **sys-unconfig** script, asking questions about hostname, timezone, etc. When this is finished, the doco says to exit from the console using the &#8220;~.&#8221; combination. But of course ssh grabs the &#8220;~&#8221; escape character and kills the entire ssh connection &#8211; aargghhh&#8230; Solution: different escape characters for the different ssh connections:

<pre>% ssh windows -e @                       # jump host for Cisco vpn, @ escape character
% ssh shamilton@1.2.3.4 -p 8022 -e %     # connect to HP-NA, % escape character
NA&gt;connect ts01                          # connect to terminal server
ts01#telnet fubar.com                    # connect to console of target server - finally
do stuff, then ~.                        # do stuff, then ~ escape character to exit zone console, to global zone
</pre>

See also:

  * [Cisco &#8211; Configuring a Terminal/Comm Server][1]
  * [informIT &#8211; Configuring a Terminal Server][2] &#8211; especially the stuff about clearing lines (in addition to clearing sessions)

 [1]: http://cisco.biz/en/US/tech/tk801/tk36/technologies_configuration_example09186a008014f8e7.shtml
 [2]: http://www.informit.com/library/content.aspx?b=CCNP_Studies_Troubleshooting&seqNum=141
