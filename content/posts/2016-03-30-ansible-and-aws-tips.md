---
author: sonia
draft: true
date: 2016-03-30
url: /2016/03/30/ansible-and-aws-tips/
title: Ansible and AWS Tips
categories:
- Linux
tags:
- Ansible
- Puppet
---

I've been using Ansible to provision resources on AWS. Here is a
collection of tips and things I wish I'd know before starting.

<!--more-->

Previously I've worked with Puppet, SaltStack and Terraform for
provisioning and configuration management. I understand [Maxime
Thoonsen's comment](https://www.theodo.fr/blog/2015/10/best-practices-to-build-great-ansible-playbooks/) about Puppet giving nightmares:

    I remember my first times doing some provisioning, it was running with
    Puppet. It was brilliant but also very complex. I had a really hard time
    understanding how it worked and debugging it wasn’t the funniest part in
    my life. I hated working with provisioning at that time. I still make
    those nightmares about it…

I find Ansible more useful and easier to understand than those tools,
however it's great flexibility and power makes it hard to know where to
start.

# Useful Resources

Here are some resources I found useful for learning Ansible (and Ansible
with AWS). However like any tool one of the best ways to learn is just
start with some simple projects, for example using Ansible to:

* configure a "hello world" web page on a manually provisioned AWS Linux host
* provision a Linux host on AWS
* combine the two previous plays into one playbook

The [Ansible Documentation](http://docs.ansible.com/ansible/index.html)
is actually good for learning Ansible.

I also referred to the following books - I learned something different
from each one:

* Mastering Ansible, Jesse Keating
* Learning Ansible, Madhurranjan Mohaan; Ramesh Raithatha
* Ansible Configuration Management - Second Edition, Daniel Hall
* Ansible Playbook Essentials, Gourav Shah

Here are some links I found useful:

* [Directory Layout](http://docs.ansible.com/ansible/playbooks_best_practices.html#directory-layout)
* [Ansible Summary](https://gist.github.com/klen/ff85fe443735afb2410d)
* [Ansible Examples](https://github.com/ansible/ansible-examples/)
* [Getting Started with Ansible, I, II, and
  III](http://tomoconnor.eu/blogish/getting-started-ansible/#.VkFVRqIwFHJ)
* [Server Fault Ansible
  Questions](http://serverfault.com/questions/tagged/ansible)
* [pedantically_commented_playbook.yml](https://gist.github.com/phred/2897937)
* [ansible_conditionals_examples.yaml](https://gist.github.com/marcusphi/6791404)

# Some foundations

* I use the [source
  version](http://docs.ansible.com/ansible/intro_installation.html#running-from-source) of Ansible, as the versions distributed with
  Linux distros can be old

* Use `-vvvv` for debugging. For example `ansible-playbook foo.yml
  -vvvv`

* in addition to the configuration file `ansible.cfg`, other files and
  environment variables can be used. If something just won't work when
  you know it *should* work, check your env: `env | grep -i ansible` and
  `env | grep -i aws`

# Tags

[Ansible Tags](http://docs.ansible.com/ansible/playbooks_tags.html) allow you
to run a specific part of a configuration without running the whole playbook.
However *whether* to use them is controversial, some people say they should
*never be used* as they cause too much confusion. Others want to tag
everywhere, deep down in roles.

My preference is to only use tags to select roles in top level
playbooks, giving flexibility but keeping clarity. But I wouldn't use
them *within* a role. For example:

{{< highlight bash >}}
    ansible-playbook config.yml --tags="java,splunk"
{{< /highlight >}}

{{< highlight yaml >}}
    ---
    - name: base setup
      hosts:
        - myhosts
      roles:
        - base
      tags:
        - base
        - java
        - splunk
{{< /highlight >}}

# Dev, SIT, UAT, Prod, ...

Often you need a whole set of different variables and configurations for laptop
development versus a 'real' environment.  Using different `ansible.cfg` files
can help here, and you swap using environment variables. For example:

{{< highlight bash >}}
    export ANSIBLE_CONFIG=ansible.cfg.dev
    export ANSIBLE_CONFIG=ansible.cfg.uat
{{< /highlight >}}

You can also combine this with dynamic vars files and dynamic nodes (below).

# Dynamic Vars Files

Variable files can be included in your yaml files to load blocks of variables.
You can get *more* flexibility by dynamically loading your var files:

{{< highlight yaml >}}
    ---
    - name: base setup
      become: true
      hosts:
        - myhosts
      vars_files:
        - "vars/{{ vf }}.yml"
      roles:
        - base
{{< /highlight >}}

Then run your playbook with the *dev* set of variables:

{{< highlight bash >}}
    ansible-playbook config.yml -e vf=dev
{{< /highlight >}}

A similar technique is also useful for AWS tags (AWS is discussed further below):

{{< highlight yaml >}}
    ---
    - name: base setup
      become: true
      hosts:
        - "{{ nodes }}"
      roles:
        - base
{{< /highlight >}}

{{< highlight bash >}}
    ansible-playbook config.yml -e nodes='tag_Owner_sonia'
{{< /highlight >}}

# AWS Dynamic Inventory

There's many examples on the web demonstrating [AWS Dynamic Inventory](http://docs.ansible.com/ansible/intro_dynamic_inventory.html#example-aws-ec2-external-inventory-script), here's some more interesting ideas

## AWS and Dev/UAT/etc

Previously I mentioned using different `ansible.cfg` files for dev/uat/etc -
for switching AWS inventory this can be really useful.

Your dev `ansible.cfg`:

    [defaults]
    inventory = inventory.dev

Your prod `ansible.cfg`:

    [defaults]
    inventory = inventory.prod

Some things you may want to change:

* laptop dev: short caching (instances changing regularly), public ip addresses (using your own AWS account)
* production: long caching (instances stable), private ip addresses (vpc's being used)

## AWS Inventory Spelunking

You can use AWS Dynamic Inventory Tags to match your hosts, but it can be
difficult to work out the syntax. Is it:

`security_group_ElasticMapReduce_master`

or

`security_group_ElasticMapReduce-master`

??

The solution is to use the lines at the end of the `ansible-ec2.cache` file, it will show the *exact* tags available, and which hosts they match:

    "security_group_ElasticMapReduce-master": [
      "10.666.666.253",
      "10.666.666.229",
      "10.666.666.210",
      "10.666.666.9",
      "10.666.666.239"
    ],

## AWS Inventory Ping

Even after Spelunking the cache, it can *still* be difficult to determine *how*
to target hosts. I use the following `ping.yml`

    ---
    - hosts:
      - "{{ nodes }}"
      tasks:
      - name: ping-pong
        ping:

And test it with more complex tag combinations:

    ansible-playbook ping.yml \
    -e nodes='tag_Name_DEADBEEF001:&security_group_ElasticMapReduce-slave'

# More

Other things I haven't covered yet:

* md5 checksums
* everything as a template not a file
* complex config files: template to /var/tmp/foo, then assemble
* your own deploy script, for troubleshooting

