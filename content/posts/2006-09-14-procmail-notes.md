---
author: sonia
comments: true
date: 2006-09-14 04:56:04+00:00
slug: procmail-notes
title: procmail notes
wordpress_id: 42
categories:
- Linux
tags:
- Procmail
---

### Good procmail sites





	
  * [Timo's procmail tips](http://lipas.uwasa.fi/~ts/info/proctips.html)

	
  * [ii.com - procmail quickstart](http://www.ii.com/internet/robots/procmail/qs/)

	
  * [procmail tips](http://pm-doc.sourceforge.net/pm-tips.html)

	
  * [Halcyon guide](http://www.inwa.net/~m3047/procmail/procmail-guide.html)

	
  * [Partmaps procmail FAQ](http://partmaps.org/era/procmail/mini-faq.html)

	
  * [Stimpy's formail tutorial](http://www.stimpy.net/procmail/tutorial/formail.html)




### Procmail commands can consist of...





	
  * a statement



    
     FOO=`formail ... | sed ...`





	
  * a recipe




### A recipe consists of three parts...





	
  * a colon line

	
  * zero or more condition lines

	
  * an action section



    
     :0
     email_folder/



    
    
     :0
     * From: ...
     email_folder/




### An action is one of...





	
  * a folder



    
     email_folder
     email_folder/





	
  * a forward



    
     !foo@bar





	
  * a pipe (with **:0 fwh** or **:0 fwb** colon flags)



    
     | formail -I ...





	
  * a curly brace



    
     {




### Curly Braces


A curly brace starts a nesting block ie a recipe can be:



	
  * a colon line, zero or more conditions, and curly brackets



    
     :0
     {
         ...
     }



    
     :0
     * From: ...
     {
         ...
     }


Inside curly brackets there must be one or more recipes.


### How to do if-else


_Do if-else using the E colon line flag_

    
     :0
     {
         :0
         * ^From: ...
         # deliver to default destination (inbox)
         ${DEFAULT}
     }
     :0E
     {
         # else
         ...
     }
