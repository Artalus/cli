#!/bin/bash

set -e
set -x

if [[ "$(uname -s)" == 'Darwin' ]]; then
    curdir=`pwd`
    cd /usr/local/Homebrew/
    if [[ -d Library/Taps/homebrew/homebrew-cask ]]; then
        rm -rf Library/Taps/caskroom/homebrew-cask
    fi
    for d in `find $(pwd) -type d -name .git`; do
        cd `dirname $d`
        git clean -fxd
    done
    brew cleanup
    cd $curdir

    brew update
    brew outdated pyenv || brew upgrade pyenv
    brew install pyenv-virtualenv
    brew install cmake || true

    if which pyenv > /dev/null; then
        eval "$(pyenv init -)"
    fi

    time pyenv install 2.7.10 --skip-existing
    time pyenv virtualenv 2.7.10 conan --force
    time pyenv rehash
    time pyenv activate conan

    ls -al $HOME/Library/Caches/pip/*

    # rm -rf $HOME/.pyenv/versions/2.7.10/envs/conan/lib/python2.7/site-packages/*.dist-info
fi

time pip install conan --upgrade
time pip install conan_package_tools --upgrade
time pip uninstall conan-package-tools -y
time pip install --index-url https://test.pypi.org/simple/ artalus-copato
if [[ "$(uname -s)" == 'Darwin' ]]; then
    ls -al $HOME/.pyenv/versions/2.7.10/envs/conan/lib/python2.7/site-packages
    ls -al $HOME/.pyenv/versions/2.7.10/envs/conan/lib/python2.7/
    ls -al $HOME/.pyenv/versions/2.7.10/envs/conan/lib/
    ls -al $HOME/.pyenv/versions/2.7.10/envs/conan/
    ls -al $HOME/.pyenv/versions/2.7.10/envs/
    ls -al $HOME/.pyenv/versions/2.7.10/
fi
conan user
