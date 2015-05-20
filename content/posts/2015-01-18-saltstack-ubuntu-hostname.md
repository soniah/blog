---
author: sonia
comments: true
date: 2015-01-18 11:56:03+00:00
slug: saltstack-ubuntu-hostname
title: SaltStack Ubuntu Hostname
wordpress_id: 2048
categories:
- Linux
tags:
- SaltStack
- Ubuntu
---

[SaltStack](http://docs.saltstack.com/en/latest/ref/states/all/salt.states.network.html) currently doesn't set the hostname correctly on Debian/Ubuntu. For example, this won't work:

[sourcecode lang="text"]
system:
    network.system:
      - enabled: True
      - hostname: server1.example.com
[/sourcecode]

Here's a little shell script I wrote, to get around this problem:

[sourcecode lang="shell"]
% cat set_hostname.sh 
#!/bin/bash

hn=$1
hostname $hn
echo $hn > /etc/hostname
sed -i "1s/.*/127.0.0.1 localhost $hn/" /etc/hosts
[/sourcecode]

Then apply it using cmd.script, for example:

[sourcecode lang="text"]
foo-hostname:
  cmd.script:
    - source: salt://soe/set_hostname.sh
    - args: foo.bar.com
    - unless: grep -q "foo.bar.com" /etc/hosts
[/sourcecode]


