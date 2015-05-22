---
author: sonia
comments: true
date: 2013-11-04
url: /2013/11/04/convert-libreoffice-openoffice-ods-files-to-csv-command-line/
title: convert LibreOffice (OpenOffice) .ods files to .csv command line
wordpress_id: 1901
categories:
- Linux
tags:
- LibreOffice
---

How to convert LibreOffice .ods files to .csv from the command line - useful for scripts or when working without X:

`soffice --headless --convert-to csv test.ods`

From [CLI - convert ods to csv with semicolon as delimiter](http://ask.libreoffice.org/en/question/21916/cli-convert-ods-to-csv-with-semicolon-as-delimiter/).

No rocket science, just a handy note for myself...
