# Create greeter user
sudo useradd greeter

# Get Yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ..
rm -rf yay

# Install packages
yay -Syu --noconfirm
yay -S - --noconfirm < ./pkglist.txt

# background
sudo mv main.jpg /usr/share/backgrounds/

# Setup asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.0
chmod +x ~/.asdf/asdf.sh
. ~/.asdf/asdf.sh
asdf plugin add nodejs #Some error on nodejs
asdf plugin add yarn
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
asdf install nodejs 14.13.0
asdf global nodejs 14.13.0
asdf install yarn 1.22.5
asdf global yarn 1.22.5

# Get dotfiles and stow
rm ~/.zshrc
mkdir /home/cnor/.config
git clone https://github.com/ChilloManiac/dotfiles.git /home/cnor/stow
cd /home/cnor/stow
stow confs
cd ~

# Install sessions

# Set shell
chsh -s /usr/bin/zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
mv ~/.zshrc.pre-oh-my-zsh ~/.zshrc

git clone https://github.com/Aloxaf/fzf-tab ~/.oh-my-zsh/custom/plugins/fzf-tab

# Setup Sddm

# Config Vim?
npm g -i neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'


reboot



