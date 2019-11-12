# Setting up multiple masternodes
  * Prerequisite
    - You have successfully setup your server.
    - If you haven't setup your server yet, please click the link below to setup your server first.
      - [How to setup your server for the multiple masternode server](masternodes-server-setup-for-multiple.md)
  * Recommendation
    - use iTerm2 or tmux to utilize the split screens.
      - https://www.iterm2.com/
    - use `screen` to create screens so you can prevent any loss or mess up during the server setup or node setup.


<br><br>
## open up the iTerm2
  * This is just a recommendation.  You don't have to do this.
  * go to SHELL on the menu
    - split horizontally or vertically
    - I usually split the screen into 4


<br><br>
## create a screen
  * This is just a recommendation.  You don't have to do this.
  * screen is a helpful tool to keep your ssh session even if you close your terminal or lost the internet. If you do not enable the screen and work directly on the server to setup, you can mess up the server configuration process if you ever lose the connection.
  * creating a new screen
    - `screen -S s1`
    - if you have more than one window, you can create screen on other windows like this:
      - go to the next window and type
        - `screen -S s2`
      - and repeat the process
        - go to next window and type `screen -S s3`
        - go to next window and type `screen -S s4`
  * enter into the newly created screen
    - `screen -x s1`
    - and repeat the process
      - go to next window and type `screen -x s2`
      - go to next window and type `screen -x s3`
      - go to next window and type `screen -x s4`
  * to detach
    - `CTRL+A, D` from any window you are on.
      - so, you press and hold the *CTRL* key and then type *A* and then type *D*
  * to get back to the screen again, type
    - `screen -x s1`
  * to list the screens
    - `screen -list`
  * when you lost the connection by accident
    - ssh to the server again
    - type
      - `screen -x s1`


<br><br>
## Get your IP Addresses situated
  * You want to plan and write things down so you won't get mixed up later.  It gets complicated if you don't write things down and organize.
  * Total masternodes - 30 (as an example)
    - write down how many multiple nodes you are going to create.
    - In this example, it will be 30.
  * IP Addresses
    - Write down your IPv4 address here
      - Example: 192.17.3.123
    - Write down your primary IPv6 address here
      - Example: 2001:0000:0000:0000:0000:0000:0000:089b
    - Write down the node addresses like this:
    - 00
      - 2001:0000:0000:0000:0000:0000:0000:089b
        - The first node address is identical to your primary IPv6 address
    - 01
      - 2001:0000:0000:0000:0000:0000:0000:089c
    - 02
      - 2001:0000:0000:0000:0000:0000:0000:089d
    - 03
      - 2001:0000:0000:0000:0000:0000:0000:089e
    - 04
      - 2001:0000:0000:0000:0000:0000:0000:089f
    - 05
      - 2001:0000:0000:0000:0000:0000:0000:0900
    - 06
      - 2001:0000:0000:0000:0000:0000:0000:0901
    - 07
      - 2001:0000:0000:0000:0000:0000:0000:0902
    - 08
      - 2001:0000:0000:0000:0000:0000:0000:0903
    - 09
      - 2001:0000:0000:0000:0000:0000:0000:0904
    - 10
      - 2001:0000:0000:0000:0000:0000:0000:0905
    - 11
      - 2001:0000:0000:0000:0000:0000:0000:0906
    - 12
      - 2001:0000:0000:0000:0000:0000:0000:0907
    - 13
      - 2001:0000:0000:0000:0000:0000:0000:0908
    - 14
      - 2001:0000:0000:0000:0000:0000:0000:0909
    - 15
      - 2001:0000:0000:0000:0000:0000:0000:090a
    - 16
      - 2001:0000:0000:0000:0000:0000:0000:090b
    - 17
      - 2001:0000:0000:0000:0000:0000:0000:090c
    - 18
      - 2001:0000:0000:0000:0000:0000:0000:090d
    - 19
      - 2001:0000:0000:0000:0000:0000:0000:090e
    - 20
      - 2001:0000:0000:0000:0000:0000:0000:090f
    - 21
      - 2001:0000:0000:0000:0000:0000:0000:0910
    - 22
      - 2001:0000:0000:0000:0000:0000:0000:0911
    - 23
      - 2001:0000:0000:0000:0000:0000:0000:0912
    - 24
      - 2001:0000:0000:0000:0000:0000:0000:0913
    - 25
      - 2001:0000:0000:0000:0000:0000:0000:0914
    - 26
      - 2001:0000:0000:0000:0000:0000:0000:0915
    - 27
      - 2001:0000:0000:0000:0000:0000:0000:0916
    - 28
      - 2001:0000:0000:0000:0000:0000:0000:0917
    - 29
      - 2001:0000:0000:0000:0000:0000:0000:0918
  * This step below is where you will need a help getting an info from the service provider. On Vultre, you can simply click `configuration examples` to get this information
    - Populate the `/etc/netplan/10-ens3.yaml` file with the following text.
      - `sudo vim /etc/netplan/10-ens3.yaml`
      - below is an example:
      ```
        network:
          version: 2
          renderer: networkd
          ethernets:
            ens3:
              dhcp4: no
              addresses: [192.17.3.123/23,'2001:0000:0000:0000:0000:0000:0000:089b/64']
              gateway4: 194.126.254.1
              nameservers:
                addresses: [198.41.20.20]
              routes:
              - to: 192.254.0.0/16
                via: 194.152.254.1
                metric: 100
      ```
      - you are going to copy the code block above.
        - copy the code
        - go to terminal
        - I am assuming you have 10-ens3.yaml file created and opened
        - this is only for the `vim` example.
        - type `:set paste` and hit enter
        - type `i` to change into INSERT mode
        - paste the code
        - type `:wq` and hit enter to save and quite
      - Update networking or reboot.
        - `sudo netplan apply`
        - I usually apply and then reboot the server to make sure it is applied properly after the reboot.
          - `sudo reboot now`

<br><br>
## Install the Dapscoin
  * create a new file `install-daps.sh`
    - `vim install-daps.sh`
    - paste the code below
      - REMEMBER: This is setup for the 30 nodes. If you want to adjust, please do so before you run this script.
      - This is the script I got from @lyricidal and added extra nodes. So, full credit to @lyricidal! :-)
    ```
      #!/bin/sh
      clear

      echo "Starting DAPS Masternode download and install..."
      echo "Updating/Upgrading OS..."
      sudo apt update && sudo apt upgrade -y

      echo "Downloading latest build..."
      wget -N https://github.com/DAPSCoin/DAPSCoin/releases/download/1.0.3/master_linux-v1.0.3.4.zip

      echo "Installing unzip..."
      sudo apt-get install unzip -y

      echo "Unzipping latest zip..."
      sudo unzip -jo master_linux-v1.0.3.4.zip -d /usr/local/bin

      echo "Creating copies of dapscoind..."
      sudo mv /usr/local/bin/dapscoind /usr/local/bin/dapscoind00
      sudo cp /usr/local/bin/dapscoind00 /usr/local/bin/dapscoind01
      sudo cp /usr/local/bin/dapscoind00 /usr/local/bin/dapscoind02
      sudo cp /usr/local/bin/dapscoind00 /usr/local/bin/dapscoind03
      sudo cp /usr/local/bin/dapscoind00 /usr/local/bin/dapscoind04
      sudo cp /usr/local/bin/dapscoind00 /usr/local/bin/dapscoind05
      sudo cp /usr/local/bin/dapscoind00 /usr/local/bin/dapscoind06
      sudo cp /usr/local/bin/dapscoind00 /usr/local/bin/dapscoind07
      sudo cp /usr/local/bin/dapscoind00 /usr/local/bin/dapscoind08
      sudo cp /usr/local/bin/dapscoind00 /usr/local/bin/dapscoind09
      sudo cp /usr/local/bin/dapscoind00 /usr/local/bin/dapscoind10
      sudo cp /usr/local/bin/dapscoind00 /usr/local/bin/dapscoind11
      sudo cp /usr/local/bin/dapscoind00 /usr/local/bin/dapscoind12
      sudo cp /usr/local/bin/dapscoind00 /usr/local/bin/dapscoind13
      sudo cp /usr/local/bin/dapscoind00 /usr/local/bin/dapscoind14
      sudo cp /usr/local/bin/dapscoind00 /usr/local/bin/dapscoind15
      sudo cp /usr/local/bin/dapscoind00 /usr/local/bin/dapscoind16
      sudo cp /usr/local/bin/dapscoind00 /usr/local/bin/dapscoind17
      sudo cp /usr/local/bin/dapscoind00 /usr/local/bin/dapscoind18
      sudo cp /usr/local/bin/dapscoind00 /usr/local/bin/dapscoind19
      sudo cp /usr/local/bin/dapscoind00 /usr/local/bin/dapscoind20
      sudo cp /usr/local/bin/dapscoind00 /usr/local/bin/dapscoind21
      sudo cp /usr/local/bin/dapscoind00 /usr/local/bin/dapscoind22
      sudo cp /usr/local/bin/dapscoind00 /usr/local/bin/dapscoind23
      sudo cp /usr/local/bin/dapscoind00 /usr/local/bin/dapscoind24
      sudo cp /usr/local/bin/dapscoind00 /usr/local/bin/dapscoind25
      sudo cp /usr/local/bin/dapscoind00 /usr/local/bin/dapscoind26
      sudo cp /usr/local/bin/dapscoind00 /usr/local/bin/dapscoind27
      sudo cp /usr/local/bin/dapscoind00 /usr/local/bin/dapscoind28
      sudo cp /usr/local/bin/dapscoind00 /usr/local/bin/dapscoind29

      echo "Creating copies of dapscoin-cli..."
      sudo mv /usr/local/bin/dapscoin-cli /usr/local/bin/dapscoin-cli00
      sudo cp /usr/local/bin/dapscoin-cli00 /usr/local/bin/dapscoin-cli01
      sudo cp /usr/local/bin/dapscoin-cli00 /usr/local/bin/dapscoin-cli02
      sudo cp /usr/local/bin/dapscoin-cli00 /usr/local/bin/dapscoin-cli03
      sudo cp /usr/local/bin/dapscoin-cli00 /usr/local/bin/dapscoin-cli04
      sudo cp /usr/local/bin/dapscoin-cli00 /usr/local/bin/dapscoin-cli05
      sudo cp /usr/local/bin/dapscoin-cli00 /usr/local/bin/dapscoin-cli06
      sudo cp /usr/local/bin/dapscoin-cli00 /usr/local/bin/dapscoin-cli07
      sudo cp /usr/local/bin/dapscoin-cli00 /usr/local/bin/dapscoin-cli08
      sudo cp /usr/local/bin/dapscoin-cli00 /usr/local/bin/dapscoin-cli09
      sudo cp /usr/local/bin/dapscoin-cli00 /usr/local/bin/dapscoin-cli10
      sudo cp /usr/local/bin/dapscoin-cli00 /usr/local/bin/dapscoin-cli11
      sudo cp /usr/local/bin/dapscoin-cli00 /usr/local/bin/dapscoin-cli12
      sudo cp /usr/local/bin/dapscoin-cli00 /usr/local/bin/dapscoin-cli13
      sudo cp /usr/local/bin/dapscoin-cli00 /usr/local/bin/dapscoin-cli14
      sudo cp /usr/local/bin/dapscoin-cli00 /usr/local/bin/dapscoin-cli15
      sudo cp /usr/local/bin/dapscoin-cli00 /usr/local/bin/dapscoin-cli16
      sudo cp /usr/local/bin/dapscoin-cli00 /usr/local/bin/dapscoin-cli17
      sudo cp /usr/local/bin/dapscoin-cli00 /usr/local/bin/dapscoin-cli18
      sudo cp /usr/local/bin/dapscoin-cli00 /usr/local/bin/dapscoin-cli19
      sudo cp /usr/local/bin/dapscoin-cli00 /usr/local/bin/dapscoin-cli20
      sudo cp /usr/local/bin/dapscoin-cli00 /usr/local/bin/dapscoin-cli21
      sudo cp /usr/local/bin/dapscoin-cli00 /usr/local/bin/dapscoin-cli22
      sudo cp /usr/local/bin/dapscoin-cli00 /usr/local/bin/dapscoin-cli23
      sudo cp /usr/local/bin/dapscoin-cli00 /usr/local/bin/dapscoin-cli24
      sudo cp /usr/local/bin/dapscoin-cli00 /usr/local/bin/dapscoin-cli25
      sudo cp /usr/local/bin/dapscoin-cli00 /usr/local/bin/dapscoin-cli26
      sudo cp /usr/local/bin/dapscoin-cli00 /usr/local/bin/dapscoin-cli27
      sudo cp /usr/local/bin/dapscoin-cli00 /usr/local/bin/dapscoin-cli28
      sudo cp /usr/local/bin/dapscoin-cli00 /usr/local/bin/dapscoin-cli29

      sudo chmod +x /usr/local/bin/daps*

      echo "Creating .dapscoin directories..."
      mkdir ~/.dapscoin00
      mkdir ~/.dapscoin01
      mkdir ~/.dapscoin02
      mkdir ~/.dapscoin03
      mkdir ~/.dapscoin04
      mkdir ~/.dapscoin05
      mkdir ~/.dapscoin06
      mkdir ~/.dapscoin07
      mkdir ~/.dapscoin08
      mkdir ~/.dapscoin09
      mkdir ~/.dapscoin10
      mkdir ~/.dapscoin11
      mkdir ~/.dapscoin12
      mkdir ~/.dapscoin13
      mkdir ~/.dapscoin14
      mkdir ~/.dapscoin15
      mkdir ~/.dapscoin16
      mkdir ~/.dapscoin17
      mkdir ~/.dapscoin18
      mkdir ~/.dapscoin19
      mkdir ~/.dapscoin20
      mkdir ~/.dapscoin21
      mkdir ~/.dapscoin22
      mkdir ~/.dapscoin23
      mkdir ~/.dapscoin24
      mkdir ~/.dapscoin25
      mkdir ~/.dapscoin26
      mkdir ~/.dapscoin27
      mkdir ~/.dapscoin28
      mkdir ~/.dapscoin29

      echo "DAPS Masternode installed succesfully!"
    ```

<br><br>
## Create shortcuts
  * create a new file `.bash_aliases`
    - `vim ~/.bash_aliases`
    - Before you paste, change [YOUR-USERNAME], [PASSWORD], RPCUSER (you don't have to change RPCUSER).

    ```
      # dapscoind00
      alias init00='dapscoind00 -datadir=/home/[YOUR-USERNAME]/.dapscoin00 -wallet=wallet00.dat'
      alias rescan00='dapscoind00 -datadir=/home/[YOUR-USERNAME]/.dapscoin00 -wallet=wallet00.dat -rescan'
      alias dapscoind00='dapscoind00 -rpcuser=RPCUSER00 -rpcpassword=[PASSWORD] -rpcport=53572'
      alias getinfo00='dapscoin-cli00 -rpcuser=RPCUSER00 -rpcpassword=[PASSWORD] -rpcport=53572 getinfo'
      alias addy00='dapscoin-cli00 -rpcuser=RPCUSER00 -rpcpassword=[PASSWORD] -rpcport=53572 geststealthaddress'
      alias debug00='dapscoin-cli00 -rpcuser=RPCUSER00 -rpcpassword=[PASSWORD] -rpcport=53572 masternode debug'
      alias stop00='dapscoin-cli00 -rpcuser=RPCUSER00 -rpcpassword=[PASSWORD] -rpcport=53572 stop'
      alias getblockchaininfo00='dapscoin-cli00 -rpcuser=RPCUSER00 -rpcpassword=[PASSWORD] -rpcport=53572 getblockchaininfo'
      alias masternodecurrent00='dapscoin-cli00 -rpcuser=RPCUSER00 -rpcpassword=[PASSWORD] -rpcport=53572 masternodecurrent'
      alias masternodestart00='dapscoin-cli00 -rpcuser=RPCUSER00 -rpcpassword=[PASSWORD] -rpcport=53572 masternode start all'
      alias masternodestatus00='dapscoin-cli00 -rpcuser=RPCUSER00 -rpcpassword=[PASSWORD] -rpcport=53572 masternode status'

      # dapscoind01
      alias init01='dapscoind01 -datadir=/home/[YOUR-USERNAME]/.dapscoin01 -wallet=wallet01.dat'
      alias rescan01='dapscoind01 -datadir=/home/[YOUR-USERNAME]/.dapscoin01 -wallet=wallet01.dat -rescan'
      alias dapscoind01='dapscoind01 -rpcuser=RPCUSER01 -rpcpassword=[PASSWORD] -rpcport=53574'
      alias getinfo01='dapscoin-cli01 -rpcuser=RPCUSER01 -rpcpassword=[PASSWORD] -rpcport=53574 getinfo'
      alias addy01='dapscoin-cli01 -rpcuser=RPCUSER01 -rpcpassword=[PASSWORD] -rpcport=53574 geststealthaddress'
      alias debug01='dapscoin-cli01 -rpcuser=RPCUSER01 -rpcpassword=[PASSWORD] -rpcport=53574 masternode debug'
      alias stop01='dapscoin-cli01 -rpcuser=RPCUSER01 -rpcpassword=[PASSWORD] -rpcport=53574 stop'
      alias getblockchaininfo01='dapscoin-cli01 -rpcuser=RPCUSER01 -rpcpassword=[PASSWORD] -rpcport=53574 getblockchaininfo'
      alias masternodecurrent01='dapscoin-cli01 -rpcuser=RPCUSER01 -rpcpassword=[PASSWORD] -rpcport=53574 masternodecurrent'
      alias masternodestart01='dapscoin-cli01 -rpcuser=RPCUSER01 -rpcpassword=[PASSWORD] -rpcport=53574 masternode start all'
      alias masternodestatus01='dapscoin-cli01 -rpcuser=RPCUSER01 -rpcpassword=[PASSWORD] -rpcport=53574 masternode status'

      # dapscoind02
      alias init02='dapscoind02 -datadir=/home/[YOUR-USERNAME]/.dapscoin02 -wallet=wallet02.dat'
      alias rescan02='dapscoind02 -datadir=/home/[YOUR-USERNAME]/.dapscoin02 -wallet=wallet02.dat -rescan'
      alias dapscoind02='dapscoind02 -rpcuser=RPCUSER02 -rpcpassword=[PASSWORD] -rpcport=53575'
      alias getinfo02='dapscoin-cli02 -rpcuser=RPCUSER02 -rpcpassword=[PASSWORD] -rpcport=53575 getinfo'
      alias addy02='dapscoin-cli02 -rpcuser=RPCUSER02 -rpcpassword=[PASSWORD] -rpcport=53575 geststealthaddress'
      alias debug02='dapscoin-cli02 -rpcuser=RPCUSER02 -rpcpassword=[PASSWORD] -rpcport=53575 masternode debug'
      alias stop02='dapscoin-cli02 -rpcuser=RPCUSER02 -rpcpassword=[PASSWORD] -rpcport=53575 stop'
      alias getblockchaininfo02='dapscoin-cli02 -rpcuser=RPCUSER02 -rpcpassword=[PASSWORD] -rpcport=53575 getblockchaininfo'
      alias masternodecurrent02='dapscoin-cli02 -rpcuser=RPCUSER02 -rpcpassword=[PASSWORD] -rpcport=53575 masternodecurrent'
      alias masternodestart02='dapscoin-cli02 -rpcuser=RPCUSER02 -rpcpassword=[PASSWORD] -rpcport=53575 masternode start all'
      alias masternodestatus02='dapscoin-cli02 -rpcuser=RPCUSER02 -rpcpassword=[PASSWORD] -rpcport=53575 masternode status'

      # dapscoind03
      alias init03='dapscoind03 -datadir=/home/[YOUR-USERNAME]/.dapscoin03 -wallet=wallet03.dat'
      alias rescan03='dapscoind03 -datadir=/home/[YOUR-USERNAME]/.dapscoin03 -wallet=wallet03.dat -rescan'
      alias dapscoind03='dapscoind03 -rpcuser=RPCUSER03 -rpcpassword=[PASSWORD] -rpcport=53576'
      alias getinfo03='dapscoin-cli03 -rpcuser=RPCUSER03 -rpcpassword=[PASSWORD] -rpcport=53576 getinfo'
      alias addy03='dapscoin-cli03 -rpcuser=RPCUSER03 -rpcpassword=[PASSWORD] -rpcport=53576 geststealthaddress'
      alias debug03='dapscoin-cli03 -rpcuser=RPCUSER03 -rpcpassword=[PASSWORD] -rpcport=53576 masternode debug'
      alias stop03='dapscoin-cli03 -rpcuser=RPCUSER03 -rpcpassword=[PASSWORD] -rpcport=53576 stop'
      alias getblockchaininfo03='dapscoin-cli03 -rpcuser=RPCUSER03 -rpcpassword=[PASSWORD] -rpcport=53576 getblockchaininfo'
      alias masternodecurrent03='dapscoin-cli03 -rpcuser=RPCUSER03 -rpcpassword=[PASSWORD] -rpcport=53576 masternodecurrent'
      alias masternodestart03='dapscoin-cli03 -rpcuser=RPCUSER03 -rpcpassword=[PASSWORD] -rpcport=53576 masternode start all'
      alias masternodestatus03='dapscoin-cli03 -rpcuser=RPCUSER03 -rpcpassword=[PASSWORD] -rpcport=53576 masternode status'

      # dapscoind04
      alias init04='dapscoind04 -datadir=/home/[YOUR-USERNAME]/.dapscoin04 -wallet=wallet04.dat'
      alias rescan04='dapscoind04 -datadir=/home/[YOUR-USERNAME]/.dapscoin04 -wallet=wallet04.dat -rescan'
      alias dapscoind04='dapscoind04 -rpcuser=RPCUSER04 -rpcpassword=[PASSWORD] -rpcport=53577'
      alias getinfo04='dapscoin-cli04 -rpcuser=RPCUSER04 -rpcpassword=[PASSWORD] -rpcport=53577 getinfo'
      alias addy04='dapscoin-cli04 -rpcuser=RPCUSER04 -rpcpassword=[PASSWORD] -rpcport=53577 geststealthaddress'
      alias debug04='dapscoin-cli04 -rpcuser=RPCUSER04 -rpcpassword=[PASSWORD] -rpcport=53577 masternode debug'
      alias stop04='dapscoin-cli04 -rpcuser=RPCUSER04 -rpcpassword=[PASSWORD] -rpcport=53577 stop'
      alias getblockchaininfo04='dapscoin-cli04 -rpcuser=RPCUSER04 -rpcpassword=[PASSWORD] -rpcport=53577 getblockchaininfo'
      alias masternodecurrent04='dapscoin-cli04 -rpcuser=RPCUSER04 -rpcpassword=[PASSWORD] -rpcport=53577 masternodecurrent'
      alias masternodestart04='dapscoin-cli04 -rpcuser=RPCUSER04 -rpcpassword=[PASSWORD] -rpcport=53577 masternode start all'
      alias masternodestatus04='dapscoin-cli04 -rpcuser=RPCUSER04 -rpcpassword=[PASSWORD] -rpcport=53577 masternode status'

      # dapscoind05
      alias init05='dapscoind05 -datadir=/home/[YOUR-USERNAME]/.dapscoin05 -wallet=wallet05.dat'
      alias rescan05='dapscoind05 -datadir=/home/[YOUR-USERNAME]/.dapscoin05 -wallet=wallet05.dat -rescan'
      alias dapscoind05='dapscoind05 -rpcuser=RPCUSER05 -rpcpassword=[PASSWORD] -rpcport=53578'
      alias getinfo05='dapscoin-cli05 -rpcuser=RPCUSER05 -rpcpassword=[PASSWORD] -rpcport=53578 getinfo'
      alias addy05='dapscoin-cli05 -rpcuser=RPCUSER05 -rpcpassword=[PASSWORD] -rpcport=53578 geststealthaddress'
      alias debug05='dapscoin-cli05 -rpcuser=RPCUSER05 -rpcpassword=[PASSWORD] -rpcport=53578 masternode debug'
      alias stop05='dapscoin-cli05 -rpcuser=RPCUSER05 -rpcpassword=[PASSWORD] -rpcport=53578 stop'
      alias getblockchaininfo05='dapscoin-cli05 -rpcuser=RPCUSER05 -rpcpassword=[PASSWORD] -rpcport=53578 getblockchaininfo'
      alias masternodecurrent05='dapscoin-cli05 -rpcuser=RPCUSER05 -rpcpassword=[PASSWORD] -rpcport=53578 masternodecurrent'
      alias masternodestart05='dapscoin-cli05 -rpcuser=RPCUSER05 -rpcpassword=[PASSWORD] -rpcport=53578 masternode start all'
      alias masternodestatus05='dapscoin-cli05 -rpcuser=RPCUSER05 -rpcpassword=[PASSWORD] -rpcport=53578 masternode status'

      # dapscoind06
      alias init06='dapscoind06 -datadir=/home/[YOUR-USERNAME]/.dapscoin06 -wallet=wallet06.dat'
      alias rescan06='dapscoind06 -datadir=/home/[YOUR-USERNAME]/.dapscoin06 -wallet=wallet06.dat -rescan'
      alias dapscoind06='dapscoind06 -rpcuser=RPCUSER06 -rpcpassword=[PASSWORD] -rpcport=53579'
      alias getinfo06='dapscoin-cli06 -rpcuser=RPCUSER06 -rpcpassword=[PASSWORD] -rpcport=53579 getinfo'
      alias addy06='dapscoin-cli06 -rpcuser=RPCUSER06 -rpcpassword=[PASSWORD] -rpcport=53579 geststealthaddress'
      alias debug06='dapscoin-cli06 -rpcuser=RPCUSER06 -rpcpassword=[PASSWORD] -rpcport=53579 masternode debug'
      alias stop06='dapscoin-cli06 -rpcuser=RPCUSER06 -rpcpassword=[PASSWORD] -rpcport=53579 stop'
      alias getblockchaininfo06='dapscoin-cli06 -rpcuser=RPCUSER06 -rpcpassword=[PASSWORD] -rpcport=53579 getblockchaininfo'
      alias masternodecurrent06='dapscoin-cli06 -rpcuser=RPCUSER06 -rpcpassword=[PASSWORD] -rpcport=53579 masternodecurrent'
      alias masternodestart06='dapscoin-cli06 -rpcuser=RPCUSER06 -rpcpassword=[PASSWORD] -rpcport=53579 masternode start all'
      alias masternodestatus06='dapscoin-cli06 -rpcuser=RPCUSER06 -rpcpassword=[PASSWORD] -rpcport=53579 masternode status'

      # dapscoind07
      alias init07='dapscoind07 -datadir=/home/[YOUR-USERNAME]/.dapscoin07 -wallet=wallet07.dat'
      alias rescan07='dapscoind07 -datadir=/home/[YOUR-USERNAME]/.dapscoin07 -wallet=wallet07.dat -rescan'
      alias dapscoind07='dapscoind07 -rpcuser=RPCUSER07 -rpcpassword=[PASSWORD] -rpcport=53580'
      alias getinfo07='dapscoin-cli07 -rpcuser=RPCUSER07 -rpcpassword=[PASSWORD] -rpcport=53580 getinfo'
      alias addy07='dapscoin-cli07 -rpcuser=RPCUSER07 -rpcpassword=[PASSWORD] -rpcport=53580 geststealthaddress'
      alias debug07='dapscoin-cli07 -rpcuser=RPCUSER07 -rpcpassword=[PASSWORD] -rpcport=53580 masternode debug'
      alias stop07='dapscoin-cli07 -rpcuser=RPCUSER07 -rpcpassword=[PASSWORD] -rpcport=53580 stop'
      alias getblockchaininfo07='dapscoin-cli07 -rpcuser=RPCUSER07 -rpcpassword=[PASSWORD] -rpcport=53580 getblockchaininfo'
      alias masternodecurrent07='dapscoin-cli07 -rpcuser=RPCUSER07 -rpcpassword=[PASSWORD] -rpcport=53580 masternodecurrent'
      alias masternodestart07='dapscoin-cli07 -rpcuser=RPCUSER07 -rpcpassword=[PASSWORD] -rpcport=53580 masternode start all'
      alias masternodestatus07='dapscoin-cli07 -rpcuser=RPCUSER07 -rpcpassword=[PASSWORD] -rpcport=53580 masternode status'

      # dapscoind08
      alias init08='dapscoind08 -datadir=/home/[YOUR-USERNAME]/.dapscoin08 -wallet=wallet08.dat'
      alias rescan08='dapscoind08 -datadir=/home/[YOUR-USERNAME]/.dapscoin08 -wallet=wallet08.dat -rescan'
      alias dapscoind08='dapscoind08 -rpcuser=RPCUSER08 -rpcpassword=[PASSWORD] -rpcport=53581'
      alias getinfo08='dapscoin-cli08 -rpcuser=RPCUSER08 -rpcpassword=[PASSWORD] -rpcport=53581 getinfo'
      alias addy08='dapscoin-cli08 -rpcuser=RPCUSER08 -rpcpassword=[PASSWORD] -rpcport=53581 geststealthaddress'
      alias debug08='dapscoin-cli08 -rpcuser=RPCUSER08 -rpcpassword=[PASSWORD] -rpcport=53581 masternode debug'
      alias stop08='dapscoin-cli08 -rpcuser=RPCUSER08 -rpcpassword=[PASSWORD] -rpcport=53581 stop'
      alias getblockchaininfo08='dapscoin-cli08 -rpcuser=RPCUSER08 -rpcpassword=[PASSWORD] -rpcport=53581 getblockchaininfo'
      alias masternodecurrent08='dapscoin-cli08 -rpcuser=RPCUSER08 -rpcpassword=[PASSWORD] -rpcport=53581 masternodecurrent'
      alias masternodestart08='dapscoin-cli08 -rpcuser=RPCUSER08 -rpcpassword=[PASSWORD] -rpcport=53581 masternode start all'
      alias masternodestatus08='dapscoin-cli08 -rpcuser=RPCUSER08 -rpcpassword=[PASSWORD] -rpcport=53581 masternode status'

      # dapscoind09
      alias init09='dapscoind09 -datadir=/home/[YOUR-USERNAME]/.dapscoin09 -wallet=wallet09.dat'
      alias rescan09='dapscoind09 -datadir=/home/[YOUR-USERNAME]/.dapscoin09 -wallet=wallet09.dat -rescan'
      alias dapscoind09='dapscoind09 -rpcuser=RPCUSER09 -rpcpassword=[PASSWORD] -rpcport=53582'
      alias getinfo09='dapscoin-cli09 -rpcuser=RPCUSER09 -rpcpassword=[PASSWORD] -rpcport=53582 getinfo'
      alias addy09='dapscoin-cli09 -rpcuser=RPCUSER09 -rpcpassword=[PASSWORD] -rpcport=53582 geststealthaddress'
      alias debug09='dapscoin-cli09 -rpcuser=RPCUSER09 -rpcpassword=[PASSWORD] -rpcport=53582 masternode debug'
      alias stop09='dapscoin-cli09 -rpcuser=RPCUSER09 -rpcpassword=[PASSWORD] -rpcport=53582 stop'
      alias getblockchaininfo09='dapscoin-cli09 -rpcuser=RPCUSER09 -rpcpassword=[PASSWORD] -rpcport=53582 getblockchaininfo'
      alias masternodecurrent09='dapscoin-cli09 -rpcuser=RPCUSER09 -rpcpassword=[PASSWORD] -rpcport=53582 masternodecurrent'
      alias masternodestart09='dapscoin-cli09 -rpcuser=RPCUSER09 -rpcpassword=[PASSWORD] -rpcport=53582 masternode start all'
      alias masternodestatus09='dapscoin-cli09 -rpcuser=RPCUSER09 -rpcpassword=[PASSWORD] -rpcport=53582 masternode status'

      # dapscoind10
      alias init10='dapscoind10 -datadir=/home/[YOUR-USERNAME]/.dapscoin10 -wallet=wallet10.dat'
      alias rescan10='dapscoind10 -datadir=/home/[YOUR-USERNAME]/.dapscoin10 -wallet=wallet10.dat -rescan'
      alias dapscoind10='dapscoind10 -rpcuser=RPCUSER10 -rpcpassword=[PASSWORD] -rpcport=53583'
      alias getinfo10='dapscoin-cli10 -rpcuser=RPCUSER10 -rpcpassword=[PASSWORD] -rpcport=53583 getinfo'
      alias addy10='dapscoin-cli10 -rpcuser=RPCUSER10 -rpcpassword=[PASSWORD] -rpcport=53583 geststealthaddress'
      alias debug10='dapscoin-cli10 -rpcuser=RPCUSER10 -rpcpassword=[PASSWORD] -rpcport=53583 masternode debug'
      alias stop10='dapscoin-cli10 -rpcuser=RPCUSER10 -rpcpassword=[PASSWORD] -rpcport=53583 stop'
      alias getblockchaininfo10='dapscoin-cli10 -rpcuser=RPCUSER10 -rpcpassword=[PASSWORD] -rpcport=53583 getblockchaininfo'
      alias masternodecurrent10='dapscoin-cli10 -rpcuser=RPCUSER10 -rpcpassword=[PASSWORD] -rpcport=53583 masternodecurrent'
      alias masternodestart10='dapscoin-cli10 -rpcuser=RPCUSER10 -rpcpassword=[PASSWORD] -rpcport=53583 masternode start all'
      alias masternodestatus10='dapscoin-cli10 -rpcuser=RPCUSER10 -rpcpassword=[PASSWORD] -rpcport=53583 masternode status'

      # dapscoind11
      alias init11='dapscoind11 -datadir=/home/[YOUR-USERNAME]/.dapscoin11 -wallet=wallet11.dat'
      alias rescan11='dapscoind11 -datadir=/home/[YOUR-USERNAME]/.dapscoin11 -wallet=wallet11.dat -rescan'
      alias dapscoind11='dapscoind11 -rpcuser=RPCUSER11 -rpcpassword=[PASSWORD] -rpcport=53584'
      alias getinfo11='dapscoin-cli11 -rpcuser=RPCUSER11 -rpcpassword=[PASSWORD] -rpcport=53584 getinfo'
      alias addy11='dapscoin-cli11 -rpcuser=RPCUSER11 -rpcpassword=[PASSWORD] -rpcport=53584 geststealthaddress'
      alias debug11='dapscoin-cli11 -rpcuser=RPCUSER11 -rpcpassword=[PASSWORD] -rpcport=53584 masternode debug'
      alias stop11='dapscoin-cli11 -rpcuser=RPCUSER11 -rpcpassword=[PASSWORD] -rpcport=53584 stop'
      alias getblockchaininfo11='dapscoin-cli11 -rpcuser=RPCUSER11 -rpcpassword=[PASSWORD] -rpcport=53584 getblockchaininfo'
      alias masternodecurrent11='dapscoin-cli11 -rpcuser=RPCUSER11 -rpcpassword=[PASSWORD] -rpcport=53584 masternodecurrent'
      alias masternodestart11='dapscoin-cli11 -rpcuser=RPCUSER11 -rpcpassword=[PASSWORD] -rpcport=53584 masternode start all'
      alias masternodestatus11='dapscoin-cli11 -rpcuser=RPCUSER11 -rpcpassword=[PASSWORD] -rpcport=53584 masternode status'

      # dapscoind12
      alias init12='dapscoind12 -datadir=/home/[YOUR-USERNAME]/.dapscoin12 -wallet=wallet12.dat'
      alias rescan12='dapscoind12 -datadir=/home/[YOUR-USERNAME]/.dapscoin12 -wallet=wallet12.dat -rescan'
      alias dapscoind12='dapscoind12 -rpcuser=RPCUSER12 -rpcpassword=[PASSWORD] -rpcport=53585'
      alias getinfo12='dapscoin-cli12 -rpcuser=RPCUSER12 -rpcpassword=[PASSWORD] -rpcport=53585 getinfo'
      alias addy12='dapscoin-cli12 -rpcuser=RPCUSER12 -rpcpassword=[PASSWORD] -rpcport=53585 geststealthaddress'
      alias debug12='dapscoin-cli12 -rpcuser=RPCUSER12 -rpcpassword=[PASSWORD] -rpcport=53585 masternode debug'
      alias stop12='dapscoin-cli12 -rpcuser=RPCUSER12 -rpcpassword=[PASSWORD] -rpcport=53585 stop'
      alias getblockchaininfo12='dapscoin-cli12 -rpcuser=RPCUSER12 -rpcpassword=[PASSWORD] -rpcport=53585 getblockchaininfo'
      alias masternodecurrent12='dapscoin-cli12 -rpcuser=RPCUSER12 -rpcpassword=[PASSWORD] -rpcport=53585 masternodecurrent'
      alias masternodestart12='dapscoin-cli12 -rpcuser=RPCUSER12 -rpcpassword=[PASSWORD] -rpcport=53585 masternode start all'
      alias masternodestatus12='dapscoin-cli12 -rpcuser=RPCUSER12 -rpcpassword=[PASSWORD] -rpcport=53585 masternode status'

      # dapscoind13
      alias init13='dapscoind13 -datadir=/home/[YOUR-USERNAME]/.dapscoin13 -wallet=wallet13.dat'
      alias rescan13='dapscoind13 -datadir=/home/[YOUR-USERNAME]/.dapscoin13 -wallet=wallet13.dat -rescan'
      alias dapscoind13='dapscoind13 -rpcuser=RPCUSER13 -rpcpassword=[PASSWORD] -rpcport=53586'
      alias getinfo13='dapscoin-cli13 -rpcuser=RPCUSER13 -rpcpassword=[PASSWORD] -rpcport=53586 getinfo'
      alias addy13='dapscoin-cli13 -rpcuser=RPCUSER13 -rpcpassword=[PASSWORD] -rpcport=53586 geststealthaddress'
      alias debug13='dapscoin-cli13 -rpcuser=RPCUSER13 -rpcpassword=[PASSWORD] -rpcport=53586 masternode debug'
      alias stop13='dapscoin-cli13 -rpcuser=RPCUSER13 -rpcpassword=[PASSWORD] -rpcport=53586 stop'
      alias getblockchaininfo13='dapscoin-cli13 -rpcuser=RPCUSER13 -rpcpassword=[PASSWORD] -rpcport=53586 getblockchaininfo'
      alias masternodecurrent13='dapscoin-cli13 -rpcuser=RPCUSER13 -rpcpassword=[PASSWORD] -rpcport=53586 masternodecurrent'
      alias masternodestart13='dapscoin-cli13 -rpcuser=RPCUSER13 -rpcpassword=[PASSWORD] -rpcport=53586 masternode start all'
      alias masternodestatus13='dapscoin-cli13 -rpcuser=RPCUSER13 -rpcpassword=[PASSWORD] -rpcport=53586 masternode status'

      # dapscoind14
      alias init14='dapscoind14 -datadir=/home/[YOUR-USERNAME]/.dapscoin14 -wallet=wallet14.dat'
      alias rescan14='dapscoind14 -datadir=/home/[YOUR-USERNAME]/.dapscoin14 -wallet=wallet14.dat -rescan'
      alias dapscoind14='dapscoind14 -rpcuser=RPCUSER14 -rpcpassword=[PASSWORD] -rpcport=53587'
      alias getinfo14='dapscoin-cli14 -rpcuser=RPCUSER14 -rpcpassword=[PASSWORD] -rpcport=53587 getinfo'
      alias addy14='dapscoin-cli14 -rpcuser=RPCUSER14 -rpcpassword=[PASSWORD] -rpcport=53587 geststealthaddress'
      alias debug14='dapscoin-cli14 -rpcuser=RPCUSER14 -rpcpassword=[PASSWORD] -rpcport=53587 masternode debug'
      alias stop14='dapscoin-cli14 -rpcuser=RPCUSER14 -rpcpassword=[PASSWORD] -rpcport=53587 stop'
      alias getblockchaininfo14='dapscoin-cli14 -rpcuser=RPCUSER14 -rpcpassword=[PASSWORD] -rpcport=53587 getblockchaininfo'
      alias masternodecurrent14='dapscoin-cli14 -rpcuser=RPCUSER14 -rpcpassword=[PASSWORD] -rpcport=53587 masternodecurrent'
      alias masternodestart14='dapscoin-cli14 -rpcuser=RPCUSER14 -rpcpassword=[PASSWORD] -rpcport=53587 masternode start all'
      alias masternodestatus14='dapscoin-cli14 -rpcuser=RPCUSER14 -rpcpassword=[PASSWORD] -rpcport=53587 masternode status'

      # dapscoind15
      alias init15='dapscoind15 -datadir=/home/[YOUR-USERNAME]/.dapscoin15 -wallet=wallet15.dat'
      alias rescan15='dapscoind15 -datadir=/home/[YOUR-USERNAME]/.dapscoin15 -wallet=wallet15.dat -rescan'
      alias dapscoind15='dapscoind15 -rpcuser=RPCUSER15 -rpcpassword=[PASSWORD] -rpcport=53588'
      alias getinfo15='dapscoin-cli15 -rpcuser=RPCUSER15 -rpcpassword=[PASSWORD] -rpcport=53588 getinfo'
      alias addy15='dapscoin-cli15 -rpcuser=RPCUSER15 -rpcpassword=[PASSWORD] -rpcport=53588 geststealthaddress'
      alias debug15='dapscoin-cli15 -rpcuser=RPCUSER15 -rpcpassword=[PASSWORD] -rpcport=53588 masternode debug'
      alias stop15='dapscoin-cli15 -rpcuser=RPCUSER15 -rpcpassword=[PASSWORD] -rpcport=53588 stop'
      alias getblockchaininfo15='dapscoin-cli15 -rpcuser=RPCUSER15 -rpcpassword=[PASSWORD] -rpcport=53588 getblockchaininfo'
      alias masternodecurrent15='dapscoin-cli15 -rpcuser=RPCUSER15 -rpcpassword=[PASSWORD] -rpcport=53588 masternodecurrent'
      alias masternodestart15='dapscoin-cli15 -rpcuser=RPCUSER15 -rpcpassword=[PASSWORD] -rpcport=53588 masternode start all'
      alias masternodestatus15='dapscoin-cli15 -rpcuser=RPCUSER15 -rpcpassword=[PASSWORD] -rpcport=53588 masternode status'

      # dapscoind16
      alias init16='dapscoind16 -datadir=/home/[YOUR-USERNAME]/.dapscoin16 -wallet=wallet16.dat'
      alias rescan16='dapscoind16 -datadir=/home/[YOUR-USERNAME]/.dapscoin16 -wallet=wallet16.dat -rescan'
      alias dapscoind16='dapscoind16 -rpcuser=RPCUSER16 -rpcpassword=[PASSWORD] -rpcport=53589'
      alias getinfo16='dapscoin-cli16 -rpcuser=RPCUSER16 -rpcpassword=[PASSWORD] -rpcport=53589 getinfo'
      alias addy16='dapscoin-cli16 -rpcuser=RPCUSER16 -rpcpassword=[PASSWORD] -rpcport=53589 geststealthaddress'
      alias debug16='dapscoin-cli16 -rpcuser=RPCUSER16 -rpcpassword=[PASSWORD] -rpcport=53589 masternode debug'
      alias stop16='dapscoin-cli16 -rpcuser=RPCUSER16 -rpcpassword=[PASSWORD] -rpcport=53589 stop'
      alias getblockchaininfo16='dapscoin-cli16 -rpcuser=RPCUSER16 -rpcpassword=[PASSWORD] -rpcport=53589 getblockchaininfo'
      alias masternodecurrent16='dapscoin-cli16 -rpcuser=RPCUSER16 -rpcpassword=[PASSWORD] -rpcport=53589 masternodecurrent'
      alias masternodestart16='dapscoin-cli16 -rpcuser=RPCUSER16 -rpcpassword=[PASSWORD] -rpcport=53589 masternode start all'
      alias masternodestatus16='dapscoin-cli16 -rpcuser=RPCUSER16 -rpcpassword=[PASSWORD] -rpcport=53589 masternode status'

      # dapscoind17
      alias init17='dapscoind17 -datadir=/home/[YOUR-USERNAME]/.dapscoin17 -wallet=wallet17.dat'
      alias rescan17='dapscoind17 -datadir=/home/[YOUR-USERNAME]/.dapscoin17 -wallet=wallet17.dat -rescan'
      alias dapscoind17='dapscoind17 -rpcuser=RPCUSER17 -rpcpassword=[PASSWORD] -rpcport=53590'
      alias getinfo17='dapscoin-cli17 -rpcuser=RPCUSER17 -rpcpassword=[PASSWORD] -rpcport=53590 getinfo'
      alias addy17='dapscoin-cli17 -rpcuser=RPCUSER17 -rpcpassword=[PASSWORD] -rpcport=53590 geststealthaddress'
      alias debug17='dapscoin-cli17 -rpcuser=RPCUSER17 -rpcpassword=[PASSWORD] -rpcport=53590 masternode debug'
      alias stop17='dapscoin-cli17 -rpcuser=RPCUSER17 -rpcpassword=[PASSWORD] -rpcport=53590 stop'
      alias getblockchaininfo17='dapscoin-cli17 -rpcuser=RPCUSER17 -rpcpassword=[PASSWORD] -rpcport=53590 getblockchaininfo'
      alias masternodecurrent17='dapscoin-cli17 -rpcuser=RPCUSER17 -rpcpassword=[PASSWORD] -rpcport=53590 masternodecurrent'
      alias masternodestart17='dapscoin-cli17 -rpcuser=RPCUSER17 -rpcpassword=[PASSWORD] -rpcport=53590 masternode start all'
      alias masternodestatus17='dapscoin-cli17 -rpcuser=RPCUSER17 -rpcpassword=[PASSWORD] -rpcport=53590 masternode status'

      # dapscoind18
      alias init18='dapscoind18 -datadir=/home/[YOUR-USERNAME]/.dapscoin18 -wallet=wallet18.dat'
      alias rescan18='dapscoind18 -datadir=/home/[YOUR-USERNAME]/.dapscoin18 -wallet=wallet18.dat -rescan'
      alias dapscoind18='dapscoind18 -rpcuser=RPCUSER18 -rpcpassword=[PASSWORD] -rpcport=53591'
      alias getinfo18='dapscoin-cli18 -rpcuser=RPCUSER18 -rpcpassword=[PASSWORD] -rpcport=53591 getinfo'
      alias addy18='dapscoin-cli18 -rpcuser=RPCUSER18 -rpcpassword=[PASSWORD] -rpcport=53591 geststealthaddress'
      alias debug18='dapscoin-cli18 -rpcuser=RPCUSER18 -rpcpassword=[PASSWORD] -rpcport=53591 masternode debug'
      alias stop18='dapscoin-cli18 -rpcuser=RPCUSER18 -rpcpassword=[PASSWORD] -rpcport=53591 stop'
      alias getblockchaininfo18='dapscoin-cli18 -rpcuser=RPCUSER18 -rpcpassword=[PASSWORD] -rpcport=53591 getblockchaininfo'
      alias masternodecurrent18='dapscoin-cli18 -rpcuser=RPCUSER18 -rpcpassword=[PASSWORD] -rpcport=53591 masternodecurrent'
      alias masternodestart18='dapscoin-cli18 -rpcuser=RPCUSER18 -rpcpassword=[PASSWORD] -rpcport=53591 masternode start all'
      alias masternodestatus18='dapscoin-cli18 -rpcuser=RPCUSER18 -rpcpassword=[PASSWORD] -rpcport=53591 masternode status'

      # dapscoind19
      alias init19='dapscoind19 -datadir=/home/[YOUR-USERNAME]/.dapscoin19 -wallet=wallet19.dat'
      alias rescan19='dapscoind19 -datadir=/home/[YOUR-USERNAME]/.dapscoin19 -wallet=wallet19.dat -rescan'
      alias dapscoind19='dapscoind19 -rpcuser=RPCUSER19 -rpcpassword=[PASSWORD] -rpcport=53592'
      alias getinfo19='dapscoin-cli19 -rpcuser=RPCUSER19 -rpcpassword=[PASSWORD] -rpcport=53592 getinfo'
      alias addy19='dapscoin-cli19 -rpcuser=RPCUSER19 -rpcpassword=[PASSWORD] -rpcport=53592 geststealthaddress'
      alias debug19='dapscoin-cli19 -rpcuser=RPCUSER19 -rpcpassword=[PASSWORD] -rpcport=53592 masternode debug'
      alias stop19='dapscoin-cli19 -rpcuser=RPCUSER19 -rpcpassword=[PASSWORD] -rpcport=53592 stop'
      alias getblockchaininfo19='dapscoin-cli19 -rpcuser=RPCUSER19 -rpcpassword=[PASSWORD] -rpcport=53592 getblockchaininfo'
      alias masternodecurrent19='dapscoin-cli19 -rpcuser=RPCUSER19 -rpcpassword=[PASSWORD] -rpcport=53592 masternodecurrent'
      alias masternodestart19='dapscoin-cli19 -rpcuser=RPCUSER19 -rpcpassword=[PASSWORD] -rpcport=53592 masternode start all'
      alias masternodestatus19='dapscoin-cli19 -rpcuser=RPCUSER19 -rpcpassword=[PASSWORD] -rpcport=53592 masternode status'

      # dapscoind20
      alias init20='dapscoind20 -datadir=/home/[YOUR-USERNAME]/.dapscoin20 -wallet=wallet20.dat'
      alias rescan20='dapscoind20 -datadir=/home/[YOUR-USERNAME]/.dapscoin20 -wallet=wallet20.dat -rescan'
      alias dapscoind20='dapscoind20 -rpcuser=RPCUSER20 -rpcpassword=[PASSWORD] -rpcport=53593'
      alias getinfo20='dapscoin-cli20 -rpcuser=RPCUSER20 -rpcpassword=[PASSWORD] -rpcport=53593 getinfo'
      alias addy20='dapscoin-cli20 -rpcuser=RPCUSER20 -rpcpassword=[PASSWORD] -rpcport=53593 geststealthaddress'
      alias debug20='dapscoin-cli20 -rpcuser=RPCUSER20 -rpcpassword=[PASSWORD] -rpcport=53593 masternode debug'
      alias stop20='dapscoin-cli20 -rpcuser=RPCUSER20 -rpcpassword=[PASSWORD] -rpcport=53593 stop'
      alias getblockchaininfo20='dapscoin-cli20 -rpcuser=RPCUSER20 -rpcpassword=[PASSWORD] -rpcport=53593 getblockchaininfo'
      alias masternodecurrent20='dapscoin-cli20 -rpcuser=RPCUSER20 -rpcpassword=[PASSWORD] -rpcport=53593 masternodecurrent'
      alias masternodestart20='dapscoin-cli20 -rpcuser=RPCUSER20 -rpcpassword=[PASSWORD] -rpcport=53593 masternode start all'
      alias masternodestatus20='dapscoin-cli20 -rpcuser=RPCUSER20 -rpcpassword=[PASSWORD] -rpcport=53593 masternode status'

      # dapscoind21
      alias init21='dapscoind21 -datadir=/home/[YOUR-USERNAME]/.dapscoin21 -wallet=wallet21.dat'
      alias rescan21='dapscoind21 -datadir=/home/[YOUR-USERNAME]/.dapscoin21 -wallet=wallet21.dat -rescan'
      alias dapscoind21='dapscoind21 -rpcuser=RPCUSER21 -rpcpassword=[PASSWORD] -rpcport=53594'
      alias getinfo21='dapscoin-cli21 -rpcuser=RPCUSER21 -rpcpassword=[PASSWORD] -rpcport=53594 getinfo'
      alias addy21='dapscoin-cli21 -rpcuser=RPCUSER21 -rpcpassword=[PASSWORD] -rpcport=53594 geststealthaddress'
      alias debug21='dapscoin-cli21 -rpcuser=RPCUSER21 -rpcpassword=[PASSWORD] -rpcport=53594 masternode debug'
      alias stop21='dapscoin-cli21 -rpcuser=RPCUSER21 -rpcpassword=[PASSWORD] -rpcport=53594 stop'
      alias getblockchaininfo21='dapscoin-cli21 -rpcuser=RPCUSER21 -rpcpassword=[PASSWORD] -rpcport=53594 getblockchaininfo'
      alias masternodecurrent21='dapscoin-cli21 -rpcuser=RPCUSER21 -rpcpassword=[PASSWORD] -rpcport=53594 masternodecurrent'
      alias masternodestart21='dapscoin-cli21 -rpcuser=RPCUSER21 -rpcpassword=[PASSWORD] -rpcport=53594 masternode start all'
      alias masternodestatus21='dapscoin-cli21 -rpcuser=RPCUSER21 -rpcpassword=[PASSWORD] -rpcport=53594 masternode status'

      # dapscoind22
      alias init22='dapscoind22 -datadir=/home/[YOUR-USERNAME]/.dapscoin22 -wallet=wallet22.dat'
      alias rescan22='dapscoind22 -datadir=/home/[YOUR-USERNAME]/.dapscoin22 -wallet=wallet22.dat -rescan'
      alias dapscoind22='dapscoind22 -rpcuser=RPCUSER22 -rpcpassword=[PASSWORD] -rpcport=53595'
      alias getinfo22='dapscoin-cli22 -rpcuser=RPCUSER22 -rpcpassword=[PASSWORD] -rpcport=53595 getinfo'
      alias addy22='dapscoin-cli22 -rpcuser=RPCUSER22 -rpcpassword=[PASSWORD] -rpcport=53595 geststealthaddress'
      alias debug22='dapscoin-cli22 -rpcuser=RPCUSER22 -rpcpassword=[PASSWORD] -rpcport=53595 masternode debug'
      alias stop22='dapscoin-cli22 -rpcuser=RPCUSER22 -rpcpassword=[PASSWORD] -rpcport=53595 stop'
      alias getblockchaininfo22='dapscoin-cli22 -rpcuser=RPCUSER22 -rpcpassword=[PASSWORD] -rpcport=53595 getblockchaininfo'
      alias masternodecurrent22='dapscoin-cli22 -rpcuser=RPCUSER22 -rpcpassword=[PASSWORD] -rpcport=53595 masternodecurrent'
      alias masternodestart22='dapscoin-cli22 -rpcuser=RPCUSER22 -rpcpassword=[PASSWORD] -rpcport=53595 masternode start all'
      alias masternodestatus22='dapscoin-cli22 -rpcuser=RPCUSER22 -rpcpassword=[PASSWORD] -rpcport=53595 masternode status'

      # dapscoind23
      alias init23='dapscoind23 -datadir=/home/[YOUR-USERNAME]/.dapscoin23 -wallet=wallet23.dat'
      alias rescan23='dapscoind23 -datadir=/home/[YOUR-USERNAME]/.dapscoin23 -wallet=wallet23.dat -rescan'
      alias dapscoind23='dapscoind23 -rpcuser=RPCUSER23 -rpcpassword=[PASSWORD] -rpcport=53596'
      alias getinfo23='dapscoin-cli23 -rpcuser=RPCUSER23 -rpcpassword=[PASSWORD] -rpcport=53596 getinfo'
      alias addy23='dapscoin-cli23 -rpcuser=RPCUSER23 -rpcpassword=[PASSWORD] -rpcport=53596 geststealthaddress'
      alias debug23='dapscoin-cli23 -rpcuser=RPCUSER23 -rpcpassword=[PASSWORD] -rpcport=53596 masternode debug'
      alias stop23='dapscoin-cli23 -rpcuser=RPCUSER23 -rpcpassword=[PASSWORD] -rpcport=53596 stop'
      alias getblockchaininfo23='dapscoin-cli23 -rpcuser=RPCUSER23 -rpcpassword=[PASSWORD] -rpcport=53596 getblockchaininfo'
      alias masternodecurrent23='dapscoin-cli23 -rpcuser=RPCUSER23 -rpcpassword=[PASSWORD] -rpcport=53596 masternodecurrent'
      alias masternodestart23='dapscoin-cli23 -rpcuser=RPCUSER23 -rpcpassword=[PASSWORD] -rpcport=53596 masternode start all'
      alias masternodestatus23='dapscoin-cli23 -rpcuser=RPCUSER23 -rpcpassword=[PASSWORD] -rpcport=53596 masternode status'

      # dapscoind24
      alias init24='dapscoind24 -datadir=/home/[YOUR-USERNAME]/.dapscoin24 -wallet=wallet24.dat'
      alias rescan24='dapscoind24 -datadir=/home/[YOUR-USERNAME]/.dapscoin24 -wallet=wallet24.dat -rescan'
      alias dapscoind24='dapscoind24 -rpcuser=RPCUSER24 -rpcpassword=[PASSWORD] -rpcport=53597'
      alias getinfo24='dapscoin-cli24 -rpcuser=RPCUSER24 -rpcpassword=[PASSWORD] -rpcport=53597 getinfo'
      alias addy24='dapscoin-cli24 -rpcuser=RPCUSER24 -rpcpassword=[PASSWORD] -rpcport=53597 geststealthaddress'
      alias debug24='dapscoin-cli24 -rpcuser=RPCUSER24 -rpcpassword=[PASSWORD] -rpcport=53597 masternode debug'
      alias stop24='dapscoin-cli24 -rpcuser=RPCUSER24 -rpcpassword=[PASSWORD] -rpcport=53597 stop'
      alias getblockchaininfo24='dapscoin-cli24 -rpcuser=RPCUSER24 -rpcpassword=[PASSWORD] -rpcport=53597 getblockchaininfo'
      alias masternodecurrent24='dapscoin-cli24 -rpcuser=RPCUSER24 -rpcpassword=[PASSWORD] -rpcport=53597 masternodecurrent'
      alias masternodestart24='dapscoin-cli24 -rpcuser=RPCUSER24 -rpcpassword=[PASSWORD] -rpcport=53597 masternode start all'
      alias masternodestatus24='dapscoin-cli24 -rpcuser=RPCUSER24 -rpcpassword=[PASSWORD] -rpcport=53597 masternode status'

      # dapscoind25
      alias init25='dapscoind25 -datadir=/home/[YOUR-USERNAME]/.dapscoin25 -wallet=wallet25.dat'
      alias rescan25='dapscoind25 -datadir=/home/[YOUR-USERNAME]/.dapscoin25 -wallet=wallet25.dat -rescan'
      alias dapscoind25='dapscoind25 -rpcuser=RPCUSER25 -rpcpassword=[PASSWORD] -rpcport=53598'
      alias getinfo25='dapscoin-cli25 -rpcuser=RPCUSER25 -rpcpassword=[PASSWORD] -rpcport=53598 getinfo'
      alias addy25='dapscoin-cli25 -rpcuser=RPCUSER25 -rpcpassword=[PASSWORD] -rpcport=53598 geststealthaddress'
      alias debug25='dapscoin-cli25 -rpcuser=RPCUSER25 -rpcpassword=[PASSWORD] -rpcport=53598 masternode debug'
      alias stop25='dapscoin-cli25 -rpcuser=RPCUSER25 -rpcpassword=[PASSWORD] -rpcport=53598 stop'
      alias getblockchaininfo25='dapscoin-cli25 -rpcuser=RPCUSER25 -rpcpassword=[PASSWORD] -rpcport=53598 getblockchaininfo'
      alias masternodecurrent25='dapscoin-cli25 -rpcuser=RPCUSER25 -rpcpassword=[PASSWORD] -rpcport=53598 masternodecurrent'
      alias masternodestart25='dapscoin-cli25 -rpcuser=RPCUSER25 -rpcpassword=[PASSWORD] -rpcport=53598 masternode start all'
      alias masternodestatus25='dapscoin-cli25 -rpcuser=RPCUSER25 -rpcpassword=[PASSWORD] -rpcport=53598 masternode status'

      # dapscoind26
      alias init26='dapscoind26 -datadir=/home/[YOUR-USERNAME]/.dapscoin26 -wallet=wallet26.dat'
      alias rescan26='dapscoind26 -datadir=/home/[YOUR-USERNAME]/.dapscoin26 -wallet=wallet26.dat -rescan'
      alias dapscoind26='dapscoind26 -rpcuser=RPCUSER26 -rpcpassword=[PASSWORD] -rpcport=53599'
      alias getinfo26='dapscoin-cli26 -rpcuser=RPCUSER26 -rpcpassword=[PASSWORD] -rpcport=53599 getinfo'
      alias addy26='dapscoin-cli26 -rpcuser=RPCUSER26 -rpcpassword=[PASSWORD] -rpcport=53599 geststealthaddress'
      alias debug26='dapscoin-cli26 -rpcuser=RPCUSER26 -rpcpassword=[PASSWORD] -rpcport=53599 masternode debug'
      alias stop26='dapscoin-cli26 -rpcuser=RPCUSER26 -rpcpassword=[PASSWORD] -rpcport=53599 stop'
      alias getblockchaininfo26='dapscoin-cli26 -rpcuser=RPCUSER26 -rpcpassword=[PASSWORD] -rpcport=53599 getblockchaininfo'
      alias masternodecurrent26='dapscoin-cli26 -rpcuser=RPCUSER26 -rpcpassword=[PASSWORD] -rpcport=53599 masternodecurrent'
      alias masternodestart26='dapscoin-cli26 -rpcuser=RPCUSER26 -rpcpassword=[PASSWORD] -rpcport=53599 masternode start all'
      alias masternodestatus26='dapscoin-cli26 -rpcuser=RPCUSER26 -rpcpassword=[PASSWORD] -rpcport=53599 masternode status'

      # dapscoind27
      alias init27='dapscoind27 -datadir=/home/[YOUR-USERNAME]/.dapscoin27 -wallet=wallet27.dat'
      alias rescan27='dapscoind27 -datadir=/home/[YOUR-USERNAME]/.dapscoin27 -wallet=wallet27.dat -rescan'
      alias dapscoind27='dapscoind27 -rpcuser=RPCUSER27 -rpcpassword=[PASSWORD] -rpcport=53600'
      alias getinfo27='dapscoin-cli27 -rpcuser=RPCUSER27 -rpcpassword=[PASSWORD] -rpcport=53600 getinfo'
      alias addy27='dapscoin-cli27 -rpcuser=RPCUSER27 -rpcpassword=[PASSWORD] -rpcport=53600 geststealthaddress'
      alias debug27='dapscoin-cli27 -rpcuser=RPCUSER27 -rpcpassword=[PASSWORD] -rpcport=53600 masternode debug'
      alias stop27='dapscoin-cli27 -rpcuser=RPCUSER27 -rpcpassword=[PASSWORD] -rpcport=53600 stop'
      alias getblockchaininfo27='dapscoin-cli27 -rpcuser=RPCUSER27 -rpcpassword=[PASSWORD] -rpcport=53600 getblockchaininfo'
      alias masternodecurrent27='dapscoin-cli27 -rpcuser=RPCUSER27 -rpcpassword=[PASSWORD] -rpcport=53600 masternodecurrent'
      alias masternodestart27='dapscoin-cli27 -rpcuser=RPCUSER27 -rpcpassword=[PASSWORD] -rpcport=53600 masternode start all'
      alias masternodestatus27='dapscoin-cli27 -rpcuser=RPCUSER27 -rpcpassword=[PASSWORD] -rpcport=53600 masternode status'

      # dapscoind28
      alias init28='dapscoind28 -datadir=/home/[YOUR-USERNAME]/.dapscoin28 -wallet=wallet28.dat'
      alias rescan28='dapscoind28 -datadir=/home/[YOUR-USERNAME]/.dapscoin28 -wallet=wallet28.dat -rescan'
      alias dapscoind28='dapscoind28 -rpcuser=RPCUSER28 -rpcpassword=[PASSWORD] -rpcport=53601'
      alias getinfo28='dapscoin-cli28 -rpcuser=RPCUSER28 -rpcpassword=[PASSWORD] -rpcport=53601 getinfo'
      alias addy28='dapscoin-cli28 -rpcuser=RPCUSER28 -rpcpassword=[PASSWORD] -rpcport=53601 geststealthaddress'
      alias debug28='dapscoin-cli28 -rpcuser=RPCUSER28 -rpcpassword=[PASSWORD] -rpcport=53601 masternode debug'
      alias stop28='dapscoin-cli28 -rpcuser=RPCUSER28 -rpcpassword=[PASSWORD] -rpcport=53601 stop'
      alias getblockchaininfo28='dapscoin-cli28 -rpcuser=RPCUSER28 -rpcpassword=[PASSWORD] -rpcport=53601 getblockchaininfo'
      alias masternodecurrent28='dapscoin-cli28 -rpcuser=RPCUSER28 -rpcpassword=[PASSWORD] -rpcport=53601 masternodecurrent'
      alias masternodestart28='dapscoin-cli28 -rpcuser=RPCUSER28 -rpcpassword=[PASSWORD] -rpcport=53601 masternode start all'
      alias masternodestatus28='dapscoin-cli28 -rpcuser=RPCUSER28 -rpcpassword=[PASSWORD] -rpcport=53601 masternode status'

      # dapscoind29
      alias init29='dapscoind29 -datadir=/home/[YOUR-USERNAME]/.dapscoin29 -wallet=wallet29.dat'
      alias rescan29='dapscoind29 -datadir=/home/[YOUR-USERNAME]/.dapscoin29 -wallet=wallet29.dat -rescan'
      alias dapscoind29='dapscoind29 -rpcuser=RPCUSER29 -rpcpassword=[PASSWORD] -rpcport=53602'
      alias getinfo29='dapscoin-cli29 -rpcuser=RPCUSER29 -rpcpassword=[PASSWORD] -rpcport=53602 getinfo'
      alias addy29='dapscoin-cli29 -rpcuser=RPCUSER29 -rpcpassword=[PASSWORD] -rpcport=53602 geststealthaddress'
      alias debug29='dapscoin-cli29 -rpcuser=RPCUSER29 -rpcpassword=[PASSWORD] -rpcport=53602 masternode debug'
      alias stop29='dapscoin-cli29 -rpcuser=RPCUSER29 -rpcpassword=[PASSWORD] -rpcport=53602 stop'
      alias getblockchaininfo29='dapscoin-cli29 -rpcuser=RPCUSER29 -rpcpassword=[PASSWORD] -rpcport=53602 getblockchaininfo'
      alias masternodecurrent29='dapscoin-cli29 -rpcuser=RPCUSER29 -rpcpassword=[PASSWORD] -rpcport=53602 masternodecurrent'
      alias masternodestart29='dapscoin-cli29 -rpcuser=RPCUSER29 -rpcpassword=[PASSWORD] -rpcport=53602 masternode start all'
      alias masternodestatus29='dapscoin-cli29 -rpcuser=RPCUSER29 -rpcpassword=[PASSWORD] -rpcport=53602 masternode status'
    ```

    - Once pasted above, save it and run the following command to load these into active memory:
      - `source ~/.bashrc`


