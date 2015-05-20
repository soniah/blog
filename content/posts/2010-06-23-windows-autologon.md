---
title: Windows autologon
author: Sonia Hamilton
date: 2010-06-23
url: /2010/06/23/windows-autologon/
jabber_published:
  - 1277270563
categories:
  - Other-Tech
tags:
  - Windows
---
The only time I use Windows is as a virtual machine &#8220;appliance&#8221; ie it&#8217;s running some application that I have to run, that only runs on Windows. Often I want the VM to just logon automagically; here&#8217;s a registry file to do so. Save it as foo.reg and double click on it:

<pre>Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINESOFTWAREMicrosoftWindows NTCurrentVersionWinlogon]
"DefaultUserName"="sonia"
"DefaultPassword"="secret"
"AutoAdminLogon"="1"</pre>

No rocket science, I&#8217;m just blogging it so I don&#8217;t have to look it up again&#8230;
