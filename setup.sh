# Get Yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ..
rm -rf yay

# Install packages
yay -S - --noconfirm < ./pkglist.txt

# Set shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
mv ~/.zshrc.pre-oh-my-zsh ~/.zshrc

# Get dotfiles and stow
rm ~/.zshrc
mkdir /home/cnor/.config
git clone https://github.com/ChilloManiac/dotfiles.git /home/cnor/stow
cd /home/cnor/stow
stow confs
cd ~

# Setup Greeter

# Setup asdf

# Config Vim?


# TODO
## Wayland Environments (firefox etc)
## Add hotkey to grim/slurp

