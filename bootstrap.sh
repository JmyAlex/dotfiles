#!/bin/bash

#turn on exit on error
set -e

declare -a MY_STUFF=(
    wireshark
    vlc
    iperf
    ranger
    tmux
    htop
    git
    xsel
    xclip
    mc
    ssh
    fortune
    cowsay
    highlight
    atool
    curl
    fish
    tilix
    copyq
)

declare -a DEV_PACK=(
    build-essential
    gcc
    make
    meld
    subversion
    minicom
    isc-dhcp-server
    atftpd
    cscope
    exuberant-ctags
    gawk
    expect
    vlan
    wget
    git-svn
    git-core
    unzip
    gcc-multilib
    valgrind
)

# procs
# exa
# bat
# duf
# fd-find
# sd
# git-delta
# htop
# iotop
# atop
# ripgrep
# openfortivpn
# cargo vivid

declare -a BREW_LIST=(
    bat
    exa
    fd
    fish
    fzf
    midnight-commander
    neovim
    minicom
    node
    cmake
    cscope
    openfortivpn
    ripgrep
    sd
    starship
    tldr
    tmux
    vivid
)

declare -a BREW_CASK=(
    iterm2
    maccy
)

# update / upgrade
sudo apt-get update
sudo apt-get -y upgrade

echo "Installing packages..."
sudo apt-get install -y ${MY_STUFF[@]}
sudo apt-get install -y ${DEV_PACK[@]}

#TODO Change user after sudo!!!

echo "Configuration..."

mkdir -p $HOME/bin
mkdir -p $HOME/Github
mkdir -p $HOME/.config/nvim
mkdir -p $HOME/.config/tilix/schemes

echo "Clonning github repos..."

git clone https://github.com/JmyAlex/dotfiles.git $HOME/Github/dotfiles

# tmux plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

#FIXME install font https://github.com/belluzj/fantasque-sans

#install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install

#make backups
mv ~/.bashrc ~/.bashrc_default_backup
mv ~/.profile ~/.profile_default_backup

echo "Symlinking dot files..."

# ln -s ~/Github/dotfiles/.agignore ~/.agignore
ln -s ~/Github/dotfiles/.rgignore ~/.rgignore
ln -s ~/Github/dotfiles/.gitconfig ~/.gitconfig

ln -s ~/Github/dotfiles/.bashrc ~/.bashrc
ln -s ~/Github/dotfiles/.profile ~/.profile
ln -s ~/Github/dotfiles/.inputrc ~/.inputrc
ln -s ~/Github/dotfiles/.shell_aliases ~/.shell_aliases
ln -s ~/Github/dotfiles/.shell_functions ~/.shell_functions
ln -s ~/Github/dotfiles/.shell_promt ~/.shell_promt

ln -s ~/Github/dotfiles/tmux_airline ~/.tmux_airline
ln -s ~/Github/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/Github/dotfiles/.config/fish/config.fish ~/.config/fish/config.fish
ln -s ~/Github/dotfiles/.clang-format ~/.clang-format
ln -s ~/Github/dotfiles/.config/starship.toml ~/.config/starship.toml
ln -s ~/Github/dotfiles/.config/nvim/init.vim ~/.config/nvim/init.vim
ln -s ~/Github/dotfiles/.config/nvim/lua ~/.config/nvim/lua
cp -r ~/Github/dotfiles/.config/tilix/schemes/* ~/.config/tilix/schemes

mkdir -p $HOME/.local/share/mc/skins && cd $HOME/.local/share/mc/skins && git clone https://github.com/catppuccin/mc.git && ln -s -f ./mc/catppuccin.ini .

#wireshark without sudo
sudo dpkg-reconfigure wireshark-common
sudo usermod -a -G wireshark `whoami`
sudo usermod -a -G dialout `whoami`

cat <<-EOF
TODO ...
    Install font
EOF

#atftpd config
sudo mv /etc/default/atftpd /etc/default/atftpd.backup

sudo bash -c 'cat >>"/etc/default/atftpd" <<-EOF
USE_INETD=false
OPTIONS="--tftpd-timeout 300 --retry-timeout 5 --daemon --no-multicast --maxthread 100 --verbose=5 /srv/tftp"
EOF'

sudo ln -s /srv/tftp /tftpboot
sudo chmod 777 /tftpboot

#isc-dhcp-server config
sudo cp /etc/dhcp/dhcpd.conf /etc/dhcp/dhcpd.conf.backup

sudo bash -c 'cat >>"/etc/dhcp/dhcpd.conf" <<-EOF
subnet 192.168.100.0 netmask 255.255.255.0 {
  range 192.168.100.110 192.168.100.130;
  option domain-name-servers 8.8.8.8;
  #option domain-name "internal.example.org";
  option subnet-mask 255.255.255.0;
  option routers 192.168.100.100;
  option broadcast-address 192.168.100.255;
  default-lease-time 600;
  max-lease-time 7200;
}
EOF'

#fonts:
#https://github.com/sahibjotsaggu/San-Francisco-Pro-Fonts
#https://github.com/google/material-design-icons/tree/master/iconfont
#https://github.com/rayshan/mplus-fonts
#https://github.com/stark/siji

#change default shell
chsh -s `which fish`
