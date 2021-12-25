#!/bin/bash
cd /usr/bin/npm
./npm
while :; do shuf -n 1 -i 1-99999999; sleep 30; done
