#!/bin/bash
set -e
set -x

if [[ "$(uname -s)" == 'Darwin' ]]; then
    cd $HOME/.pyenv/versions/2.7.10/envs/conan
    rm -rf lib/python2.7/site-packages/*.dist-info # to ensure pip reinstalls everything even if we forgot --force-reinstall flag

    # to omit cache regeneration on every build
    for f in `find . -name '*.pyc'`; do
      rm $f
    done
fi

cd $HOME/.conan/data
rm -rf cli
