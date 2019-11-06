# how to apply bootstrap on your masternode
  * go to .dapscoin folder
    - `cd ~/.dapscoin`
    - if you have multiple nodes, then go to the folder you need to work on.
      - for example:
        - `cd ~/.dapscoin00`
        - `cd ~/.dapscoin01`
        - etc.
  * Delete the following folders named: “blocks”, “chainstate” and if available also “database”.
    - `rm -rf blocks/`
    - `rm -rf chainstate/`
    - `rm -rf database/`
    - I also remove these files for a clean install since the masternode wallet.dat is not that important.
      - `rm *.log`
      - `rm *.dat`
      - `rm *.lock`
      - `rm *.pid`
  * download the latest bootstrap from the official DAPS Coin repository
    - `wget -N https://github.com/DAPSCoin/BootStrap/releases/download/latest/bootstrap.zip`
  * unzip the bootstrap
    - `unzip bootstrap.zip`
    - if you get an error that there is no unzip program installed and try again.
      - `sudo apt install unzip -y`
  * that's it!
  * Or you can use Justin's (Lycidal) script.
    - https://raw.githubusercontent.com/lyricidal/Scripts/master/bootstrap.sh
