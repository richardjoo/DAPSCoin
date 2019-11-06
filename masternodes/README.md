# Masternodes
## Initial setup
  * If you are setting up a masternode for the first time, it is very important to follow DAPS official documents.
    - If you haven't swapped your DAPS Tokens, please swap first by visiting [DAPS Official web site](https://officialdapscoin.com/) and follow the instruction carefully.
    - Download and setup your QT Wallet
      - [Offical DAPS Wallet downloads](https://officialdapscoin.com/daps-mainnet-downloads/)
    - After succuessfully setting up and running the QT Wallet, follow this instruction to setup the server first.
      - [DAPS Masternode Information/Instructions](https://officialdapscoin.com/masternodes/)
        - This is extremely important that you follow step by step to make sure you do not miss anything.

<br><br>
## My server crashes, what should I do?
  * I give full credit to @Daps_Spain on how to fix this issue.  He helped me with everything below.  Thanks @Daps_Spain! :D
  * Version 1.0.3.4 (the most current as of 2019-11-05) requires some tweaking server to avoid from servers to crash in some cases.
    - when you apply these suggestions listed below, I strongly recommend reboot your server(s)
      - stop the dapscoin daemon if it is running
        - `dapscoin-cli stop`
      - restart the server
        - `sudo reboot now`

### add or increase swap memory
  * follow any instruction you can find from the internet or click the link below and follow the instruction to add or increase your server's swap memory
    - https://itsfoss.com/create-swap-file-linux/

### Change the swappiness to 10
  * the default value of `wm.swappiness` is 60 and change it to 10
    - use your preferred editor such as nano, vi, or vim to modify this file
    - `sudo vim /etc/sysctl.conf`
      - either add or update to `vm.swappiness=10`

### apply memory clean script to cron job
  - `sudo su`
  - `cd /bin/`
  - `vim cleanmemory.sh` to create a new file
    - paste this code

      ```
        #!/bin/bash
        sync ; echo 3 > /proc/sys/vm/drop_caches
        swapoff -a && swapon -a
      ```
    - save and quit
      - type `:wq` then hit ENTER
  - make it executable file
    - `chmod +x cleanmemory.sh`
  - Add this to the cron job
    - `sudo crontab -e`
      - add this line to the cron
        - `0 0-23/1 * * * /bin/cleanmemory.sh`
      - save and exit
        - type `:wq` then hit ENTER

### [OPTIONAL but recommended] run or activate zRam
  - To activate it, type in terminal:
    - `sudo apt-get install zram-config`
  - To remove [type the following]:
    - `sudo dpkg --purge zramswap-enabler`
    - `sudo dpkg --purge zram-config`
  - reboot the server
  - To confirm running after the reboot
    - type `cat /proc/swaps`
  - reboot to ensure it is running after the reboot
