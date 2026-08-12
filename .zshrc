source "$HOME"/.config/zsh/global.zsh

if [[ $(uname) == "Darwin" ]]; then 
    source "$HOME"/.config/zsh/macos.zsh
elif grep -E '^VERSION_ID="9' /etc/os-release &> /dev/null; then
    source "$HOME"/.config/zsh/el9.zsh
fi
