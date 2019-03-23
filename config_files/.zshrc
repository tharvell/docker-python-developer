setopt histignorealldups sharehistory

source ~/.zsh/antigen.zsh

# Load the theme.
antigen theme denysdovhan/spaceship-prompt
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
# Tell Antigen that you're done.
antigen apply

# Use vi keybindings
bindkey -v 

# Remove the esc lag
export KEYTIMEOUT=1

#antigen theme denysdovhan/spaceship-prompt

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# 
alias vi=vim

SPACESHIP_VI_MODE_SHOW=false
