export TMUX_CONF=$HOME/.config/tmux/tmux.conf
tmux source-file $TMUX_CONF

eval "$(starship init bash)"
