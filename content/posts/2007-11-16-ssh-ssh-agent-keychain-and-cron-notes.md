---
author: sonia
comments: true
date: 2007-11-16 06:05:02+00:00
slug: ssh-ssh-agent-keychain-and-cron-notes
title: ssh, ssh-agent, keychain and cron notes
wordpress_id: 101
categories:
- Other-Tech
tags:
- Cron
- Ssh
---

**Summary**

To setup **ssh** and **keychain** to allow ssh related jobs to run from cron:



	
  * generate keys _with a password_ (**ssh-keygen -t dsa**) and install keychain. Do only on _secure machines_ ie ones that only you (or a small number of trusted admins) can logon to as root - typically your laptop/desktop and a secure admin server

	
  * add the following lines to your **~/.profile**:




<blockquote>

> 
> 
	
>   * some sites say **.bash_profile**, but I use .profile as I use both bash and zsh (don't have both as then only .bash_profile will be read)
> 
	
>   * I check keychain is executable with -x as I have the same .profile on all machines (synced via a script)
> 
	
>   * I use rsa keys as I work with older ssh1 machines; dsa keys are preferable.
> 

</blockquote>


`export HOSTNAME=`hostname` # HOSTNAME not set some machines`
`if [ -x /usr/bin/keychain -a -f $HOME/.keychain/${HOSTNAME}-sh ] ; then`
` /usr/bin/keychain $HOME/.ssh/id_rsa`
` source $HOME/.keychain/${HOSTNAME}-sh`
`fi`




	
    * <!-- more -->on machines where others are able to login as root (and hence possibly piggyback onto your private key), keychain should be started with --clear in .profile and ssh-agent shouldn't be run. Use --nocolor on non-VT100 compat terminals

	
    * unless **~/.hushlogin** exists, keychain will display a colourful message showing known keys being loaded on login:



`Copyright 2002-2004 Gentoo Foundation; Distributed under the GPL`
` * Found existing ssh-agent (11703)`
` * Known ssh key: /home/shamilton/.ssh/id_rsa`




	
    * any ssh-using scripts started from crontab on keychain'd machines should include the following lines at the start:



`source $HOME/.keychain/${HOSTNAME}-sh`

[Off Topic] To manually load keys into ssh-agent, typically on admin servers or non-X machines when not using keychain:



	
  * eval `ssh-agent`

	
  * ssh-add


[Off Topic] When ssh'ing between multiple machines, **ForwardAgent Yes** must be set in **/etc/ssh/ssh_config**. Otherwise add to **~/.ssh/config** or startup ssh as **ssh -A**.

**See also:**



	
  * gentoo homepage for [keychain](http://www.gentoo.org/proj/en/keychain/)

	
  * ibm developer works series on [key management and keychain](http://www.ibm.com/developerworks/library/l-keyc.html)

	
  * oceanpark on [passwordless connections](http://oceanpark.com/notes/howto_ssh_keychain_public_key_authentication_forwarding.html)

	
  * reflux on [notes on keychain](http://rephlux.sourceforge.net/running.rephlux.php)

	
  * my [ssh-notes](http://blog.snowfrog.net/2007/10/29/ssh-notes/) on tunnelling

	
  * Troy Johnson's notes on [Using RSync and SSH: Keys, Validating and Automation](http://troy.jdmz.net/rsync/index.html)

	
  * sshpass - [rsync + ssh keys](http://www.cyberciti.biz/faq/noninteractive-shell-script-ssh-password-provider/)


