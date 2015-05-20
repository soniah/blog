---
author: sonia
comments: true
date: 2005-11-23 02:25:33+00:00
slug: guest-and-public
title: guest and public
wordpress_id: 14
categories:
- Other-Tech
tags:
- MSSQL
---


	
  * guest = valid login but no account

	
  * guest is created (but disabled) by default; to enable run `GRANT CONNECT TO GUEST`

	
  * guest gets the permissions of the public role (as does everyone)

	
  * by default public has no permissions

	
  * Northwind: permissions are granted to public

	
  * pubs: permissions are granted to guest


