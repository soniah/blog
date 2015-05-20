---
author: sonia
comments: true
date: 2008-01-30 01:09:57+00:00
slug: howto-setup-nomachinenx-on-ubuntu
title: HowTo setup NoMachineNX on Ubuntu
wordpress_id: 113
categories:
- Other-Tech
tags:
- Networking
- Ubuntu
---

The instructions given by NoMachine for setting up on Linux are a bit thin; here's my own version:<!-- more -->



	
  * check not installed already, remove if desired


dpkg --list | grep NX
sudo dpkg --purge nxclient nxnode nxserver
sudo rm -rf /usr/NX

	
  * for the user being used to install, check/fix .ssh perms


su -
cd /root
chown -R root. .ssh
chmod 700 .ssh

	
  * download & install all 3 packages on both client (local) and server (remote)


wget -b http://../nxclient.deb  http://../nxnode.deb http://../nxserver.deb
dpkg --install nx*deb

	
  * on client and server, add aliases to /root/.bashrc and ~sonia/.bashrc


alias nxserver='/usr/NX/scripts/setup/nxserver'
alias nxsetup='/usr/NX/bin/nxsetup'
source ~/.bashrc

	
  * generate new keys on the server and check permissions


/usr/NX/scripts/setup/nxserver --keygen
cd  /usr/NX/share/keys
chown nx:root * ; chmod 644 *
cd ~nx/.ssh
chown nx:root * ; chmod 644 *
/etc/init.d/nxserver restart

	
  * copy keys from server to client, and rename key for ease of identification


(client:)
sudo bash; cd /usr/NX/share/keys
scp root@servername:/usr/NX/share/keys/default.id_dsa.key servername.id_dsa.key

	
  * import the key using the NX Client (General, Key, Import, Save)


