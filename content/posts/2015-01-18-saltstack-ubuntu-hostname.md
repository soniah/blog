---
author: sonia
date: 2015-01-18
url: /2015/01/18/saltstack-ubuntu-hostname/
title: SaltStack Ubuntu Hostname
categories:
- Linux
tags:
- SaltStack
- Ubuntu
---

[SaltStack](http://docs.saltstack.com/en/latest/ref/states/all/salt.states.network.html) currently doesn't set the hostname correctly on Debian/Ubuntu. For example, this won't work:

<!--more-->

{{< highlight yaml >}}
system:
    network.system:
      - enabled: True
      - hostname: server1.example.com
{{< /highlight >}}

Here's a little shell script I wrote, to get around this problem:

{{< highlight bash >}}
% cat set_hostname.sh 
#!/bin/bash

hn=$1
hostname $hn
echo $hn > /etc/hostname
sed -i "1s/.*/127.0.0.1 localhost $hn/" /etc/hosts
{{< /highlight >}}

Then apply it using cmd.script, for example:

{{< highlight yaml >}}
foo-hostname:
  cmd.script:
    - source: salt://soe/set_hostname.sh
    - args: foo.bar.com
    - unless: grep -q "foo.bar.com" /etc/hosts
{{< /highlight >}}
