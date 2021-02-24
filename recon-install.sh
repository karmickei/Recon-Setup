#!/bin/sh

#Color
green='\033[0;32m'
red='\e[0;31m'
white='\e[0;37m'

#First check of setup for internet connection by connecting to google over http
echo "$green" "[ * ] Checking for internet connection"
sleep 1
echo "GET http://google.com HTTP/1.0\n\n" | nc google.com 80 > /dev/null 2>&1
if [ $? -ne 0 ]; then
echo "$red" [ X ]::[Internet Connection]: OFFLINE!;
chknet
exit
    sleep 1
else
echo "$green" [ ✔ ]::[Internet Connection]: CONNECTED!;
    sleep 1
    #cont
echo "                                         "
fi

echo "$white" "*****************************************"
echo "$white" "***** Installing necessary packages *****"
echo "$white" "*****************************************"
echo "                                         "

apt-get update

apt-get install golang amass subfinder assetfinder altdns wget eyewitness -y

clear

echo "$white" "*****************************************"
echo "$white" "**** Checking if golang is installed ****"
echo "$white" "*****************************************"
echo "                                         "

go env

echo "                                         "
echo "$white" "*****************************************"
echo "$white" "**** Checking if amass is installed ****"
echo "$white" "*****************************************"
echo "                                         "

amass -version

echo "                                         "
echo "$white" "*****************************************"
echo "$white" "** Checking if subfinder is installed **"
echo "$white" "*****************************************"
echo "                                         "

subfinder -version

echo "                                         "
echo "$white" "*****************************************"
echo "$white" "* Checking if assetfinder is installed *"
echo "$white" "*****************************************"
echo "                                         "

assetfinder -h

echo "                                         "
echo "$white" "*****************************************"
echo "$white" "**** Checking if altdns is installed ****"
echo "$white" "*****************************************"
echo "                                         "

altdns

echo "                                         "
echo "$white" "*****************************************"
echo "$white" "***** Checking if wget is installed *****"
echo "$white" "*****************************************"
echo "                                         "

wget -V

echo "                                         "
echo "$white" "*****************************************"
echo "$white" "*** Installing Findomain via Binaries ***"
echo "$white" "*****************************************"
echo "                                         "

mkdir findomain-linux
cd findomain-linux
wget https://github.com/Edu4rdSHL/findomain/releases/latest/download/findomain-linux
chmod +x findomain-linux
mv findomain-linux findomain
mv findomain /usr/local/bin/

echo "                                         "
echo "$white" "*****************************************"
echo "$white" "** Checking if Findomain is installed **"
echo "$white" "*****************************************"
echo "                                         "

findomain -V
echo "                                         "

echo "** Success..!! Tools for Basic Recon is Ready **"
exit
