#!/bin/bash
# for gcp(ubuntu)

id | grep "uid=0" > /dev/null 2>&1
if [ $? = 0 ]; then
  SUDO=""
else
  SUDO="sudo"
fi


$SUDO apt update && $SUDO apt dist-upgrade -y
$SUDO apt install -y autoconf automake bc bison build-essential curl flex g++ \
      g++-multilib gawk gcc gcc-multilib git gnupg gperf imagemagick \
      lib32ncurses5-dev lib32readline-dev lib32z1-dev libc6-dev libexpat1-dev \
      liblz4-1 liblz4-tool liblzma5 liblzma-dev libncurses5-dev libsdl1.2-dev \
      libssl-dev libwxgtk3.0-dev libxml2 libxml2-utils lzop maven patch \
      pkg-config pngcrush python schedtool squashfs-tools texinfo unzip \
      xsltproc zip zlib1g-dev


$SUDO bash -c "curl https://storage.googleapis.com/git-repo-downloads/repo > /bin/repo"

$SUDO chmod 755 /bin/repo

git config --global user.name "keyakko"
git config --global user.email "keyakko.web@gmail.com"

$SUDO useradd android
$SUDO usermod -aG sudo android

$SUDO mkdir -p ~android/android/
$SUDO chown android:android ~/android -R

$SUDO su android -c "cd ~/android && repo init -u https://android.googlesource.com/platform/manifest -b android-9.0.0_r47" -
$SUDO su android -c "cd ~/android && repo sync -j32 --force-sync --no-clone-bundle" -
