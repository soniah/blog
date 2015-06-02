---
title: Notes on Branch Management with Subversion
author: Sonia Hamilton
date: 2009-02-24
url: /2009/02/24/notes-on-branch-management-wit-subversion/
categories:
  - Other-Tech
tags:
  - Subversion
---
Some notes on branch management with Subversion (more for my own learning purposes than anything):

<!--more-->

  * create branch: **svn cp foo foo-branch**
  * develop new feature in foo-branch, whilst doing any bug fixes in trunk
  * merge some changes from trunk into branch -- keep branch up-to-date as possible 
      * commit any changes first, so can easily revert if desired: **cd foo-branch; svn up; svn ci -m &#8220;pre merge in trunk&#8221;**
      * find where branch occured (if not noted in a log message -- duh): **svn log --verbose --stop-on-copy foo-branch** (eg 123)
      * preview changes succinctly: **cd foo-branch; ****svn merge --dry-run -r 123:HEAD**
      * preview changes verbosely: **cd foo-branch; ****svn diff --notice-ancestry -r 123:HEAD &#8230;**
      * apply changes: **cd foo-branch; ****svn merge -r 123:HEAD svn+ssh://myrepo.com/foo/bar**
      * check changes: **svn st; svn diff, **if problems: **svn revert**
      * commit changes: **svn ci -m &#8220;merged trunk changes into branch (flubbed the widgets) r123:129&#8243;**
  * keep working in foo-branch, merge in some more changes 
      * ditto previous
      * **svn merge -r 130:HEAD svn+ssh://myrepo.com/foo/bar** (*previously merged up to 129, so start on 130*)
  * merge all changes from branch into trunk -- new feature finished 
      * ditto previous
      * **cd foo; svn merge -r 123:HEAD https://myrepo.com/foo-branch**
      * **svn ci -m &#8220;merged foo-branch into trunk (feature x) r123:145&#8243;**

An alternative (and often easier) approach is to branch on the server, then just switch the working copy for the subdirectory (or individual file) being worked on:

  * **svn cp https://****myrepo.com/foo ****https://****myrepo.com/foo-branch**
  * **cd foo**
  * **svn info bar | grep URL**
  * **cd bar; svn switch ****https://****myrepo.com/foo-branch/bar; cd ..  
    **
  * **svn info bar | grep URL**
  * merge changes as above

Tags:

  * tags are just copies (usually put in the tags directory): **svn cp https://****myrepo.com/foo/foo ****https://****myrepo.com/foo/tags/foo-1.0**. Tags aren&#8217;t read-only, but any changes can of course be reverted.

Directory structure:

  * the canonical way of structuring directories is: 
      * **/foo/trunk** (or **/foo/foo** so name of trunk dir corresponds to project when checked out)
      * **/foo/branches**
      * **/foo/tags**
  * I used to ignore this and just do /foo & /foo-branch, but this gets messy quickly and it&#8217;s easy to make mistakes or have problems when doing svn moves of  large directories if you want to reorganise things later. Also, when working with branches I tend to want to just switch a subdirectory rather than checkout the whole branch, and this directory structure seems to logically help with this

Notes from [Version Control with Subversion][1].

 [1]: http://svnbook.red-bean.com/
