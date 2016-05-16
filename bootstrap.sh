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
	git-svn
	meld
	xsel
	xclip
	tree
	wmctrl
)

declare -a DEV_PACK=(
	bison
	build-essential
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
)

# update / upgrade
sudo apt-get update
sudo apt-get -y upgrade

#intall tex
sudo apt-get install --no-install-recommends -y texlive-latex-extra pgf latex-xcolor latex-beamer

echo "Installing packages..."
sudo apt-get install -y ${MY_STUFF[@]}
sudo apt-get install -y ${DEV_PACK[@]}

#TODO Change user after sudo!!!

echo "Configuration..."

cd && mkdir Github && cd Github 

echo "Clonning github repos..."

git clone https://github.com/JmyAlex/dotfiles.git
git clone https://github.com/rupa/z.git

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

#FIXME install font https://github.com/belluzj/fantasque-sans

cd #Go back home

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
ln -s ~/Github/dotfiles/.shell_colors ~/.shell_colors
ln -s ~/Github/dotfiles/.shell_functions ~/.shell_functions
ln -s ~/Github/dotfiles/.shell_promt ~/.shell_promt
ln -s ~/Github/dotfiles/tmux_airline ~/tmux_airline
ln -s ~/Github/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/Github/dotfiles/.vimrc ~/.vimrc

cp -r ~/Github/dotfiles/.urxvt ~/
cp -r ~/Github/dotfiles/.config/mc ~/.config/
cp -r ~/Github/dotfiles/.config/ranger ~/.config/

vim +PluginInstall +qall

cp ~/Github/dotfiles/tomorrow.vim ~/.vim/bundle/vim-airline/autoload/airline/themes

sudo dpkg-reconfigure wireshark-common 
sudo usermod -a -G wireshark jeremy
sudo usermod -a -G dialout jeremy

cat <<-EOF
TODO ...
	Install font
	Add hdd to fstab
	Copy compilers
EOF



#atftpd config
#USE_INETD=false
#OPTIONS="--tftpd-timeout 300 --retry-timeout 5 --daemon --no-multicast --maxthread 100 --verbose=5 /srv/tftp"
