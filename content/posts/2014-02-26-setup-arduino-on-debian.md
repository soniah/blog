---
author: sonia
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

{{< highlight shell >}}
sudo adduser $USER dialout
sudo adduser $USER tty
{{< /highlight >}}

Confirm the port **/dev/ttyUSB0** is being used by Arduino - tail messages then plug in the Arduino.

{{< highlight shell >}}
sudo tail -f /var/log/messages

# you should see something like:
FTDI USB Serial Device converter now attached to ttyUSB0

# out of interest, inspect permissions on port
ls -al /dev/ttyUSB0
{{< /highlight >}}

Logout and login (or run a login shell). Confirm permissions.

{{< highlight shell >}}
zsh -l
id

# you should see something like:
groups=1000(sonia),5(tty),20(dialout),...
{{< /highlight >}}

Install Arduino pre-requisites.

{{< highlight shell >}}
sudo aptitude install arduino arduino-core
{{< /highlight >}}

If preferred, download the **latest** Arduino environment, run the shell script to start it.

{{< highlight shell >}}
cd ~/arduino-1.0.5
./arduino&
{{< /highlight >}}

Set the serial port (Tools -> Serial Port) to **/dev/ttyUSB0**. Any problems doing this, edit the serial port setting in  **~/.arduino/preferences.txt**

**Hello World** - upload Blink (File -> Examples -> 01.Basics -> Blink) to your Arduino, go crazy with that flashing LED!


