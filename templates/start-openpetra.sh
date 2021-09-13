#!/bin/bash

cd $HOME/openpetra/server
. $HOME/mono/env.sh
#  --verbose \
#  --loglevels=All \
exec fastcgi-mono-server4 \
  /socket=tcp:127.0.0.1:{{monoport}} \
  /applications=/:$HOME/openpetra/server \
  /appconfigfile=$HOME/etc/common.config \
  --logfile=$HOME/var/log/monoserver.log \
  --loglevels=Standard \
  > /dev/null 2>&1 &
echo $! > $HOME/var/run/openpetra.pid

