---
title: netapp – disabling and deleting snapshots
author: Sonia Hamilton
date: 2009-07-16
url: /2009/07/16/netapp-disabling-and-deleting-snapshots/
categories:
  - Other-Tech
tags:
  - storage
---
Netapp volumes by default are created with snapshots turned on; if the volume is being used for backups (for example), the snapshots just use up space.

<!--more-->

Here&#8217;s how to delete them:

<pre>df vm_dev                     # see space usage for vm_dev volume
snap sched vm_dev             # see the current snapshot schedule
snap sched vm_dev 0 0 0       # zero out the current schedule
vol options vm_dev nosnap on  # disable snapshots (not required, but "belts and braces")
snap delete -a vm_dev         # delete all old snapshots</pre>

On a multi terabyte volume, the actual deletion can take a while -- don&#8217;t expect the space to return immediately&#8230;

See Netapp&#8217;s &#8220;Data Protection Online Backup and Recovery Guide&#8221; for more details.
