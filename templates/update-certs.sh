#!/bin/bash

. ~/mono/env.sh
rm -Rf ~/.config/.mono/
(curl -L https://curl.se/ca/cacert.pem > ~/cacert.pem && cert-sync --user  ~/cacert.pem) || exit -1

# test with:
# csharp -e 'new System.Net.WebClient ().DownloadString ("https://kontocheck.solidcharity.com")'
