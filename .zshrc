autoload -U +X compinit && compinit

if [[ $(uname) == "Darwin" ]]; then 
    source "$HOME"/.config/zsh/macos.zsh
elif grep -E '^VERSION_ID="9' /etc/os-release &> /dev/null; then
    source "$HOME"/.config/zsh/el9.zsh
fi

if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/theme.omp.toml)"
fi

export TZ=America/Chicago
