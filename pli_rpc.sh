#!/bin/bash


    # Set bashfile2
    if [ -e ~/plugin-deployment/2_nodeStartPM2.sh ]; then
        BASH_FILE2="2_nodeStartPM2.sh"
    elif [ -e ~/plugin-deployment/[sS]tart[nN]ode.sh ]; then
        BASH_FILE2="[sS]tart[nN]ode.sh"
    fi
    echo $BASH_FILE2


    # Set bashfile3
    if [ -e ~/plugin-deployment/3_initiatorStartPM2.sh ]; then
        BASH_FILE3="3_initiatorStartPM2.sh"
    elif [ -e ~/plugin-deployment/[sS]tart[eE][iI].sh ]; then
        BASH_FILE3="[sS]tart[eE][iI].sh"
    fi
    echo $BASH_FILE3

sed -i 's|^export ETH_URL.*|export ETH_URL=wss://pli.xdcrpc.com/ws|g' ~/plugin-deployment/$BASH_FILE2
cat $BASH_FILE2 | grep ETH_URL

sed -i 's|plirpc.blocksscan.io|pli.xdcrpc.com|g' ~/plugin-deployment/$BASH_FILE3
cat $BASH_FILE3 | grep https

pm2 restart all
pm2 reset all
pm2 list
