#!/usr/bin/bash

# Run this after changing root on arch
ln -sf /usr/share/zoneinfo/Europe/Copenhagen /etc/localtime
hwclock --systohc

cp /etc/locale.gen /etc/locale.gen.bak
echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
