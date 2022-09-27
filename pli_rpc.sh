#!/bin/bash

# Set Colour Vars
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color


FUNC_RPC_MENU(){

        while true; do
            echo -e "${GREEN}       ##${NC}"
            echo -e "${GREEN}       ##  This script sets the WS & RPC server configuration based on the selected option ${NC}"
            echo -e "${GREEN}       ##  below. The script will overwrite the existing values with those of the selected option ..${NC}"
            echo -e "${GREEN}       ##${NC}"
            echo
            echo -e "${GREEN}       ##  1 -- Set to 'pli.xdcrpc' option ${NC}"
            echo -e "${GREEN}       ##  2 -- Set to 'blocksscan' option ${NC}"
            echo -e "${GREEN}       ##  3 -- Set to 'icotokens' option ${NC}"
            echo -e "${GREEN}       ##  4 -- Set to 'pliws.xdcrpc' option ${NC}"
            echo
            read -t30 -r -p "       Enter the option NUMBER from the list above : " _RES_INPUT
            if [ $? -gt 128 ]; then
                #clear
                echo
                echo
                echo "      ....timed out waiting for user response - please select a NUMBER from the list... exiting"
                #echo "....timed out waiting for user response - proceeding as standard in-place restore to existing system..."
                echo
                #DR_RESTORE=false
                #FUNC_RPC_MENU;
                FUNC_EXIT_ERROR
            fi
            case $_RES_INPUT in
                1* ) 
                    VARVAL_RPC="https://pli.xdcrpc.com"
                    VARVAL_WSS="wss://pli.xdcrpc.com/ws"
                    break
                    ;;
                2* ) 
                    VARVAL_RPC="https://plirpc.blocksscan.io"
                    VARVAL_WSS="wss://pluginws.blocksscan.io"
                    break
                    ;;
                3* ) 
                    VARVAL_RPC="https://plixdcrpc.icotokens.net"
                    VARVAL_WSS="wss://plixdcwss.icotokens.net"
                    break
                    ;;
                4* ) 
                    VARVAL_RPC="https://pliws.xdcrpc.com"
                    VARVAL_WSS="wss://pliws1.xdcrpc.com"
                    break
                    ;;
                * ) echo -e "${RED}  please select a NUMBER from the list${NC}";;
            esac
        done
        FUNC_SET_FILE;
}


FUNC_SET_FILE(){

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
    FUNC_SED_FILE;
}  


FUNC_SED_FILE(){

#sed -i 's|^export ETH_URL.*|export ETH_URL='$VARVAL_WSS'|g' ~/plugin-deployment/$BASH_FILE2
sed  -i 's|^export ETH_URL.*|export ETH_URL='$VARVAL_WSS'|g' ~/plugin-deployment/$BASH_FILE2

cat ~/plugin-deployment/$BASH_FILE2 | grep ETH_URL

#sed -i 's|plirpc.blocksscan.io|pli.xdcrpc.com|g' ~/plugin-deployment/$BASH_FILE3
sed -i 's|https:\/\/.*\\|'$VARVAL_RPC'\\|g' ~/plugin-deployment/$BASH_FILE3

cat ~/plugin-deployment/$BASH_FILE3 | grep https

pm2 restart all
pm2 reset all
pm2 list

cat ~/plugin-deployment/$BASH_FILE2 | grep ETH_URL && cat ~/plugin-deployment/$BASH_FILE3 | grep https

}


FUNC_EXIT_ERROR(){
	exit 1
}

FUNC_RPC_MENU;