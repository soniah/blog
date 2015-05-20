---
author: sonia
comments: true
date: 2010-06-23 05:22:40+00:00
slug: windows-autologon
title: Windows autologon
wordpress_id: 704
categories:
- Other-Tech
tags:
- Windows
---

The only time I use Windows is as a virtual machine "appliance" ie it's running some application that I have to run, that only runs on Windows. Often I want the VM to just logon automagically; here's a registry file to do so. Save it as foo.reg and double click on it:

    
    Windows Registry Editor Version 5.00
    
    [HKEY_LOCAL_MACHINESOFTWAREMicrosoftWindows NTCurrentVersionWinlogon]
    "DefaultUserName"="sonia"
    "DefaultPassword"="secret"
    "AutoAdminLogon"="1"


No rocket science, I'm just blogging it so I don't have to look it up again...
