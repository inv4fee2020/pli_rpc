# pli_rpc
RPC endpoint update script

Simple script to update an existing plugin node installation rpc & ws endpoints that were configured using either official goplugin or inv4fee2020 github repositories.


## What does this script do?

The script is designed to find the two files in the main `plugin-deployment` folder that hold the WSS & RPC strings. 

It then updates the strings to use the selected RPC & WS endpoints from the options list. As part of this process the script also attempts to find the correct filenames that need to be updated.


The filenames used in both the official GoPlugin & Inv4Fee2020 repositories are as follows;

        2_nodeStartPM2.sh
        3_initiatorStartPM2.sh

Other filenames that have been used, which the script checks for are as follows;

        startNode.sh
        startEI.sh

Once the correct filenames are located the string values are updated.


## How to run the script

```
 cd $HOME
 git clone https://github.com/inv4fee2020/pli_rpc.git
 cd pli_rpc
 chmod +x *.sh
 
 ./pli_rpc.sh 

 ```


## Refreshing your local repo

As the code is updated it will be necessary to update your local repo from time to time. To do this you have two options;


1. Force git to update the local repo by overwriting the local changes, which in this case are the file permission changes. Copy and paste the following code;
        
        cd ~/pli_rpc
        git fetch
        git reset --hard HEAD
        git merge '@{u}'
        chmod +x *.sh