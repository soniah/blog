---
title: ssh, ssh-agent, keychain and cron notes
author: Sonia Hamilton
date: 2007-11-16
url: /2007/11/15/ssh-ssh-agent-keychain-and-cron-notes/
categories:
  - Other-Tech
tags:
  - Cron
  - Ssh
---
**Summary**

To setup **ssh** and **keychain** to allow ssh related jobs to run from cron:

  * generate keys *with a password* (**ssh-keygen -t dsa**) and install keychain. Do only on *secure machines* ie ones that only you (or a small number of trusted admins) can logon to as root &#8211; typically your laptop/desktop and a secure admin server
  * add the following lines to your **~/.profile**:

>   * some sites say **.bash_profile**, but I use .profile as I use both bash and zsh (don&#8217;t have both as then only .bash_profile will be read)
>   * I check keychain is executable with -x as I have the same .profile on all machines (synced via a script)
>   * I use rsa keys as I work with older ssh1 machines; dsa keys are preferable.

``export HOSTNAME=`hostname` # HOSTNAME not set some machines``  
`if [ -x /usr/bin/keychain -a -f $HOME/.keychain/${HOSTNAME}-sh ] ; then`  
` /usr/bin/keychain $HOME/.ssh/id_rsa`  
` source $HOME/.keychain/${HOSTNAME}-sh`  
`fi`

  * <!--more-->on machines where others are able to login as root (and hence possibly piggyback onto your private key), keychain should be started with &#8211;clear in .profile and ssh-agent shouldn&#8217;t be run. Use &#8211;nocolor on non-VT100 compat terminals

  * unless **~/.hushlogin** exists, keychain will display a colourful message showing known keys being loaded on login:

`Copyright 2002-2004 Gentoo Foundation; Distributed under the GPL`  
` * Found existing ssh-agent (11703)`  
` * Known ssh key: /home/shamilton/.ssh/id_rsa`

  * any ssh-using scripts started from crontab on keychain&#8217;d machines should include the following lines at the start:

`source $HOME/.keychain/${HOSTNAME}-sh`

[Off Topic] To manually load keys into ssh-agent, typically on admin servers or non-X machines when not using keychain:

  * eval \`ssh-agent\`
  * ssh-add

[Off Topic] When ssh&#8217;ing between multiple machines, **ForwardAgent Yes** must be set in **/etc/ssh/ssh_config**. Otherwise add to **~/.ssh/config** or startup ssh as **ssh -A**.

**See also:**

  * gentoo homepage for [keychain][1]
  * ibm developer works series on [key management and keychain][2]
  * oceanpark on [passwordless connections][3]
  * reflux on [notes on keychain][4]
  * my [ssh-notes][5] on tunnelling
  * Troy Johnson&#8217;s notes on [Using RSync and SSH: Keys, Validating and Automation][6]
  * sshpass &#8211; [rsync + ssh keys][7]

 [1]: http://www.gentoo.org/proj/en/keychain/
 [2]: http://www.ibm.com/developerworks/library/l-keyc.html
 [3]: http://oceanpark.com/notes/howto_ssh_keychain_public_key_authentication_forwarding.html
 [4]: http://rephlux.sourceforge.net/running.rephlux.php
 [5]: http://blog.snowfrog.net/2007/10/29/ssh-notes/
 [6]: http://troy.jdmz.net/rsync/index.html
 [7]: http://www.cyberciti.biz/faq/noninteractive-shell-script-ssh-password-provider/
