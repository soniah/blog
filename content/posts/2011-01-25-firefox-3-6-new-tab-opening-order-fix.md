---
title: Firefox 3.6 – new tab opening order – fix
author: Sonia Hamilton
date: 2011-01-24
url: /2011/01/25/firefox-3-6-new-tab-opening-order-fix/
categories:
  - Other-Tech
tags:
  - Firefox
---
. in Firefox 3.6 however only new tabs are opened at the far right of the tabbar while new tabs that are opened from existing tabs

<!--more-->

, e.g. by middle-clicking a link in an already open tab, are opened next to the tab containing the link . about:config . filter for the term tabs.insertRelatedAfterCurrent. The default value of the parameter is true which simply means that related tabs are opened after the current and not at the end. A double-click on the row will change the value to false indicating that related tabs will from then on be opened at the end of the tabbar just like new tabs

Full article at [ghacks.net][1].

 [1]: http://www.ghacks.net/2010/01/24/open-tabs-at-the-right-firefox/
