---
author: sonia
comments: true
date: 2010-07-20 07:17:38+00:00
slug: exiting-from-consoles-attached-to-solaris-zones
title: Exiting from consoles attached to Solaris zones
wordpress_id: 706
categories:
- Other-Tech
tags:
- Solaris
---

(More of a "note-to-brain" than a "how-to").

When creating a new Solaris zone, one of the steps involves connecting to the zone's console for the initial configuration:

    
    # zlogin -C examplezone
    


The zone then runs through the **sys-unconfig** script, asking questions about hostname, timezone, etc. When this is finished, the doco says to exit from the console using the "~." combination. But of course ssh grabs the "~" escape character and kills the entire ssh connection - aargghhh... Solution: different escape characters for the different ssh connections:

    
    % ssh windows -e @                       # jump host for Cisco vpn, @ escape character
    % ssh shamilton@1.2.3.4 -p 8022 -e %     # connect to HP-NA, % escape character
    NA>connect ts01                          # connect to terminal server
    ts01#telnet fubar.com                    # connect to console of target server - finally
    do stuff, then ~.                        # do stuff, then ~ escape character to exit zone console, to global zone
    


See also:



	
  * [Cisco - Configuring a Terminal/Comm Server](http://cisco.biz/en/US/tech/tk801/tk36/technologies_configuration_example09186a008014f8e7.shtml)

	
  * [informIT - Configuring a Terminal Server](http://www.informit.com/library/content.aspx?b=CCNP_Studies_Troubleshooting&seqNum=141) - especially the stuff about clearing lines (in addition to clearing sessions)


