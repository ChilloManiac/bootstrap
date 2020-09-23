#!/usr/bin/bash

# Run this after changing root on arch

# Time setup
echo "Setting up time"
ln -sf /usr/share/zoneinfo/Europe/Copenhagen /etc/localtime
hwclock --systohc

# Locales
echo "Locales:"
cp /etc/locale.gen /etc/locale.gen.bak
echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
locale-gen
echo 'LANG=en_US.UTF-8' > /etc/locale.conf

echo "Setting host and hostnames"
echo '127.0.0.1     localhost
::1                 localhost
127.0.1.1           cbook.localdomain cbook' > /etc/hosts

echo 'cbook' > /etc/hostname

echo "Setting up network"
pacman -Syy
pacman -Syu --noconfirm
pacman -S networkmanager --noconfirm

systemctl enable NetworkManager.service
pacman -S sudo vi --noconfirm
useradd -m cnor
sudo -S -u cnor pacman -S git base-devel --noconfirm

cd /home/cnor/
git clone https://github.com/ChilloManiac/bootstrap/

cd -

echo "----------------------------------------"
echo "Please Install bootloader"
echo "Please manually set passwd for root and cnor"
