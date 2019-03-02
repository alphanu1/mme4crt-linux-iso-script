#!/bin/bash

NC="\033[0m"
version=$(lsb_release -c -s)

echo -e "\033[32mRuning apt update$\033[0m"
echo "$STR"
sleep 1
sudo apt-get update -y
echo "$STR"
echo -e "\033[32mDone\033[0m"
echo "$STR"

echo -e "\033[32mAdding retroarch repo \033[0m"
echo "$STR"
sleep 1
sudo add-apt-repository ppa:libretro/stable -y
sudo add-apt-repository ppa:libretro/testing -y
echo "$STR"
echo -e "\033[32mDone\033[0m"
echo "$STR"

echo -e "\033[32mEditing Sources lists\033[0m"
echo "$STR"
sleep 1
sudo sed -i 's/#/ /g' /etc/apt/sources.list.d/libretro-ubuntu-stable-$version.list
echo "$STR"
echo -e "\033[32mDone\033[0m"

echo "$STR"
echo -e "\033[32mRe-compiling apt database\033[0m"
echo "$STR"
sleep 1
sudo apt-get update -y
echo "$STR"
echo -e "\033[32mDone\033[0m"
echo "$STR"

echo -e "\033[32mInstalling dependencies\033[0m"
echo "$STR"
sleep 1
sudo apt-get build-dep retroarch -y
sudo apt-get install git build-essential libasound2-dev libpulse-dev libsdl2-dev libvulkan-dev libjack-dev libxrandr-dev -y
echo "$STR"
echo -e "\033[32mDone\033[0m"
echo "$STR"

echo -e "\033[32mDownloading MME4CRT\033[0m"
echo "$STR"
sleep 1
sudo git clone https://github.com/alphanu1/MME4CRT ~/mme4crt
echo "$STR"
echo -e "\033[32mDone\033[0m"
echo "$STR"

echo -e "\033[32mSetting file permissions for mme4crt\033[0m"
echo "$STR"
sleep 1
sudo chmod -R 777 ~/mme4crt
echo "$STR"
echo -e "\033[32mDone\033[0m"
echo "$STR"

echo -e "\033[32mCreating MME4CRT config header\033[0m"
echo "$STR"
sleep 1
cd ~/mme4crt && ./configure --disable-qt
echo "$STR"
echo -e "\033[32mDone\033[0m"
echo "$STR"

echo -e "\033[32mCompiling MME4CRT\033[0m"
echo "$STR"
sleep 1
cd ~/mme4crt && make -j4
echo "$STR"
echo -e "\033[32mDone\033[0m"

echo "$STR"
echo -e "\033[32mInstalling MME4CRT\033[0m"
echo "$STR"
sleep 1
cd ~/mme4crt && sudo make install
echo "$STR"
echo -e "\033[32mDone\033[0m"
echo "$STR"

echo -e "\033[32mRunning MME4CRT_v2.0\033[0m"
echo "$STR"
