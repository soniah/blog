---
title: session management Ubuntu Dapper
author: Sonia Hamilton
date: 2006-09-04
url: /2006/09/03/session-management-ubuntu-dapper/
categories:
  - Other-Tech
tags:
  - Ubuntu
---
  * use *gnome-session-save*
  * *devilspie*

<pre>eg for firefox the config looks like this:
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
Thanks to Jeff Waugh, SLUG list</pre>
