---
title: Setting up Gitweb on your Ubuntu workstation
author: Sonia Hamilton
date: 2011-08-02
url: /2011/08/02/setting-up-gitweb-on-your-ubuntu-workstation/
categories:
  - Linux
tags:
  - Git
---
If you work in an IT environment, it&#8217;s nice to be able to quickly share some of your git repositories from your workstation, without setting up accounts and ssh keys ie using http. Unfortunately, a lot of the posts out there on &#8220;how to setup Gitweb on Ubuntu&#8221; seem to make a meal of the whole process. I got it going after heading down a few dead-ends; here&#8217;s how I did it on Ubuntu 11.04 (Natty).

## Basic Setup

Let&#8217;s start with a simple git repository:

<pre class="brush: bash; title: ; notranslate" title="">sudo aptitude install git-all apache2
cd ; git init foo ; cd foo
echo "hello world" &gt; file1.txt
git add . ; git commit -m "initial commit"
</pre>

You probably only want to share out *some* of your repositories, not all of ${HOME}! So, do a bare clone of foo repository to /var/www:

<pre class="brush: bash; title: ; notranslate" title="">cd /var/www
sudo git clone --bare ~/foo foo.git
</pre>

Next, a little gotcha. You need to enable the **post-update** hook, so that the required info is generated for the http server. The &#8220;gotcha&#8221; is that you need to enable the hook **then** do a push to your server repository, otherwise the server info isn&#8217;t updated:

<pre class="brush: bash; title: ; notranslate" title="">cd ~/foo/.git/hooks
mv post-update.sample post-update
git remote add web /var/www/foo.git
## do a test push
cd ~/foo
echo "test update" &gt;&gt; file1.txt
git add . ; git commit -m "test update"
sudo git push web
</pre>

Now, if you browse to <http://localhost> you should see foo.git listed, and your workmates can now easily clone your work:

<pre class="brush: bash; title: ; notranslate" title="">otherpc$ git clone http://yourpc/foo.git
</pre>

## Gitweb

The next step is to setup **gitweb**, so your workmates can easily browse your code, search for commits, etc. Gitweb is already installed as part of **git-all**, or you can do:

<pre class="brush: bash; title: ; notranslate" title="">sudo aptitude install gitweb
</pre>

The only change to make is to edit **/etc/gitweb.conf** to point to **/var/www**:

<pre class="brush: bash; title: ; notranslate" title="">sudo vi /etc/gitweb.conf
...
## $projectroot = "/var/cache/git";
$projectroot = "/var/www";
...
</pre>

And that&#8217;s it! Part of the gitweb install on Ubuntu adds in **/etc/apache2/conf.d/gitweb**, so there&#8217;s no other files to edit (unlike what [blog1][1], [blog2][2], or [blog3][3] say).

Browse to <http://localhost/gitweb/>, and there&#8217;s your browse-able, search-able, git repository :-D

## But wait, there&#8217;s more &#8211; automatically push your changes&#8230;

As you work, /var/www/foo.git is going to get out-of-date. You could remember to regularly push but that&#8217;s boring &#8211; automate it:

<pre class="brush: bash; title: ; notranslate" title="">% cd ~/foo ; cat git.web.push
#!/bin/bash
cd ${HOME}/foo
git remote add web /var/www/foo.git &gt;& /dev/null
sudo git push -f web
</pre>

&#8230;and automate it:

<pre class="brush: bash; title: ; notranslate" title="">crontab -l
* * * * * ${HOME}/foo/git.web.push
</pre>

## And finally&#8230;

Make the layout pretty. Edit **~/foo/.git/description**, add an index.html, a custom theme, some javascript, &#8230;

## Update

Brian (comments) has added some improvements to my instructions &#8211; see below. Thanks Brian!

 [1]: http://blog.jeffreyforman.net/2009/07/21/configuring-gitweb-on-ubuntu/
 [2]: http://blog.phlegx.com/2010/03/07/install-and-setup-gitweb-in-ubuntu-9-10-on-apache/
 [3]: http://gideontsang.wordpress.com/2009/10/13/gitweb-on-ubuntujaunty/
