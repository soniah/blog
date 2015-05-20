---
author: sonia
comments: true
date: 2007-10-09 04:28:40+00:00
slug: subversion-cheatsheet
title: Subversion Cheatsheet
wordpress_id: 85
categories:
- Linux
tags:
- Cheatsheets
- Subversion
---


	
  * See also: [svn command line tutorial for beginners 1 ](http://linux.byexamples.com/archives/255/svn-command-line-tutorial-for-beginners-1/)

	
  * Notes from: [Version Control with Subversion](http://svnbook.red-bean.com/)

	
  * Tsavo's great [svn cheatsheet](http://jwamicha.wordpress.com/2008/05/29/subversion-a-summary-cheat-sheet-learn-svn-in-10-minutes/)


**Quickstart**

sudo aptitude install subversion
svnserve -d

<!-- more -->Create source project, splitting into trunk, tags and branches (latter 2 directories initially empty). **project** is a dummy name that is just used to build repo, so actually use the name **project**, **original** is the name of the original code directory.

mkdir -p project/{trunk,tags,branches}
mv ~/original ~/project/trunk

Using _trunk/tags/branches_ for a small project is overkill - tags and branches can be added later. Therefore for a small project, just do:

mkdir -p project
mv ~/original ~/project

Create subversion repository:

cd
svnadmin create svnrepo

Import project into repository, and archive original data:

svn import project file:///home/sonia/svnrepo -m "initial import"
mv project /tmp

After the repo is setup, you'll probably want to add other directories eg to import **projectb**:

svn import projectb file:///home/sonia/svnrepo/trunk/projectb -m "initial import"
mv projectb /tmp

Checkout a working copy:

svn checkout file:///home/sonia/svnrepo/trunk original

Make changes to working copy, then get a list of changes:


svn status --show-updates --verbose foo
svn diff

Finally, save changes back to repository:


svn commit

Or, cancel some changes:


svn revert foo

**Repository URLS**

file:///
http://
https://
svn://
svn+ssh://

**Get Help**

svn help foo

**Other Common Tasks**



	
  * ignoring files svn propedit svn:ignore targetdir (see"[Ignoring Unversioned Items](http://svnbook.red-bean.com/en/1.4/svn.advanced.props.special.ignore.html)")

	
  * to always ignore files of type x (eg .mp3), edit **~/.subversion/config** or **/etc/subversion/config** and set **global-ignores** under **[miscellany]** (see [Runtime Configuration Area](http://svnbook.red-bean.com/en/1.4/svn.advanced.confarea.html)).


