#/bin/sh

# This script was tested on : 
# DISTRIB_ID=Ubuntu
# DISTRIB_RELEASE=18.04
# DISTRIB_CODENAME=bionic
# DISTRIB_DESCRIPTION="Ubuntu 18.04.2 LTS"
# NAME="Ubuntu"
# VERSION="18.04.2 LTS (Bionic Beaver)"
# ID=ubuntu
# ID_LIKE=debian
# PRETTY_NAME="Ubuntu 18.04.2 LTS"
# VERSION_ID="18.04"
# HOME_URL="https://www.ubuntu.com/"
# SUPPORT_URL="https://help.ubuntu.com/"
# BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
# PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
# VERSION_CODENAME=bionic
# UBUNTU_CODENAME=bionic

cp ./docker-python-developer/config_files/.* /home/ubuntu/ 

apt-get install gcc -y
apt-get install python3-dev -y
apt-get install build-essential -y
apt-get install fonts-powerline -y
apt-get install cmake -y
apt-get install ctags -y
apt-get install zsh -y
apt-get install git -y 
apt-get install clang -y
sudo apt-get install  libperl-dev -y
sudo apt-get install ruby-dev -y
sudo apt-get install libncurses5-dev libncursesw5-dev -y

# snap install docker

##### Remove and install vim #####
sudo apt-get remove vim.tiny -y
sudo apt-get remove vim -y

git clone https://github.com/vim/vim.git

cd vim 

./configure --with-features=huge --enable-python3interp=yes --enable-perlinterp=yes --disable-tclinterp --enable-multibyte --enable-cscope --with-tlib=ncurses -enable-fail-if-missing --disable-darwin --enable-rubyinterp=yes --enable-terminal --enable-fontset --with-python3-comand=python3 --enable-gtk3-check

make &&  make install

rm -rf vim 

mkdir /home/ubuntu/.zsh && curl -L git.io/antigen > /home/ubuntu/.zsh/antigen.zsh 

# git clone https://github.com/zsh-users/antigen.git /home/ubuntu/antigen

# (crontab -l 2>/dev/null; echo "1 * * * * ctags -R --fields=+l --languages=python --python-kinds=-iv -f ./tags $(python -c "import os, sys; print(' '.join('{}'.format(d) for d in sys.path if os.path.isdir(d)))") ~")| crontab -

mkdir -p /home/ubuntu/.vim/autoload /home/ubuntu/.vim/bundle

curl -LSso /home/ubuntu/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

cd /home/ubuntu/.vim/bundle
git clone https://github.com/tpope/vim-fugitive.git
git clone https://github.com/jnurmine/Zenburn.git
git clone https://github.com/nvie/vim-flake8.git
git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/vim-syntastic/syntastic.git
git clone https://github.com/tmhedberg/SimpylFold.git
git clone https://github.com/vim-scripts/indentpython.vim.git
git clone https://github.com/itchyny/lightline.vim
git clone https://github.com/Valloric/YouCompleteMe.git
cd YouCompleteMe && git submodule update --init --recursive
python3 install.py --clang-completer


