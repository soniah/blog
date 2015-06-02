---
title: Windows autologon
author: Sonia Hamilton
date: 2010-06-23
url: /2010/06/23/windows-autologon/
categories:
  - Other-Tech
tags:
  - Windows
---
The only time I use Windows is as a virtual machine "appliance" ie it's running some application that I have to run, that only runs on Windows.

<!--more-->

Often I want the VM to just logon automagically; here's a registry file to do so. Save it as foo.reg and double click on it:

<pre>Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINESOFTWAREMicrosoftWindows NTCurrentVersionWinlogon]
"DefaultUserName"="sonia"
"DefaultPassword"="secret"
"AutoAdminLogon"="1"</pre>

No rocket science, I'm just blogging it so I don't have to look it up again.
