---
title: Subversion Cheatsheet
author: Sonia Hamilton
date: 2007-10-09
url: /2007/10/09/subversion-cheatsheet/
categories:
  - Linux
tags:
  - Cheatsheets
  - Subversion
---
  * See also: [svn command line tutorial for beginners 1 ][1]
  * Notes from: [Version Control with Subversion][2]
  * Tsavo&#8217;s great [svn cheatsheet][3]

**Quickstart**

<tt>sudo aptitude install subversion</tt>  
<tt>svnserve -d</tt>

<!--more-->Create source project, splitting into trunk, tags and branches (latter 2 directories initially empty). 

**project** is a dummy name that is just used to build repo, so actually use the name **project**, **original** is the name of the original code directory.

<tt>mkdir -p project/{trunk,tags,branches}</tt>  
<tt>mv ~/original ~/project/trunk</tt>

Using *trunk/tags/branches* for a small project is overkill &#8211; tags and branches can be added later. Therefore for a small project, just do:

<tt>mkdir -p project</tt>  
<tt>mv ~/original ~/project</tt>

Create subversion repository:

<tt>cd</tt>  
<tt>svnadmin create svnrepo</tt>

Import project into repository, and archive original data:

<tt>svn import project file:///home/sonia/svnrepo -m "initial import"</tt>  
<tt>mv project /tmp</tt>

After the repo is setup, you&#8217;ll probably want to add other directories eg to import **projectb**:

<tt>svn import projectb file:///home/sonia/svnrepo/trunk/projectb -m "initial import"</tt>  
<tt>mv projectb /tmp</tt>

Checkout a working copy:

<tt>svn checkout file:///home/sonia/svnrepo/trunk original</tt>

Make changes to working copy, then get a list of changes:  
<tt></tt>

<tt>svn status --show-updates --verbose foo</tt>  
<tt>svn diff</tt>

Finally, save changes back to repository:  
<tt></tt>

<tt>svn commit</tt>

Or, cancel some changes:  
<tt></tt>

<tt>svn revert foo</tt>

**Repository URLS**

<tt>file:///</tt>  
<tt>http://</tt>  
<tt>https://</tt>  
<tt>svn://</tt>  
<tt>svn+ssh://</tt>

**Get Help**

<tt>svn help foo</tt>

**Other Common Tasks**

  * ignoring files <tt>svn propedit svn:ignore targetdir</tt> (see&#8221;[Ignoring Unversioned Items][4]&#8220;)
  * to always ignore files of type x (eg .mp3), edit **~/.subversion/config** or **/etc/subversion/config** and set **global-ignores** under **[miscellany]** (see [Runtime Configuration Area][5]).

 [1]: http://linux.byexamples.com/archives/255/svn-command-line-tutorial-for-beginners-1/
 [2]: http://svnbook.red-bean.com/
 [3]: http://jwamicha.wordpress.com/2008/05/29/subversion-a-summary-cheat-sheet-learn-svn-in-10-minutes/
 [4]: http://svnbook.red-bean.com/en/1.4/svn.advanced.props.special.ignore.html
 [5]: http://svnbook.red-bean.com/en/1.4/svn.advanced.confarea.html
