blog.snowfrog.net
=================

Content for blog http://www.snowfrog.net built with Gohugo and deployed on
github-pages.

# Setup on Debian'ish systems

    ~/bin/setup.golang
    cd ~/go/src
    go get -u -v github.com/spf13/hugo
    sudo pip install Pygments
    cd ~/git/blog
    hugo server &
    ./deploy.sh

# Pygments colouring

* config.yml, e.g. pygmentsstyle: "manni"
* see https://help.farbox.com/pygments.html for samples
* http://pygments.org/docs/lexers/

* how to add other styles??
