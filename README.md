# pli_rpc
RPC endpoint update script

Simple script to update an existing plugin node installation rpc & ws endpoints that were configured using either official goplugin or inv4fee2020 github repositories.


## What does this script do?

The script is designed to find the two files in the main `plugin-deployment` folder that hold the following strings; 

        export ETH_URL
        plirpc.blocksscan.io

It then updates the strings to use the latest RPC & WS endpoints. As part of this process the script also attempted to find the correct filenames that need to be updated.

The filenames used in both the official GoPlugin & Inv4Fee2020 repositories are as follows;

        2_nodeStartPM2.sh
        3_initiatorStartPM2.sh

Other filenames that have been used, which the script checks for are as follows;

        startNode.sh
        startEI.sh

Once the correct filenames are located

## How to run the script

```
 cd $HOME
 git clone https://github.com/inv4fee2020/pli_rpc.git
 cd pli_rpc
 chmod +x *.sh
 
 ./pli_rpc.sh 

 ```

