# Get Yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ..
rm -rf yay

# Install packages
yay -S - --noconfirm < ./pkglist.txt

# Get dotfiles and stow
mkdir /home/cnor/.config
git clone https://github.com/ChilloManiac/dotfiles.git /home/cnor/stow
cd /home/cnor/stow
stow confs
cd ~

# Set shell
chsh -s /usr/bin/zsh

# Setup Greeter


