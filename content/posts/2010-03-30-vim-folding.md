---
author: sonia
comments: true
date: 2010-03-30 01:30:33+00:00
slug: vim-folding
title: vim folding
wordpress_id: 685
categories:
- Other-Tech
tags:
- Vim
---

A concise [article](http://www.linux.com/archive/feature/114138) on Linux.com (that I keep referring back to) about vim folding. I've been using vi/vim for years and vi keystrokes just "happen", but it's always nice to learn a few more tricks, especially when working with larger scripts.

A brief summary of folding:



	
  * highlight some text using v visual mode, **zf** to fold, **zo** to unfold (ie **o**pen)

	
  * put cursor on an opening curly bracket, and  **zfa}** to fold until closing curly bracket (or **zfa)** or **zfa]** for parentheses, square brackets)

	
  * add this to your .vimrc to remember folds:



    
    au BufWinLeave * mkview
    au BufWinEnter * silent loadview
    


Lots more commands in the article.
