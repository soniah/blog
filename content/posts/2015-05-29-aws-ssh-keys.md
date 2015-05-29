---
author: sonia
date: 2015-05-29
url: /2015/05/29/aws-ssh-keys/
title: AWS ssh keys
categories:
- Linux
tags:
- AWS
---

A quick _howto_ on working with AWS __.pem__ ssh certificates.

<!--more-->

AWS distributes their ssh keys as __.pem__ certificates. The usual process with
working with them is:

{{< highlight shell >}}
mv ~/Downloads/foo.pem ~/.ssh
chmod 0600 ~/.ssh/foo.pem
ssh -i ~/.ssh/foo.pem 1.2.3.4 -l ubuntu
{{< /highlight >}}

However, sometimes it's handy to generate a public key out of the
__.pem__ file, for example to make working with Gnome's
[Seahorse](http://en.wikipedia.org/wiki/Seahorse_%28software%29) key
manager easier:

{{< highlight shell >}}
cd ~/.ssh
mv foo.pem foo
ssh-keygen -y -f ~/.ssh/foo > ~/.ssh/foo.pub
{{< /highlight >}}
