# export ZSH=$HOME/.oh-my-zsh
# ZSH_THEME="robbyrussell"
# source $ZSH/oh-my-zsh.sh
export ZDOTDIR=$HOME/.config/zsh

# history
HISTFILE=~/.zsh_history
setopt appendhistory share_history
SAVEHIST=100000
HISTSIZE=100000

# Functions
function zsh_add_file() {
    [ -f "$ZDOTDIR/$1" ] && source "$ZDOTDIR/$1"
}

function zsh_add_plugin() {
    PLUGIN_NAME=$(echo $1 | cut -d "/" -f 2)
    if [ -d "$ZDOTDIR/plugins/$PLUGIN_NAME" ]; then
        zsh_add_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.plugin.zsh" || \
        zsh_add_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.zsh"
    else
        git clone "https://github.com/$1.git" "$ZDOTDIR/plugins/$PLUGIN_NAME"
    fi
}

# Plugins
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "zsh-users/zsh-history-substring-search"

zsh_add_file "carnage-theme"
# setxkbmap -option caps:escape

bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=blue'

# Aliases
alias ll="ls -la"
alias g="lazygit"
alias grep='grep --color=auto'
