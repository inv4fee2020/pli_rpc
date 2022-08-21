#!/bin/bash

#The new RPC:  update 2_nodeStartPM2.sh
#https://pli.xdcrpc.com

#The new WS:  update 3_initiatorStartPM2.sh
#wss://pli.xdcrpc.com/ws

BASH_FILE2="2_nodeStartPM2.sh"
BASH_FILE3="3_initiatorStartPM2.sh"

#    sed -i 's/^API_PASS.*/API_PASS='"${_AUTOGEN_API_PWD}"'/g' ~/"plinode_$(hostname -f)".vars

sed -i 's|^export ETH_URL.*|export ETH_URL=wss://pli.xdcrpc.com/ws|g' ~/plugin-deployment/$BASH_FILE2
cat $BASH_FILE2 | grep ETH_URL

sed -i 's|plirpc.blocksscan.io|pli.xdcrpc.com|g' ~/plugin-deployment/$BASH_FILE3
cat $BASH_FILE3 | grep https
