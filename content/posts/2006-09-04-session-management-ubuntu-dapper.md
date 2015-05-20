---
author: sonia
comments: true
date: 2006-09-04 03:18:10+00:00
slug: session-management-ubuntu-dapper
title: session management Ubuntu Dapper
wordpress_id: 41
categories:
- Other-Tech
tags:
- Ubuntu
---


	
  * use _gnome-session-save_

	
  * _devilspie_



    
    
    eg for firefox the config looks like this:
    ~/.devilspie/firefox.ds
    
    (if
     (matches (window_name) "Firefox")
     (begin
           (set_workspace 2)
       (maximize)
     )
    )
    
    I then only need add devilspie as a start up program using the sessions
    dialog.
    Thanks hal at gmail, SLUG list
    
    ---
    
    Despite that, if you want to try the upstream style logout stuff, you can do
    so by changing an Ubuntu-local gconf key:
    
      /apps/panel/global/upstream_session = true
    Thanks to Jeff Waugh, SLUG list
