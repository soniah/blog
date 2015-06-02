---
title: Ubuntu and Toshiba Satellite Pro L300 fan
author: Sonia Hamilton
date: 2009-08-07
url: /2009/08/07/ubuntu-and-toshiba-satellite-pro-l300-fan/
categories:
  - Linux
tags:
  - Ubuntu
---
I recently bought a new laptop -- a *bottom* of the range Toshiba Satellite Pro L300 costing $780 (extra RAM pushed the price up).

<!--more-->

I used to buy high-end laptops but my thinking was changed when my latest one got stolen and I started using an old one I'd (literally) dredged out of a rubbish bin. I mostly use shell/vi/ssh, Thunderbird and Firefox, don't carry my laptop around with me, and all my stuff is backed up across multiple machines using git, so why shell out the big bucks?

So far I'm liking the Satellite Pro. Ubuntu 9.04 installed without a hitch, sound and wireless worked straight out of the box, the keyboard has a nice feel to it and all the keys are in the proper places (unlike Dell laptops that seem to scatter them all over the place).

Only problem was the fan. The poor little cpu is a bit underpowered so the cpu load average continually sits on or above 1, and the fan was going mental. A quick [search on Google][1] found the solution: in **/boot/grub/menu.lst** change defoptions to

<pre># defoptions=acpi_osi="Linux"</pre>

run **sudo update-grub**, reboot.

### Update for Grub2 (Nov/13)

Edit **/etc/default/grub**, change this setting:

<pre>GRUB_CMDLINE_LINUX_DEFAULT="acpi_osi=Linux"</pre>

Then update and reboot:

<pre>sudo update-grub
sudo reboot</pre>

 [1]: http://www.google.com.au/search?hl=en&client=firefox-a&rls=com.ubuntu%3Aen-US%3Aunofficial&hs=HTI&q=ubuntu+Toshiba+satellite+pro+L300+cpu+fan&btnG=Search&meta=
