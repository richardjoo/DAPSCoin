# Setting Server for the Multiple Masternodes
  * This instruction is for the fresh installation.
  * This is specifically for my needs.
  * Some people may find few points unnecessary
  * I have used this setup on vultre.com servers.
  * This is based on 30 multiple masternodes on 4 CPU / 4GB RAM.
  * If you need only 5 masternodes, then it would be on 1 CPU / 1GB RAM and add allowed ports up to 53577
  * Instruction on setting up actual masternodes will be added to this page soon.

<br><br>
## Update your server
  * `sudo apt update && apt upgrade -y`

<br><br>
## Adding a new user
  * You do not have to, but I usually create a new user and disable the `root` account from ssh access.  The number one ssh hack attacks happen with root access
  * add a new user YOUR-OWN-USER-NAME
    - `sudo useradd YOUR-OWN-USER-NAME -m -s /bin/bash`
    - `sudo passwd YOUR-OWN-USER-NAME`
    - `adduser YOUR-OWN-USER-NAME sudo`
  * Log out and log back in as your own username to make sure it works
  * disable root ssh login
    - Open up the `sshd_config` file
      - `sudo vim /etc/ssh/sshd_config`
    - Scroll down and find `PermitRootLogin yes` and change it to `no`
      - `PermitRootLogin yes`  ----->  `PermitRootLogin no`
    - Two line down from it, it has commented line says `#MaxAuthTries 6`
      - either uncomment it or change it to 3.  I usually set it to 3
      - `MaxAuthTries 3`
    - Now restart the ssh
      - `sudo service ssh restart`
  * restart the server after confirming that you can login as non-root user
    - `sudo reboot now`

<br><br>
## Securing your server
  * securing the server
    - `sudo apt-get update && sudo apt-get upgrade -y`
    - install fail2ban
      - `sudo apt-get install fail2ban -y`

<br><br>
## Enabling the firewall and adding ports for your masternodes.
  * In this case, I am adding 31 ports for 30 masternodes. 52572 and 53573 are default for Dapscoin to communicate. Thus, 31 total ports.
    - Allow SSH and DAPScoin ports in Uncomplicated Firewall (UFW):
      - `sudo ufw allow ssh`
      - `sudo ufw allow 53572`
      - `sudo ufw allow 53573`
      - `sudo ufw allow 53574`
      - `sudo ufw allow 53575`
      - `sudo ufw allow 53576`
      - `sudo ufw allow 53577`
      - `sudo ufw allow 53578`
      - `sudo ufw allow 53579`
      - `sudo ufw allow 53580`
      - `sudo ufw allow 53581`
      - `sudo ufw allow 53582`
      - total 10 nodes so far
      - `sudo ufw allow 53583`
      - `sudo ufw allow 53584`
      - `sudo ufw allow 53585`
      - `sudo ufw allow 53586`
      - `sudo ufw allow 53587`
      - `sudo ufw allow 53588`
      - `sudo ufw allow 53589`
      - `sudo ufw allow 53590`
      - `sudo ufw allow 53591`
      - `sudo ufw allow 53592`
      - total 20 nodes so far
      - `sudo ufw allow 53593`
      - `sudo ufw allow 53594`
      - `sudo ufw allow 53595`
      - `sudo ufw allow 53596`
      - `sudo ufw allow 53597`
      - `sudo ufw allow 53598`
      - `sudo ufw allow 53599`
      - `sudo ufw allow 53600`
      - `sudo ufw allow 53601`
      - `sudo ufw allow 53602`
      - total 30 nodes up to here
    - Enable UFW with this command and you are all set:
      - `sudo ufw enable`

<br><br>
## Adding hourly memory cleaning to the cron
  * apply memory clean cron
    - `sudo su`
    - `cd /bin/`
    - `vim cleanmemory.sh`

    ```
      #!/bin/bash
      sync ; echo 3 > /proc/sys/vm/drop_caches
      swapoff -a && swapon -a
    ```

    - `chmod +x cleanmemory.sh`


    - `sudo crontab -e`
    ```
      0 0-23/1 * * * /bin/cleanmemory.sh
    ```

<br><br>
## Managing Swap memory
  * Apply swap
    - https://itsfoss.com/create-swap-file-linux/
    - on my case, I am using 5GB swap space
      - `sudo fallocate -l 5G /swapfile`
    - `sudo chmod 600 /swapfile`
    - `sudo mkswap /swapfile`
    - `sudo swapon /swapfile`
    - check your settings now
      - `swapon --show`
      - `free -h`
    - make changes to permanent
      - `sudo cp /etc/fstab /etc/fstab.back`
    - `sudo vim /etc/fstab`
      - add this to the end of the line
        - `/swapfile none swap sw 0 0`
    - change the swapiness
      - `sudo vim /etc/sysctl.conf`
      - add this line to the end of the file
        - `vm.swappiness=10`
  * At this point, you want to restart the server and check to make sure your settings have been applied properly.
    - `sudo reboot now`
  * Once you log back in, check the settings
    - `free -h` to check swap file
    - `cat /proc/sys/vm/swappiness` to check your swappiness is set to 10

<br><br>
## zRam - Optional
  * This one is optional but I do set this up.
  * apply zRam
    - To activate it, type in terminal:
      - `sudo apt-get install zram-config`
    - To remove [type the following]:
      - `sudo dpkg --purge zramswap-enabler`
      - `sudo dpkg --purge zram-config`
    - To confirm running
      - `cat /proc/swaps`
    - reboot to ensure it is running after the reboot
      - `sudo reboot now`







