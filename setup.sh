# Get Yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ..
rm -rf yay

# Install packages
yay -S - --noconfirm < ./pkglist.txt

# Get dotfiles and stow
rm ~/.zshrc
mkdir /home/cnor/.config
git clone https://github.com/ChilloManiac/dotfiles.git /home/cnor/stow
cd /home/cnor/stow
stow confs
cd ~

# Set shell
chsh -s /usr/bin/zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
mv ~/.zshrc.pre-oh-my-zsh ~/.zshrc

git clone https://github.com/Aloxaf/fzf-tab ~/.oh-my-zsh/custom/plugins/fzf-tab

# Setup Greeter

# Setup asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.0
. $HOME/.asdf/asdf.sh
asdf plugin add node
asdf plugin add yarn
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
asdf install nodejs
asdf global nodejs $(asdf latest nodejs)
asdf install yarn
asdf global yarn $(asdf latest yarn)

# Config Vim?
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

reboot


# TODO
## Wayland Environments (firefox etc)
## Add hotkey to grim/slurp
## fzf tab
## Configure swaylock and sway
## Get Sway-borders when they are on AUR?
## Get and configure bar

