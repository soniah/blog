#!/bin/bash

# generate a template of a new piece of content

p=`pwd`
if [[ ${p##*/} != 'blog' ]] ; then
	echo "run from blog directory. Exiting..."
	exit 1
fi

if (( $# < 1 )) ; then
	echo "usage: $0 title (title case, with spaces)"
	exit 1
fi

title=$1
title_url=`echo $title | tr '[:upper:]' '[:lower:]'`
title_url=`echo $title_url | tr ' ' '-'`

# "fecha" means "date" is Spanish - I couldn't be bothered
# thinking of a better variable name
fecha_dash=`date "+%Y-%m-%d"`
fecha_slash=`date "+%Y/%m/%d"`
file_name="content/posts/${fecha_dash}-${title_url}.md"
url="/${fecha_slash}/${title_url}/"

echo
echo "Title:        $title"
echo "Title URL:    $title_url"
echo "Date Dash:    $fecha_dash"
echo "Date Slash:   $fecha_slash"
echo "File Name:    $file_name"
echo "URL:          $url"
echo

read -p "Create with these values? "
if [[ $REPLY =~ ^[Yy]$ ]] ; then

cat > $file_name <<EOF
---
author: sonia
draft: false
date: $fecha_dash
url: $url
title: $title
categories:
- Linux
tags:
- TODO
---

leader

<!--more-->

content

{{< highlight bash >}}

{{< /highlight >}}

This is a link: [title](http://foo.com/bar)
EOF

fi
