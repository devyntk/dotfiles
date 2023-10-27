ANTIGEN="$HOME/.antigen/antigen.zsh"
if [ ! -f $ANTIGEN ]; then
    echo "Cannot find antigen, Installing through curl"
    curl -L git.io/antigen > $ANTIGEN
fi

source $ANTIGEN

antigen use oh-my-zsh

# fish like syntax highlithting
antigen bundle zsh-users/zsh-syntax-highlighting
 
# Fish-like auto suggestions
antigen bundle zsh-users/zsh-autosuggestions

# Extra zsh completions
antigen bundle zsh-users/zsh-completions

antigen apply

export TMUX_CONF=$HOME/.config/tmux/tmux.conf
tmux source-file $TMUX_CONF

eval "$(starship init zsh)"
