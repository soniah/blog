---
author: sonia
comments: true
date: 2014-09-23
url: /2014/09/23/saltstack-essential-reading/
title: SaltStack Essential Reading
categories:
- Linux
tags:
- Salt
---

A list of 'Essential Reading' for SaltStack. A collection of useful links, mostly for myself but possibly helpful to others.

<!--more-->

* [How Do I Use Salt State](http://docs.saltstack.com/en/latest/topics/tutorials/starting_states.html)s,  [States tutorial](http://docs.saltstack.com/en/latest/topics/tutorials/states_pt1.html) and [Pillar Walkthrough](http://docs.saltstack.com/en/latest/topics/tutorials/pillar.html) - the tutorials
* [Highstate data structure definitions](http://docs.saltstack.com/en/latest/ref/states/highstate.html) and  [Understanding YAML](http://docs.saltstack.com/en/latest/topics/yaml/index.html) - helpful for understanding statefile layout - when to use a colon, as dash, double indents, etc
* [Requisites and Other Global State Arguments](http://docs.saltstack.com/en/latest/ref/states/requisites.html) - do something before something else, restart a service if a file changes, etc
* [salt.states.file](http://docs.saltstack.com/en/latest/ref/states/all/salt.states.file.html) - most config management is going to involve working with files...
* [salt.renderers.jinja](http://docs.saltstack.com/en/latest/ref/renderers/all/salt.renderers.jinja.html) and [Salt Best Practices](http://docs.saltstack.com/en/latest/topics/best_practices.html) - working with Jinja
