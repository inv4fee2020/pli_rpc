#!/bin/bash

# Set Colour Vars
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo
echo
echo
echo 'Node Logs!!!!!';cat -n ~/.pm2/logs/2-nodeStartPM2-error.log  | grep -E 'HTTP status|ERROR|error';date -u +"%Y-%m-%dT%H:%M:%SZ"
echo
echo

echo
echo
echo
echo
echo 'EI Logs!!!!!!!!';cat -n ~/.pm2/logs/3-initiatorStartPM2-error.log  | grep -E 'HTTP status|ERROR|error';date -u +"%Y-%m-%dT%H:%M:%SZ"
