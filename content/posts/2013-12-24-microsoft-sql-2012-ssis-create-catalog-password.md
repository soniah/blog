---
author: sonia
comments: true
date: 2013-12-24
url: /2013/12/24/microsoft-sql-2012-ssis-create-catalog-password/
title: Microsoft SQL 2012 SSIS Create Catalog Password
categories:
- Other-Tech
tags:
- MSSQL
---

Creating an SSIS Catalogue on Microsoft SQL 2012 seems to have an interface bug - you need to both "enable CLR" and provide an "encryption password", but the options are mutually exclusive ie when I tried to type in a password, the interface locks the password fields.

<!--more-->

Maybe this was some sort of bad magic due to me coming over RDP to the new failing Server 2012 interface (I'm not using a tablet, so why force a tablet interface down my throat? Sort of reminds me of Ubuntu Unity). Anyway, the solution is to first enable CLR using SQL:

[sourcecode lang="sql"]
sp_configure 'show advanced options', 1;
GO
RECONFIGURE;
GO
sp_configure 'clr enabled', 1;
GO
RECONFIGURE;
GO
[/sourcecode]

Then the password field will be enabled when creating a catalog.
