---
title: vim folding
author: Sonia Hamilton
date: 2010-03-30
url: /2010/03/30/vim-folding/
categories:
  - Other-Tech
tags:
  - Vim
---
A concise [article][1] on Linux.com (that I keep referring back to) about vim folding.

<!--more-->

I've been using vi/vim for years and vi keystrokes just "happen", but it's always nice to learn a few more tricks, especially when working with larger scripts.

A brief summary of folding:

  * highlight some text using v visual mode, **zf** to fold, **zo** to unfold (ie **o**pen)
  * put cursor on an opening curly bracket, and  **zfa}** to fold until closing curly bracket (or **zfa)** or **zfa]** for parentheses, square brackets)
  * add this to your .vimrc to remember folds:

<pre>au BufWinLeave * mkview
au BufWinEnter * silent loadview
</pre>

Lots more commands in the article.

 [1]: http://www.linux.com/archive/feature/114138
