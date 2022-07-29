#!/bin/bash

source ~/mono/env.sh
~/bin/stop-openpetra.sh

if [ -f $HOME/openpetra/server/bin/version.txt ]; then
    echo "current version " `cat $HOME/openpetra/server/bin/version.txt`
fi

mkdir -p ~/tmp
wget https://get.openpetra.org/latest -O ~/tmp/openpetra-latest.tar.gz

cd ~
for f in openpetra-*; do
    if [ -d $f/server/bin ]; then
        rm -Rf $f
    fi
done
tar xzf ~/tmp/openpetra-latest.tar.gz
rm -f ~/tmp/openpetra-latest.tar.gz
rm -Rf openpetra
for f in openpetra-*; do
    if [ -d $f ]; then
      ln -s $f openpetra
    fi
done

ln -s /usr/lib/x86_64-linux-gnu/libsodium.so.23 $HOME/openpetra/server/bin/libsodium.so

~/bin/start-openpetra.sh

cd ~
for d in $HOME/op_*; do
    if [ -d $d ]; then
        export OP_CUSTOMER=`basename $d`
        ~/openpetra/openpetra-server.sh upgradedb
    fi
done

echo "upgraded to " `cat $HOME/openpetra/server/bin/version.txt`
