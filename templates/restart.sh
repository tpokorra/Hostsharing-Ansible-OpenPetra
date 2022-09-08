#!/bin/bash

$HOME/bin/stop-openpetra.sh
killall -u `whoami` mono
$HOME/bin/start-openpetra.sh
