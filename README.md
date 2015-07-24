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
