---
title: beat image spam with procmail
author: Sonia Hamilton
date: 2007-02-04
url: /2007/02/03/beat-image-spam-with-procmail/
categories:
  - Linux
tags:
  - Procmail
---
I blogged a while ago about [using FuzzyOcr for detecting image spam][1]. My FuzzyOcr isn't working and at the moment I haven't got time to fix it, so I wrote a procmail recipe to solve the problem instead:

<!--more-->

<pre># test if body contains gif, html, etc, and get procmail score
:0 Bc
* 3.5^0 Content-Type: image/gif
* 2^0 Content-Type: text/html
/dev/null
SCORE_PM=$=

# pull out SA score and required; if 2 scores &gt; SA req'd, ISGT = 1 (true)
SCORE_SA=`formail -c -xX-Spam-Status: | awk '{print $2}' | awk -F= '{print $2}'`
REQD_SA=`formail -c -xX-Spam-Status: | awk '{print $3}' | awk -F= '{print $2}'`
ISGT=`echo "${SCORE_SA} + ${SCORE_PM} &gt; ${REQD_SA}" | bc -l`

# test if ISGT = 1, if so, spam prob
:0 :
* ISGT ?? ^^1^^
.y_spam_probable/</pre>

 [1]: http://blog.snowfrog.net/?q=node/417
