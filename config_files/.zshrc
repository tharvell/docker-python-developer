setopt histignorealldups sharehistory

source ~/.zsh/antigen.zsh

# Load the theme.
antigen theme denysdovhan/spaceship-prompt
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
# Tell Antigen that you're done.
antigen apply

ZSH_THEME=spaceship

# Use vi keybindings
bindkey -v 

# Remove the esc lag
export KEYTIMEOUT=1

#antigen theme denysdovhan/spaceship-prompt

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

export EDITOR=vim

# 
alias vi=vim
alias manual_ctags='ctags -R --fields=+l --languages=python --python-kinds=-iv -f ./tags /usr/local/lib/python3.7 /usr/local/lib/python3.7/lib-dynload /usr/local/lib/python3.7/site-packages ~'

SPACESHIP_VI_MODE_SHOW=false

SPACESHIP_USER_COLOR_ROOT=88
SPACESHIP_USER_COLOR=24

SPACESHIP_CHAR_COLOR_SUCCESS=100
SPACESHIP_CHAR_COLOR_FAILURE=88
SPACESHIP_CHAR_COLOR_SECONDARY=136

SPACESHIP_TIME_COLOR=96

SPACESHIP_HOST_COLOR=96
SPACESHIP_HOST_COLOR_SSH=96
SPACESHIP_DIR_COLOR=96
SPACESHIP_DIR_LOCK_COLOR=130

SPACESHIP_EXEC_TIME_COLOR=66
# Git Colors
SPACESHIP_GIT_BRANCH_COLOR=66
SPACESHIP_GIT_STATUS_COLOR=66

# Python Colors 
SPACESHIP_VENV_COLOR=96
