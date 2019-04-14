#/bin/sh

apt-get update -y
apt-get install gcc -y
apt-get install python3-dev -y
apt-get install build-essential -y
apt-get install fonts-powerline -y
apt-get install cmake -y
apt-get install ctags -y
apt-get install zsh -y
apt-get install git -y 

mkdir ~/.zsh && curl -L git.io/antigen > ~/.zsh/antigen.zsh 

git clone https://github.com/zsh-users/antigen.git ~/antigen

(crontab -l 2>/dev/null; echo "1 * * * * ctags -R --fields=+l --languages=python --python-kinds=-iv -f ./tags $(python -c "import os, sys; print(' '.join('{}'.format(d) for d in sys.path if os.path.isdir(d)))") ~")| crontab -

/usr/bin/python3 /usr/bin/python

mkdir -p ~/.vim/autoload ~/.vim/bundle

curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

cd ~/.vim/bundle
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
./install.py --clang-completer
cd ..
