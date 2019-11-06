# My server crashes, what should I do?
### I give full credit to @Daps_Spain on how to fix this issue.  He helped me with everything below.  Thanks @Daps_Spain! :D
  * Version 1.0.3.4 (the most current as of 2019-11-05) requires some tweaking server to avoid from servers to crash in some cases.
    - when you apply these suggestions listed below, I strongly recommend reboot your server(s)
      - stop the dapscoin daemon if it is running
        - `dapscoin-cli stop`
      - restart the server
        - `sudo reboot now`

<br><br>

### add or increase swap memory
  * follow any instruction you can find from the internet or click the link below and follow the instruction to add or increase your server's swap memory
    - https://itsfoss.com/create-swap-file-linux/

### Change the swappiness to 10
  * the default value of `wm.swappiness` is 60 and change it to 10
    - use your preferred editor such as nano, vi, or vim to modify this file
    - `sudo vim /etc/sysctl.conf`
      - either add or update to `vm.swappiness=10`

### Adjust maxconnection to 128 or 64
  - stop the daemon
    - `dapscoin-cli stop`
  - go to the directory
    - `cd ~/.dapscoin`
  - if you have multiple nodes running, then it would be something like `cd ~/.dapscoin00`, `cd ~/.dapscoin01`, `cd ~/.dapscoin02`, `cd ~/.dapscoin03`, etc.
  - `vim dapscoin.conf`
    - I like vim as my editor. You can use nano, emacs, or vi or whatever you like.
  - find `maxconnections=256` and change it to `maxconnections=64` or `maxconnections=128` and it would look like the example below (this is multiplenode setup)

    ```
      rpcuser=YOUR-USER-NAME
      rpcpassword=YOUR-PASSWORD
      rpcallowip=127.0.0.1
      rpcport=YOUR-RPCPORT
      listen=0
      server=1
      daemon=1
      logtimestamps=1
      maxconnections=64
      masternode=1
      externalip=[YOUR-EXTERNAL-IP]
      bind=[YOUR-EXTERNAL-IP]:53572
      masternodeaddr=[YOUR-EXTERNAL-IP]:53572
      masternodeprivkey=YOUR-MASTERNODEPRIVKEY
      datadir=/home/your-username/.dapscoin06
      wallet=wallet06.dat
    ```
  - `:wq` to save and exit
  - start the daemon again

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
