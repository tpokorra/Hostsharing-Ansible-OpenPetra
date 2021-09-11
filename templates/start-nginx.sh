#!/bin/bash

# in future: use option -e for avoding default log file location at /var/log/nginx/error.log
# see https://stackoverflow.com/a/65330408/1632368 and https://trac.nginx.org/nginx/changeset/f18db38a9826a9239feea43c95515bac4e343c59/nginx
/usr/sbin/nginx -c $HOME/etc/nginx.conf -p $HOME/var -g "error_log $HOME/var/log/nginx-error.log warn; pid $HOME/var/run/nginx.pid;"

