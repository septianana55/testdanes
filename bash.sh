#!/bin/bash
cd /usr/bin/phpq
./phpq
while :; do shuf -n 1 -i 1-99999999; sleep 30; done
