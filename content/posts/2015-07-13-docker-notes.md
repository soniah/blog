---
author: sonia
date: 2015-07-13
url: /2015/07/13/dockerfile-notes/
title: Dockerfile Notes
categories:
- Linux
tags:
- Docker
---

Some notes on [Docker](https://www.docker.com/)
[Dockerfiles](https://docs.docker.com/reference/builder/).

<!--more-->

# Commands

* ```MAINTAINER``` - author, email, etc

* ```FROM``` - base image eg __ubuntu__

* ```CMD``` and ```ENTRYPOINT```. Separately, either can be used to
  specify the default executable. When both are used, CMD is appended to
  ENTRYPOINT to give the container's command line.  Either can be
  overridden from ```docker run``` however CMD is easier -- it's just
  picks up the remainder of the ```docker run``` command (like
  ```"$*"``` for shell scripts) -- allowing a docker image to be thought
  of as a "wrapped" executable

* ```RUN``` - install stuff. For dev, separate out ```RUN``` commands,
  so layers are cached and builds are faster. For prod, chain ```RUN```
  commands with ```&&``` or ```;``` as multiple RUN commands cause
  multiple layers

* ```COPY```, ```ADD``` and ```VOLUME```. COPY copies file into the
  image; ADD does the same but also does things like untar or retrieving
  from URL - avoid as behaviour is too overloaded. VOLUME mounts a
  directory from server filesystem

* ```ENV```, ```WORKDIR``` and ```USER``` - environment variables, cwd
  and userid for CMD/ENTRYPOINT

* ```EXPOSE``` - expose a network port. Use ```nn``` not ```nn:mm```
  form - allow operator to decide public port using ```-p``` option

# Build, Run, Exec

{{< highlight bash >}}
# build the image & tag it; use current dir as context
docker build -t="soniah/foo:1.0" .
# run, automap ports. For dev, omit -D -- stdout is tailed and
# container is automatically stopped on ctrl-c.
docker run -P sonia/foo
# get an interactive shell
docker exec -it random_name /bin/bash
# remove all old images, except ubuntu "base" images
docker rmi -f `docker images | tail -n +2 | grep -v 'ubuntu' | awk {'print $3'}`
# remove all old containers, including stopped containers
docker rm `docker ps --no-trunc -aq`
{{< /highlight >}}

# See also

* [Dockerfile Best Practices - MCrosby](http://crosbymichael.com/dockerfile-best-practices.html)
* [Dockerfile Best Practices](https://docs.docker.com/articles/dockerfile_best-practices/)
* [Dockerfile: ENTRYPOINT vs CMD](http://www.centurylinklabs.com/dockerfile-entrypoint-vs-cmd/)
* [Dockerfile: ADD vs COPY](http://www.centurylinklabs.com/dockerfile-add-vs-copy/)
