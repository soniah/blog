---
author: sonia
comments: true
date: 2006-08-26 00:19:10+00:00
slug: log-shipping-hints
title: log shipping hints
wordpress_id: 39
categories:
- Other-Tech
tags:
- MSSQL
---

`select * from msdb..log_shipping_databases
select * from msdb..log_shipping_plans
select * from msdb..log_shipping_primaries
select * from msdb..log_shipping_secondaries
sp_get_log_shipping_monitor_info`

`sp_delete_log_shipping_secondary
sp_delete_log_shipping_primary
sp_delete_log_shipping_database`
