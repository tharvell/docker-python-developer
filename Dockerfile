FROM python:3.7-stretch

# Add dependencies, tmux and vim
RUN apt-get update -y \
    && apt-get install cmake -y \
    && apt-get install man -y \ 
    && apt-get install tmux -y  \
    && git clone https://github.com/vim/vim.git \
    && cd vim \
    && ./configure --with-features=huge \
            --enable-multibyte \
	    --enable-rubyinterp=yes \
	    --enable-python3interp=yes \
    --with-python3-config-dir=/usr/lib/python3.5/config \
	    --enable-perlinterp=yes \
	    --enable-luainterp=yes \
            --enable-gui=gtk2 \
            --enable-cscope \
	    --prefix=/usr/local \
    && make VIMRUNTIMEDIR=/usr/local/share/vim/vim81 \
    && make install \
    && cd .. \
    && rm -rf vim  \
    && apt-get clean

# Don't use root user for everything
RUN useradd -ms /bin/bash  developer
USER developer 
WORKDIR /home/developer

# Add .vimrc and .bashrc
COPY  --chown=developer ./config_files .



# Set up vim config with Pathogen 
RUN mkdir -p ~/.vim/autoload ~/.vim/bundle \
    && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim \
    && cd ~/.vim/bundle \
    && git clone https://github.com/tpope/vim-fugitive.git \
    && git clone https://github.com/jnurmine/Zenburn.git \
    && git clone https://github.com/nvie/vim-flake8.git \ 
    && git clone https://github.com/scrooloose/nerdtree.git \
    && git clone https://github.com/vim-syntastic/syntastic.git \ 
    && git clone https://github.com/tmhedberg/SimpylFold.git \
    && git clone https://github.com/vim-scripts/indentpython.vim.git \
    && git clone https://github.com/itchyny/lightline.vim \ 
    && git clone https://github.com/Valloric/YouCompleteMe.git \
       && cd YouCompleteMe && git submodule update --init --recursive \
       && ./install.py --clang-completer \
       && cd ..


