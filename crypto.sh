#!/bin/bash

# ___| |_   _| | ___ _ __ 
#/ __| \ \ / / |/ _ \ '__|
#\__ \ |\ V /| |  __/ |   
#|___/_| \_/ |_|\___|_| 
#A script written by slvler in September 2024 under GNU GENERAL PUBLIC LICENSE
#

NC=$'\e[0m'

# Background
REDBg=$'\e[0;41m'
GREENBg=$'\e[0;42m'
YELLOWBg=$'\e[0;43m'
BLUEBg=$'\e[0;44m'
PINKBg=$'\e[0;45m'
CYANBg=$'\e[0;46m'
WHITEBg=$'\e[0;47m'

# Color
RED=$'\e[0;31m'
GREEN=$'\e[0;32m'
YELLOW=$'\e[0;33m'
BLUE=$'\e[0;34m'
PINK=$'\e[0;35m'
CYAN=$'\e[0;36m'
WHITE=$'\e[0;37m'

# Underline
URED=$'\e[4;31m'
UGREEN=$'\e[4;32m'
UYELLOW=$'\e[4;33m'
UBLUE=$'\e[4;34m'
UPINK=$'\e[4;35m'
UCYAN=$'\e[4;36m'
UWHITE=$'\e[4;37m'


curl_check(){
  curl -V foo >/dev/null 2>&1 || { echo "I require foo but it's not installed.  Aborting." >&2; exit 1; }
}

# Setting
function help () {
    echo ""
    echo -e "Bash script to Plaintext query api to retrieve data from blockchain.com"
    echo -e "to make it work ${GREEN}sudo bash crypto.sh$NC"
    echo "----------------------------------------------------------"
    echo -e $CYAN"    Create by           $WHITE":" $RED slvler$NC"
    echo -e $CYAN"    Developer           $WHITE":" $RED https://github.com/slvler$NC"
    echo -e $CYAN"    Version             $WHITE":" $RED v1.0.0$NC"
    echo ""
}

function qt(){
    clear
    echo ""
    echo "----------------------------------------------------------"
    echo -e $REDBg"EXİT$NC"
    echo ""
    exit 0
}

#real time
function getdifficulty() {
  getdifficulty=$(curl -s "https://blockchain.info/q/getdifficulty")
  echo "Current difficulty target as a decimal number: $getdifficulty"
}
function getblockcount() {
  getblockcount=$(curl -s "https://blockchain.info/q/getblockcount")
  echo "Current block height in the longest chain: $getblockcount"
}
function latesthash() {
  latesthash=$(curl -s "https://blockchain.info/q/latesthash")
  echo "Hash of the latest block: $latesthash"
}
function bcperblock() {
  bcperblock=$(curl -s "https://blockchain.info/q/bcperblock")
  echo "Current block reward in BTC: $bcperblock"
}
function totalbc() {
  totalbc=$(curl -s "https://blockchain.info/q/totalbc")
  echo "Total Bitcoins in circulation (delayed by up to 1 hour): $totalbc"
}
function probability() {
  probability=$(curl -s "https://blockchain.info/q/probability")
  echo "Probability of finding a valid block each hash attempt: $probability"
}
function hashestowin() {
  hashestowin=$(curl -s "https://blockchain.info/q/hashestowin")
  echo "Average number of hash attempts needed to solve a block: $hashestowin"
}
function nextretarget() {
  nextretarget=$(curl -s "https://blockchain.info/q/nextretarget")
  echo "Block height of the next difficulty re-target: $nextretarget"
}
function avgtxsize() {
  avgtxsize=$(curl -s "https://blockchain.info/q/avgtxsize")
  echo "Block height of the next difficulty re-target: $avgtxsize"
}
function avgtxvalue() {
  avgtxvalue=$(curl -s "https://blockchain.info/q/avgtxvalue")
  echo "Average transaction value (1000 Default): $avgtxvalue"
}
function interval() {
  interval=$(curl -s "https://blockchain.info/q/interval")
  echo "Average time between blocks in seconds: $interval"
}
function eta() {
  eta=$(curl -s "https://blockchain.info/q/eta")
  echo "Average time between blocks in seconds: $eta"
}
function avgtxnumber() {
  avgtxnumber=$(curl -s "https://blockchain.info/q/avgtxnumber")
  echo "Average time between blocks in seconds: $avgtxnumber"
}
#--
function getreceivedbyaddress() {
  getreceivedbyaddress=$(curl -s "https://blockchain.info/q/getreceivedbyaddress/$1")
  echo "Get the total number of bitcoins received by an address (in satoshi): $getreceivedbyaddress"
}
function getsentbyaddress() {
  getsentbyaddress=$(curl -s "https://blockchain.info/q/getsentbyaddress/$1")
  echo "Get the total number of bitcoins send by an address (in satoshi): $getsentbyaddress"
}
function addressbalance() {
  addressbalance=$(curl -s "https://blockchain.info/q/addressbalance/$1")
  echo "Get the balance of an address (in satoshi): $addressbalance"
}
function addressfirstseen() {
  addressfirstseen=$(curl -s "https://blockchain.info/q/addressfirstseen/$1")
  echo "Timestamp of the block an address was first confirmed in: $addressfirstseen"
}

#Tools
function addresstohash() {
  addresstohash=$(curl -s "https://blockchain.info/q/addresstohash/$1")
  echo "Converts a bitcoin address to a hash 160: $addresstohash"
}
function hashtoaddress() {
  hashtoaddress=$(curl -s "https://blockchain.info/q/hashtoaddress/$1")
  echo "Converts a hash 160 to a bitcoin address: $hashtoaddress"
}
function hashpubkey() {
  hashpubkey=$(curl -s "https://blockchain.info/q/hashpubkey/$1")
  echo "Converts a public key to a hash 160: $hashpubkey"
}
function addrpubkey() {
  addrpubkey=$(curl -s "https://blockchain.info/q/addrpubkey/$1")
  echo "Converts a public key to an Address: $addrpubkey"
}
function pubkeyaddr() {
  pubkeyaddr=$(curl -s "https://blockchain.info/q/pubkeyaddr/$1")
  echo "Converts an address to public key (if available): $pubkeyaddr"
}
#Transactions Lookups
function txtotalbtcoutput() {
  txtotalbtcoutput=$(curl -s "https://blockchain.info/q/txtotalbtcoutput/$1")
  echo "Get total output value of a transaction (in satoshi): $txtotalbtcoutput"
}
function txtotalbtcinput() {
  txtotalbtcinput=$(curl -s "https://blockchain.info/q/txtotalbtcinput/$1")
  echo "Get total input value of a transaction (in satoshi): $txtotalbtcinput"
}
function txfee() {
  txfee=$(curl -s "https://blockchain.info/q/txfee/$1")
  echo "Get fee included in a transaction (in satoshi): $txfee"
}
function txresult() {
  txresult=$(curl -s "https://blockchain.info/q/txresult/$1/$2")
  echo "Calculate the result of a transaction sent or received to Address: $txresult"
}

#misc
function unconfirmedcount() {
  unconfirmedcount=$(curl -s "https://blockchain.info/q/unconfirmedcount")
  echo "Number of pending unconfirmed transactions: $unconfirmedcount"
}
function hrprice() {
  24hrprice=$(curl -s "https://blockchain.info/q/24hrprice")
  echo "Number of pending unconfirmed transactions: $24hrprice"
}
function marketcap() {
  marketcap=$(curl -s "https://blockchain.info/q/marketcap")
  echo "Number of pending unconfirmed transactions: $marketcap"
}
function hrtransactioncount() {
  hrtransactioncount=$(curl -s "https://blockchain.info/q/24hrtransactioncount")
  echo "Number of pending unconfirmed transactions: $hrtransactioncount"
}
function hrbtcsent() {
  hrbtcsent=$(curl -s "https://blockchain.info/q/24hrbtcsent")
  echo "Number of pending unconfirmed transactions: $hrbtcsent"
}
function hashrate() {
  hashrate=$(curl -s "https://blockchain.info/q/hashrate")
  echo "Number of pending unconfirmed transactions: $hashrate"
}
function rejected() {
  rejected=$(curl -s "https://blockchain.info/q/rejected")
  echo "Number of pending unconfirmed transactions: $rejected"
}


while :
do
echo ""
echo "  ~~~~~~ Plaintext query api to retrieve data from blockchain.com ~~~~~~"
echo ""
echo " [1] ✔ Real-time "
echo " [2] ✔ Tools "
echo " [3] ✔ Transactions Lookups "
echo " [4] ✔ Misc"
echo " [x] ✔ Exit"
echo ""
echo "enter process "
read type

case "$type" in
    1)
        clear
        echo ""
        echo "  ~~~~~~~~~~~~~~~~~~~~~ Real time ~~~~~~~~~~~~~~~~~~~~~~~~~"
        echo " [1] ✔ Current difficulty target as a decimal number"
        echo " [2] ✔ Current block height in the longest chain"
        echo " [3] ✔ Hash of the latest block"
        echo " [4] ✔ Current block reward in BTC"
        echo " [5] ✔ Total Bitcoins in circulation (delayed by up to 1 hour)"
        echo " [6] ✔ Probability of finding a valid block each hash attempt"
        echo " [7] ✔ Average number of hash attempts needed to solve a block"
        echo " [8] ✔ Block height of the next difficulty re-target"
        echo " [9] ✔ Average transaction size for the past 1000 blocks. Change the number of blocks by passing an integer as the second argument e.g. avgtxsize/2000"
        echo " [10] ✔ Average transaction value (1000 Default)"
        echo " [11] ✔ Average time between blocks in seconds"
        echo " [12] ✔ Estimated time until the next block (in seconds)"
        echo " [13] ✔ Average number of transactions per block (100 Default)"
        echo " [14] ✔ Get the total number of bitcoins received by an address (in satoshi)"
        echo " [15] ✔ Get the total number of bitcoins send by an address (in satoshi)"
        echo " [16] ✔ Get the balance of an address (in satoshi)"
        echo " [17] ✔ Timestamp of the block an address was first confirmed in"
        echo " [x] ✔ Exit"
        echo ""

        echo "enter to process: "
        read process

        if [ $process == 1 ]; then
            clear
            getdifficulty
        elif [ $process == 2 ]; then
            clear
            getblockcount
        elif [ $process == 3 ]; then
            clear
            latesthash
        elif [ $process == 4 ]; then
            clear
            bcperblock
        elif [ $process == 5 ]; then
            clear
            totalbc
        elif [ $process == 6 ]; then
            clear
            probability
        elif [ $process == 7 ]; then
            clear
            hashestowin
        elif [ $process == 8 ]; then
            clear
            nextretarget
        elif [ $process == 9 ]; then
            clear
            avgtxsize
        elif [ $process == 10 ]; then
            clear
            avgtxvalue
        elif [ $process == 11 ]; then
            clear
            interval
        elif [ $process == 12 ]; then
            clear
            eta
        elif [ $process == 13 ]; then
            clear
            avgtxnumber
        elif [ $process == 14 ]; then
            clear
            echo "Address: "
            read address
            if [ -z "$address" ]
              then
                echo "Parameter missing"
                exit 1
            fi
            getreceivedbyaddress $address
        elif [ $process == 15 ]; then
            clear
            echo "Address: "
            read address
            if [ -z "$address" ]
              then
                echo "Parameter missing"
                exit 1
            fi
            getsentbyaddress $address
        elif [ $process == 16 ]; then
            clear
            echo "Address: "
            read address
            if [ -z "$address" ]
              then
                echo "Parameter missing"
                exit 1
            fi
            addressbalance $address
        elif [ $process == 17 ]; then
            clear
            echo "Address: "
            read address
            if [ -z "$address" ]
              then
                echo "Parameter missing"
                exit 1
            fi
            addressfirstseen $address
        else
            clear
            echo "not"
        fi
    ;;
    2)
        clear
        echo ""
        echo "  ~~~~~~~~~~~~~~~~~~~~~ Tools ~~~~~~~~~~~~~~~~~~~~~~~~~"
        echo " [1] ✔ Converts a bitcoin address to a hash 160"
        echo " [2] ✔ Converts a hash 160 to a bitcoin address"
        echo " [3] ✔ Converts a public key to a hash 160"
        echo " [4] ✔ Converts a public key to an Address"
        echo " [5] ✔ Converts an address to public key (if available)"
        echo " [x] ✔ Exit"
        echo ""

        echo "enter to process: "
        read process

        if [ $process == 1 ]; then
            clear
            echo "Address: "
            read address
            if [ -z "$address" ]
              then
                echo "Parameter missing"
                exit 1
            fi
            addresstohash $address
        elif [ $process == 2 ]; then
            clear
            echo "Address: "
            read address
            if [ -z "$address" ]
              then
                echo "Parameter missing"
                exit 1
            fi
            hashtoaddress $address
        elif [ $process == 3 ]; then
            clear
            echo "Address: "
            read address
            if [ -z "$address" ]
              then
                echo "Parameter missing"
                exit 1
            fi
            hashpubkey $address
        elif [ $process == 4 ]; then
            clear
            echo "Address: "
            read address
            if [ -z "$address" ]
              then
                echo "Parameter missing"
                exit 1
            fi
            addrpubkey $address
        elif [ $process == 5 ]; then
            clear
            echo "Address: "
            read address
            if [ -z "$address" ]
              then
                echo "Parameter missing"
                exit 1
            fi
            pubkeyaddr $address
        else
            clear
            echo "not"
        fi
    ;;
    3)
        clear
        echo ""
        echo "  ~~~~~~~~~~~~ Transactions Lookups ~~~~~~~~~~~~"
        echo " [1] ✔ Get total output value of a transaction (in satoshi)"
        echo " [2] ✔ Get total input value of a transaction (in satoshi)"
        echo " [3] ✔ Get fee included in a transaction (in satoshi)"
        echo " [4] ✔ Calculate the result of a transaction sent or received to Address."
        echo " [x] ✔ Exit"
        echo ""

        echo "enter to process: "
        read process

        if [ $process == 1 ]; then
            clear
            echo "Address: "
            read address
            if [ -z "$address" ]
              then
                echo "Parameter missing"
                exit 1
            fi
            txtotalbtcoutput $address
        elif [ $process == 2 ]; then
            clear
            echo "Address: "
            read address
            if [ -z "$address" ]
              then
                echo "Parameter missing"
                exit 1
            fi
            txtotalbtcinput $address
        elif [ $process == 3 ]; then
            clear
            echo "Address: "
            read address
            if [ -z "$address" ]
              then
                echo "Parameter missing"
                exit 1
            fi
            txfee $address
        elif [ $process == 4 ]; then
            clear
            echo "Hash: "
            read hash
            echo "Address: "
            read address
            if [[ -z "$hash" && -z "$address" ]]
              then
                echo "Parameter missing"
                exit 1
            fi
            txresult $hash $address
        else
            clear
            echo "not"
        fi
    ;;
    4)
        clear
        echo ""
        echo "  ~~~~~~~~~~~~~~~~~~~ Misc ~~~~~~~~~~~~~~~~~~~"
        echo " [1] ✔ Number of pending unconfirmed transactions"
        echo " [2] ✔ 24 hour weighted price from the largest exchanges"
        echo " [3] ✔ USD market cap (based on 24 hour weighted price)"
        echo " [4] ✔ Number of transactions in the past 24 hours"
        echo " [5] ✔ Number of btc sent in the last 24 hours (in satoshi)"
        echo " [6] ✔ Estimated network hash rate in gigahash)"
        echo " [7] ✔  Lookup the reason why the provided tx or block hash was rejected (if any)"
        echo " [x] ✔ Exit"
        echo ""

        echo "enter to process: "
        read process

        if [ $process == 1 ]; then
            clear
            unconfirmedcount
        elif [ $process == 2 ]; then
            clear
            hrprice
        elif [ $process == 3 ]; then
            clear
            marketcap
        elif [ $process == 4 ]; then
            clear
            hrtransactioncount
        elif [ $process == 5 ]; then
            clear
            hrbtcsent
        elif [ $process == 6 ]; then
            clear
            hashrate
        elif [ $process == 7 ]; then
            clear
            rejected
        else
            clear
            echo "not"
        fi
    ;;
    x)
        qt
    ;;
    *)
        help
    ;;
  esac

done
