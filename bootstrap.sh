#!/usr/bin/bash

# Run this after changing root on arch

# Time setup
ln -sf /usr/share/zoneinfo/Europe/Copenhagen /etc/localtime
hwclock --systohc

# Locales
cp /etc/locale.gen /etc/locale.gen.bak
echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
locale-gen
echo 'LANG=en_US.UTF-8' > /etc/locale.conf

echo '127.0.0.1     localhost
::1                 localhost
127.0.1.1           cnor.localdomain cnor' > /etc/hostname

mkinitcpio -P

sudo passwd

