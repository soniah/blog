---
title: log shipping hints
author: Sonia Hamilton
date: 2006-08-26
url: /2006/08/25/log-shipping-hints/
categories:
  - Other-Tech
tags:
  - MSSQL
---
`select * from msdb..log_shipping_databases<br />
select * from msdb..log_shipping_plans<br />
select * from msdb..log_shipping_primaries<br />
select * from msdb..log_shipping_secondaries<br />
sp_get_log_shipping_monitor_info`

`sp_delete_log_shipping_secondary<br />
sp_delete_log_shipping_primary<br />
sp_delete_log_shipping_database`
