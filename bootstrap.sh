#!/bin/bash

#turn on exit on error
set -e

declare -a MY_STUFF=(
    wireshark
    vlc
    cscope
    exuberant-ctags
    iperf
    rxvt-unicode-256color
    ranger
    vim-gnome
    tmux
    silversearcher-ag
    htop
    minicom
    isc-dhcp-server
    atftpd
    subversion
    git
    meld
    xsel
    xclip
    tree
    wmctrl
    mc
    ssh
    fortune
    cowsay
    highlight
    atool
    curl
    fish
    tilix
    clipit
    lxappearance
    pavucontrol
    arc-theme
    papirus-icon-theme
)

declare -a DEV_PACK=(
    bison
    build-essential
    gcc
    fakeroot
    gettext
    gperf
    libncurses5
    libncurses5-dev
    make
    texinfo
    zlib1g-dev
    gawk
    flex
    doxygen
    tcllib
    expect
    unifdef
    pkg-config
    vlan
    wget
    git-svn
    git-core
    diffstat
    unzip
    gcc-multilib
    chrpath
    desktop-file-utils
    groff
    libxml-parser-perl
    libsdl1.2-dev
    xterm
    libgl1-mesa-dev
    libglu1-mesa-dev
    xsltproc
    docbook-utils
    fop
    dblatex
    xmlto
    autoconf
    automake
    libtool
    libglib2.0-dev
    squashfs-tools
    colordiff
    valgrind
)

# update / upgrade
sudo apt-get update
sudo apt-get -y upgrade

#intall tex
#sudo apt-get install --no-install-recommends -y texlive-latex-extra pgf latex-xcolor latex-beamer

echo "Installing packages..."
sudo apt-get install -y ${MY_STUFF[@]}
sudo apt-get install -y ${DEV_PACK[@]}

#TODO Change user after sudo!!!

echo "Configuration..."

mkdir -p $HOME/bin
mkdir -p $HOME/Github
mkdir -p $HOME/.config/fish/functions

echo "Clonning github repos..."

git clone https://github.com/JmyAlex/dotfiles.git $HOME/Github/dotfiles
git clone https://github.com/rupa/z.git $HOME/Github/z

# tmux plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# vim plugins
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#FIXME install font https://github.com/belluzj/fantasque-sans

#install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install

#make backups
mv ~/.bashrc ~/.bashrc_default_backup
mv ~/.profile ~/.profile_default_backup

#FIXME add to fstab
#/dev/sdb1 /mnt/sdb1              ext4    relatime,barrier=0 0       2

#FIXME copy compilers to /opt

echo "Symlinking dot files..."

ln -s ~/Github/dotfiles/.agignore ~/.agignore
ln -s ~/Github/dotfiles/.bashrc ~/.bashrc
ln -s ~/Github/dotfiles/.profile ~/.profile
ln -s ~/Github/dotfiles/.inputrc ~/.inputrc
ln -s ~/Github/dotfiles/.Xresources ~/.Xresources

ln -s ~/Github/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/Github/dotfiles/.shell_aliases ~/.shell_aliases
ln -s ~/Github/dotfiles/.shell_functions ~/.shell_functions
ln -s ~/Github/dotfiles/.shell_promt ~/.shell_promt
ln -s ~/Github/dotfiles/tmux_airline ~/tmux_airline
ln -s ~/Github/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/Github/dotfiles/.vimrc ~/.vimrc
ln -s ~/Github/dotfiles/.config/fish/config.fish ~/.config/fish/config.fish
ln -s ~/Github/dotfiles/.config/fish/functions/fish_prompt.fish ~/.config/fish/functions/fish_prompt.fish

#bspwm
mkdir -p $HOME/.config/bspwm
mkdir -p $HOME/.config/sxhkd
mkdir -p $HOME/.config/polybar
mkdir -p $HOME/.config/dunst
mkdir -p $HOME/.config/rofi
mkdir -p $HOME/.config/tilix/schemes
ln -s ~/Github/dotfiles/.config/bspwm/bspwmrc ~/.config/bspwm/bspwmrc
ln -s ~/Github/dotfiles/.config/sxhkd/sxhkdrc ~/.config/sxhkd/sxhkdrc
ln -s ~/Github/dotfiles/.config/polybar/config ~/.config/polybar/config
ln -s ~/Github/dotfiles/.config/dunst/dunstrc ~/.config/dunst/dunstrc
ln -s ~/Github/dotfiles/.compton.conf ~/.compton.conf
ln -s ~/Github/dotfiles/.config/rofi/config.rasi ~/.config/rofi/config.rasi
ln -s ~/Github/dotfiles/.config/rofi/onedark.rasi ~/.config/rofi/onedark.rasi
cp -r ~/Github/dotfiles/.config/tilix/schemes/* .config/tilix/schemes

cp -r ~/Github/dotfiles/.urxvt ~/
#cp -r ~/Github/dotfiles/.config/mc ~/.config/
#cp -r ~/Github/dotfiles/.config/ranger ~/.config/

vim +PlugInstall +PlugUpdate +qall

mkdir -p ~/.vim/tmp/{undo,backup,swap}

#cp ~/Github/dotfiles/tomorrow.vim ~/.vim/bundle/vim-airline/autoload/airline/themes

#wireshark without sudo
sudo dpkg-reconfigure wireshark-common
sudo usermod -a -G wireshark `whoami`
sudo usermod -a -G dialout `whoami`

sudo dpkg-reconfigure dash

cat <<-EOF
TODO ...
    Install font
    Add hdd to fstab
    Copy compilers
    dash -> bash
    configure dhcp server
    sudo update-alternatives --install /usr/bin/make make /usr/bin/make3.8 10
    sudo update-alternatives --install /usr/bin/make make /usr/bin/make4.1 20
    sudo update-alternatives --config make
    sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 10
    sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 20
    sudo update-alternatives --config gcc
    sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 60 --slave /usr/bin/g++ g++ /usr/bin/g++-4.8
    sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-3.4 40 --slave /usr/bin/g++ g++ /usr/bin/g++-3.4
    sudo update-alternatives --config gcc
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

#change default shell
chsh -s `which fish`
