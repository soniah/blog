---
author: sonia
comments: true
date: 2012-06-02
url: /2012/06/02/emacs-paredit-notes-for-osx/
title: Emacs Paredit Notes for OSX
wordpress_id: 1497
categories:
- Other-Tech
tags:
- Clojure
- Emacs
---

Some notes on [Emacs' Paredit mode](http://emacswiki.org/emacs/ParEdit). More so I can stop fighting with Paredit and do some **Clojure** programming than show any expertise - see [Mudphone's Paredit Preso](http://www.slideshare.net/mudphone/paredit-preso) for the real deal, as well as [hagelb's Paredit screencast notes](http://p.hagelb.org/paredit-screencast.html) and the [Paredit Cheat Sheet](http://www.emacswiki.org/pics/static/PareditCheatsheet.png).



	
  * **M-(**  wrap parens around something. Also for { [ "

	
  * **M-s**  remove parens from something

	
  * **M-S-s**  split sexpr into two

	
  * **M-S-j**  join sexprs

	
  * **C-q ♦**  just do what I say, dammit! force insert of paren or bracket ♦

	
  * **C-u DEL**  force delete paren or bracket


"Barfage and slurpage" ie moving parens left and right.  I had some trouble getting this going on OSX, as the terminal doesn't seem to map control key sequences correctly. After modifying emacs (see below), I got these going:

	
  * **C-<right>, C-<left>**  move right paren right or left

	
  * **ESC C-<right>, ESC C-<left>** move left paren right or left


I wrote this elisp for my **~/.emacs.d/sonia.el** (I'm using [Technomancy's Emacs Starter Kit](http://github.com/technomancy/emacs-starter-kit)):

[sourcecode language="clojure"]
(when (eq system-type 'darwin)
  (eval-after-load 'paredit
    '(progn
       ;; C-left
       (define-key paredit-mode-map (kbd "M-[ 5 d")
                   'paredit-forward-barf-sexp)
       ;; C-right
       (define-key paredit-mode-map (kbd "M-[ 5 c")
                   'paredit-forward-slurp-sexp)
       ;; ESC-C-left
       (define-key paredit-mode-map (kbd "ESC M-[ 5 d")
                   'paredit-backward-slurp-sexp)
       ;; ESC-C-right
       (define-key paredit-mode-map (kbd "ESC M-[ 5 c")
                   'paredit-backward-barf-sexp)
     )))
[/sourcecode]

![Lisp Parens](http://imgs.xkcd.com/comics/lisp_cycles.png)
