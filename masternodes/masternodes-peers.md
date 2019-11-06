# How to apply the latest peers.dat to your masternodes
  * stop your masternode
    - `dapscoin-cli stop`
    - it will be `stop00`, `stop01`, `stop02`, etc if you have multiple masternodes
  * go to `.dapscoin` folder.  For the multiplenodes, it will be something like `.dapscoin00`, `.dapscoin01`, `.dapscoin02`, `.dapscoin03`. etc.
  * either remove or backup your existing peer.dat
    - to remove
      - `rm peers.dat`
    - to back it up
      - `mv peers.dat peers.dat.backup`
  * `wget https://github.com/DAPSCoin/BootStrap/releases/download/latest/peers.dat`

