# Masternode Checklist
  * This page still needs some work.  It may not work perfectly.  If you find any issues or I messed up the steps, please let me know.

## Server
  * Did you check if it is compatible to run the masternode?
  * Did you update the server? - `sudo apt update && sudo apt upgrade -y`
  * Did you enable firewall with allowed ports?
  * Did you check your swap and decide to increase?
  * Did you decide to enable zRam?
  * Did you add clean memory script to cronjob?

## Single Masternode
  * Did you follow the DAPS Masternode setup instruction?
  * Did you follow the QT Wallet setup instruction?
  * Did you check the QT Wallet to setup the masternode checklist below?
  * Did you create a `dapscoin.config` file in your masternode server's `.dapscoin` folder?
  * If you checked all above, you should be able to run the masternode by running `dapscoind -daeemon`

## Multiple Masternodes
  * If you have decided to run multiple masternodes, did you decide how many nodes you want to run?
  * If you have decided to run multiple masternodes, did you enable IPv6?
  * After IPv6 is enabled, did you add list of IPv6?
  * Either Did you run the multiple node script from the DapsCoin Team or created appropriate files under `/usr/local/bin` and `.dapscoin00 to .dapscoinXX`?
  * Did you create a `dapscoin.config` file in your masternode server's `.dapscoin00` to `.dapscoin[xx]` folder? - where xx is your max node.
  * After following all the stpes above and QT wallet steps, you should be able to run `init00` if you have followed DapsCoin's multiple node setup procedure properly.

## QT Wallet to setup the masternode
  * Did you run `masternode genkey` from the debug console to get the masterprivkey and copied it down?
  * Did you run `createprivacyaccount` from the debug console to get the stealthkey and copied it down?
  * Did you send `1,000,000` Dapscoin to your `stealthkey` and clicked the copy the transaction? You need that and copied it down.
  * Did you create a string for your `masternode.conf` file? It looks likse `mn002 Server-IP-Address:53572 masternodeprivkey transaction-ID 0`


