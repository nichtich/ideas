#!/bin/bash
set -e

GHI=~/bin/ghi
GHI_URL=https://github.com/drazisil/ghi/raw/master/ghi

if [ -x "$GHI" ] && [ "$1" != "-f" ]; then
    echo "ghi already installed at $GHI. Use option -f to reinstall!"
    exit
fi

wget -O "$GHI" "$GHI_URL"
chmod +x "$GHI"

GHI_VERSION=$(ghi --version)
echo "installed $GHI_VERSION"

git config --global ghi.pager cat
git config --global ghi.token > /dev/null \
    || echo "run 'ghi config --auth <username>' for authentification!"
