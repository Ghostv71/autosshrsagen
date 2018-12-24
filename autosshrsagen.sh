#!/bin/bash

###Opening questions for user###

echo "Input 1 to genarate a new RSA key and copy it to a server"

echo "Input 2 to copy a exsiting RSA key to a server please note this verison only supports keys located under ~/.ssh"

###Take case input number from user###

read case





###Start of case###
case $case in

###User has inputted option 1 statments are made###

  "1" ) echo "Make sure your running this as the user you need to genrate a RSA key for"

  echo "READ ME you will be asked for a passphrase you may leave this blank by pressing enter when asked if you set one don't forget it!"

  echo "READ ME I would recommend leaveing the default location of the key set to ~/.ssh you can just press enter when asked where to store the RSA key"

  echo "Type 2046 for a 2046 bit RSA key or 4096 for a 4096 RSA key"

###Takes users selected keysize###
  read keysize

###if statment if user selected 2046 bit###
  if [[ "$keysize" == "2046" ]]; then


###grenarates users 2046 bit key###

    ssh-keygen -t rsa -b 2046

    echo "Please input the username of the system you wish to copy the RSA key to NOTE this is case sensitive"

###Takes users desired username to login to remote server###

    read username

    echo "Please input the IP of the system you wish to copy the RSA key to example 192.168.1.46"

###Takes users desired IP of remote server###
    read ip

###Passes RSA key to remote server specified by user and specified username###
    ssh-copy-id "$username"@"$ip"

###if statment if user selected 4096 bit###
  elif [[ "$keysize" == "4096" ]]; then


###grenarates users 2046 bit key###
    ssh-keygen -t rsa -b 4096

    echo "Please input the username of the system you wish to copy the RSA key to NOTE this is case sensitive"

###Takes users desired username to login to remote server###
    read username

    echo "Please input the IP of the system you wish to copy the RSA key to example 192.168.1.46"

###Takes users desired IP of remote server###
    read ip

###Passes RSA key to remote server specified by user and specified username###
    ssh-copy-id "$username"@"$ip"

  fi ;;






 "2" ) echo "Make sure your running this as the user you need to copy a RSA key for"

 echo "Please input the username of the system you wish to copy the RSA key to NOTE this is case sensitive"

###Takes users desired username to login to remote server###
 read username

 echo "Please input the IP of the system you wish to copy the RSA key to example 192.168.1.46"

###Takes users desired IP of remote server###
 read ip

###Passes RSA key to remote server specified by user and specified username###
 ssh-copy-id "$username"@"$ip" ;;

###comedic relief###
  *) echo "Sorry not a vaild choice better luck next time ya know" ;;

esac
