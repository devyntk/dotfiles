source "$HOME"/.config/zsh/antidote.zsh

function zr () { zellij run --name "$*" -- zsh -ic "$*";}
function zrf () { zellij run --name "$*" --floating -- zsh -ic "$*";}
function ze () { zellij edit "$*";}
function zef () { zellij edit --floating "$*";}

path+=('/home/dekeeney/bin')
alias nvim="/home/dekeeney/bin/nvim"
export EDITOR=/home/dekeeney/bin/nvim
