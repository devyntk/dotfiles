source "$HOME"/.config/zsh/antidote.zsh
source "$HOME"/.config/zsh/rbenv.zsh

function zr () { zellij run --name "$*" -- zsh -ic "$*";}
function zrf () { zellij run --name "$*" --floating -- zsh -ic "$*";}
function ze () { zellij edit "$*";}
function zef () { zellij edit --floating "$*";}

path+=("${HOME}/.local/bin")
alias nvim="${HOME}/.local/bin/nvim"
export EDITOR=/home/dekeeney/.local/bin/nvim


