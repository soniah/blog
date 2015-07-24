---
author: sonia
date: 2015-07-24
url: /2015/07/24/dockerfile-images/
title: Dockerfile Images
categories:
- Linux
tags:
- Docker
---

My work associate [Peter
Viertel](https://www.linkedin.com/pub/peter-viertel/0/26b/3a8) recently gave a
lunchtime brownbag on [Docker](https://www.docker.com/).

<!--more-->

A topic that came up - the problems around large Docker base images that
are just copies of full Linux installs eg the Ubuntu image that is used
in many tutorials. Examples of problems: PID 1 (init) not cleaning up
processes correctly, no cron, no logrotate, no syslog, EXEC shells
requiring root access to docker daemon.

The phusion/baseimage site has good material on the issues (even if
you prefer .rpm over .deb).

* [Phusion baseimage-docker overview](https://phusion.github.io/baseimage-docker/)
* [phusion/baseimage-docker](https://github.com/phusion/baseimage-docker#readme)

Also, Mark van Holsteijn's article on creating small images based off
Docker scratch is good.

* [Mark van Holsteijn - Create Small Container](http://blog.xebia.com/2015/06/30/how-to-create-the-smallest-possible-docker-container-of-any-image/)
* [mvanholsteijn/strip-docker-image](https://github.com/mvanholsteijn/strip-docker-image)
