---
author: sonia
comments: true
date: 2014-02-26
url: /2014/02/26/setup-arduino-on-debian/
title: Setup Arduino on Debian
categories:
- Linux
tags:
- Arduino
- Debian
---

Some notes on setting up Arduino on Debian.

<!--more-->

Add yourself to the required groups - dialout and tty.

[sourcecode lang="shell"]
sudo adduser $USER dialout
sudo adduser $USER tty
[/sourcecode]

Confirm the port **/dev/ttyUSB0** is being used by Arduino - tail messages then plug in the Arduino.

[sourcecode lang="shell"]
sudo tail -f /var/log/messages

# you should see something like:
FTDI USB Serial Device converter now attached to ttyUSB0

# out of interest, inspect permissions on port
ls -al /dev/ttyUSB0
[/sourcecode]

Logout and login (or run a login shell). Confirm permissions.

[sourcecode lang="shell"]
zsh -l
id

# you should see something like:
groups=1000(sonia),5(tty),20(dialout),...
[/sourcecode]

Install Arduino pre-requisites.

[sourcecode lang="shell"]
sudo aptitude install arduino arduino-core
[/sourcecode]

If preferred, download the **latest** Arduino environment, run the shell script to start it.

[sourcecode lang="shell"]
cd ~/arduino-1.0.5
./arduino&
[/sourcecode]

Set the serial port (Tools -> Serial Port) to **/dev/ttyUSB0**. Any problems doing this, edit the serial port setting in  **~/.arduino/preferences.txt**

**Hello World** - upload Blink (File -> Examples -> 01.Basics -> Blink) to your Arduino, go crazy with that flashing LED!


