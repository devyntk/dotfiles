autoload -U +X compinit && compinit

if [[ $(uname) == "Darwin" ]]; then 
    source "$HOME"/.config/zsh/macos.zsh
elif grep -E '^VERSION_ID="9' /etc/os-release &> /dev/null; then
    source "$HOME"/.config/zsh/el9.zsh
fi

eval "$(starship init zsh)"

export TZ=America/Chicago
