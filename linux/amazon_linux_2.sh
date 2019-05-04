#!/bin/sh
# This script was tested on 
# 
# NAME="Amazon Linux"
# VERSION="2"
# ID="amzn"
# ID_LIKE="centos rhel fedora"
# VERSION_ID="2"
# PRETTY_NAME="Amazon Linux 2"
# ANSI_COLOR="0;33"
# CPE_NAME="cpe:2.3:o:amazon:amazon_linux:2"
# HOME_URL="https://amazonlinux.com/"

# Remove the existing vim
yum remove -y vim-common.x86_64 
yum remove -y vim-enhanced.x86_64 -y
yum erase -y vim-common.x86_64 vim-enhanced.x86_64 vim-filesystem.x86_64 

# Install buid dependencies 
yum install gcc -y
yum install ncurses-devel -y
yum install cmake -y 
yum install clang -y 
amazon-linux-extras install epel -y 

# Install vim dependencies 
yum install -y ruby ruby-devel lua lua-devel luajit luajit-devel ctags git python python-devel python3 python3-devel tcl-devel perl perl-devel perl-ExtUtils-ParseXS perl-ExtUtils-XSpp perl-ExtUtils-CBuilder perl-ExtUtils-Embed


yum install tmux -y
yum install zsh -y 


########################################
#
# Install vim from source 
#
########################################

git clone https://github.com/vim/vim.git

cd vim

./configure --with-features=huge \
            --enable-python3interp=yes \
 	    --enable-perlinterp=yes \
 	    --disable-tclinterp \
            --enable-multibyte \
 	    --enable-cscope \
 	    --with-tlib=ncurses \
	    --enable-fail-if-missing \
	    --disable-darwin --enable-luainterp=yes \
	    --enable-rubyinterp=yes --enable-terminal \
 	    --enable-fontset --with-luajit --with-python3-command=python3 \
	    --enable-gtk3-check

make &&  make install


########################################
#
# Install packages for vim 
#
########################################


mkdir -p /home/ec2-user/.vim/autoload /home/ec2-user/.vim/bundle 
curl -LSso /home/ec2-user/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim 
git clone https://github.com/tpope/vim-fugitive.git /home/ec2-user/.vim/bundle/vim-fugitive
git clone https://github.com/jnurmine/Zenburn.git /home/ec2-user/.vim/bundle/Zenburn
git clone https://github.com/nvie/vim-flake8.git /home/ec2-user/.vim/bundle/vim-flake8
git clone https://github.com/scrooloose/nerdtree.git /home/ec2-user/.vim/bundle/nerdtree
git clone https://github.com/vim-syntastic/syntastic.git /home/ec2-user/.vim/bundle/syntastic
git clone https://github.com/tmhedberg/SimpylFold.git /home/ec2-user/.vim/bundle/SimpylFold
git clone https://github.com/vim-scripts/indentpython.vim.git /home/ec2-user/.vim/bundle/indentpython
git clone https://github.com/itchyny/lightline.vim /home/ec2-user/.vim/bundle/lightline
git clone https://github.com/Valloric/YouCompleteMe.git /home/ec2-user/.vim/bundle/YouCompleteMe
cd /home/ec2-user/.vim/bundle/YouCompleteMe && git submodule update --init --recursive && ./install.py --clang-completer 


########################################################
#
# Get some config files and set up antigen for zsh
#
########################################################

mkdir /home/ec2-user/.zsh && curl -L git.io/antigen > /home/ec2-user/.zsh/antigen.zsh 

cd ~

git clone https://github.com/tharvell/docker-python-developer.git

cp docker-python-developer/config_files/.* /home/ec2-user/

chown -R ec2-user:ec2-user /home/ec2-user/*
chown -R ec2-user:ec2-user /home/ec2-user/.*
