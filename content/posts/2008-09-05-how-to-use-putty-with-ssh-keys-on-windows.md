---
title: How to use putty with ssh keys on Windows
author: Sonia Hamilton
date: 2008-09-05
url: /2008/09/05/how-to-use-putty-with-ssh-keys-on-windows/
categories:
  - Other-Tech
tags:
  - Networking
  - Ssh
---
[ssh][1] is normally used nowadays instead of telnet for remotely accessing Linux servers (and other devices), as telnet is an insecure plain text protocol (and passwords can be easily captured using tools like [dsniff][2]).

<!--more-->

Most people can usually understand ssh with a username and a password, but when it comes to password-less authentication using keys, they get lost (especially if they've only ever used Windows).

So here's how you do it using putty.<!--more-->

  * download putty.exe, pscp.exe, pageant.exe, and puttygen.exe from [chiark.greenend.org.uk][3], and put them into an easily accessible folder (eg My Documents\putty, or c:\putty if you want to use putty from the command line)

**Generating your SSH Key**

If you need to generate a key, do this first. If you have been supplied with a key, skip down to **Changing your Password** and **Using your SSH Key** (below).

  * run puttygen.exe to generate your key, and save it in the putty folder: 
      * for **Type of Key to generate**, choose SSH2-DSA, 2048 bits, click **Generate**, and wave your mouse around to generate randomness
      * once finished generating, put your name in the **comment** (eg firstname.lastname)
      * put a good password on your key in the **Key Passphrase **field (and repeat in the **confirm** field)
      * click **Save Public Key**, save to putty folder; call the file firstname.lastname
      * click **Save Private Key**, save to putty folder; call the file firstname.lastname (.ppk extension will be added)
      * your Linux sysadmin will have asked you to provide them with **your public key**, and this is where problems come up. Putty uses a different key format than OpenSSH, so don't send the public key file from the putty folder. Instead, paste into an email the field called **Public key for pasting into OpenSSH authorized_keys file **(very top of screen). If you've accidently sent the putty format file, you can re-run puttygen.exe, click the **Load** button to load your existing private key, and then copy and paste the OpenSSH format into an email.

[<img class="alignnone size-full wp-image-155" title="putty_openssh" src="http://blog.snowfrog.net/wp-content/uploads/2008/09/putty_openssh.png" alt="" width="480" height="467" />][4]

**Changing the Password on your SSH Key**

  * run **puttygen.exe**, and load your key by clicking the **Load** button and browsing to your private key (the file without the .ppk extension). You will be prompted for your old password when loading the key
  * put in a new password in the two passphrase fields
  * click on **Save private key** -- save it on top of your existing private key

**Using Your SSH Key:**

  * if you have been separately provided with an ssh public and private key, save them into an easily accessible folder (eg My Documents/putty). Then browse to that key when instructed below to &#8216;load your key'
  * once your sysadmin has setup your account, there's three ways you can use your key 
      * the **painful** way. Run putty.exe, enter the hostname/ip, put your username in **Connection, Data**,** Auto-login username**, load your key in **Connection, SSH, Auth**, **Private key file for authentication**, then click **Open** to connect
      * the **better** way -- caching your key in memory. Run pageant.exe -- you'll see a little terminal with a hat in the Notification area (bottom RHS of screen). [<img class="alignnone size-full wp-image-164" title="pageant" src="http://blog.snowfrog.net/wp-content/uploads/2008/09/pageant.png" alt="" width="162" height="49" />][5] Right click on this icon, choose **Add Key**, browse to your private key in the putty folder, enter your password when prompted. Then right click on the icon, choose New Session. Enter the hostname/ip, give the session a name in the **Saved Sessions** field, put your username in **Connection, Data**,** Auto-login username**, then click the **Save** button. You can then right click on the pageant icon, **Saved Sessions**, choose your saved session, and rapidly login to your target system
      * the **best** way -- use a decent operating system (ie Unix style), like Linux, FreeBSD, PC-BSD or Mac OSX, and automatically load your ssh keys on login :-)

**Troubleshooting**

From experience, I've found most problems connecting with ssh servers come from network/firewall settings:

  * check basic connectivity using the ping command -- Start, Run, cmd, ping 1.2.3.4
  * check a firewall isn't blocking port 22 (ssh) by trying to telnet on port 22 -- Start, Run, cmd, telnet 1.2.3.4 22. You should get a result like this, showing that ssh is accessible:
<pre>telnet 1.2.3.4 22
Trying 1.2.3.4...
Connected to foo.bar.com.au.
Escape character is '^]'.
SSH-1.99-OpenSSH_3.9p1</pre>

  * if using *nix, use **ssh -vvv** to get more verbose output -- often you can see why the key exchange is failing

**Next steps.**

After using putty on Windows for a while, you may want to investigate [Cygwin][6] -- it allows you to install a Unix-like environment on Windows, giving you native versions of ssh, scp, key caching, and many other tools. If working with websites, [rsync][7] with ssh is handy -- it allows you to rapidly sync your development and production work, as rsync sends file changes not every file. See also my [other posts on ssh tools][8].

 [1]: http://en.wikipedia.org/wiki/Secure_Shell
 [2]: http://monkey.org/~dugsong/dsniff/
 [3]: http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html
 [4]: http://blog.snowfrog.net/wp-content/uploads/2008/09/putty_openssh.png
 [5]: http://blog.snowfrog.net/wp-content/uploads/2008/09/pageant.png
 [6]: http://www.cygwin.com/
 [7]: http://en.wikipedia.org/wiki/Rsync
 [8]: http://blog.snowfrog.net/tag/ssh/
