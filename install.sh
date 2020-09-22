#!/usr/bin/bash

# Setup connection first with networkmanager
#echo "Enabling networkmanager"
#systemctl start NetworkManager.service
#systemctl enable NetworkManager.service

pacman -S sudo vi --noconfirm
pacman -S sway swayidle swaylock --noconfirm


echo "Add local user, and add to sudoers file with 'visudo'"

