
autoload -U +X compinit && compinit

if grep -E '^VERSION_ID="9' /etc/os-release &> /dev/null
then
  # config that needs to be set prior to plugin loading
  export NVM_LAZY_LOAD=true
  ZSH_AUTOSUGGEST_STRATEGY=(completion history)
  zstyle :omz:plugins:iterm2 shell-integration yes

  [[ -e ${ZDOTDIR:-~}/.antidote ]] ||
    git clone https://github.com/mattmc3/antidote.git ${ZDOTDIR:-~}/.antidote

  source ${ZDOTDIR:-~}/.antidote/antidote.zsh
  # Set the root name of the plugins files (.txt and .zsh) antidote will use.
    zsh_plugins=${ZDOTDIR:-~}/.zsh_plugins

    # Ensure the .zsh_plugins.txt file exists so you can add plugins.
    [[ -f ${zsh_plugins}.txt ]] || touch ${zsh_plugins}.txt

    # Lazy-load antidote from its functions directory.
    fpath=(/path/to/antidote/functions $fpath)
    autoload -Uz antidote

    # Generate a new static file whenever .zsh_plugins.txt is updated.
    if [[ ! ${zsh_plugins}.zsh -nt ${zsh_plugins}.txt ]]; then
      antidote bundle <${zsh_plugins}.txt >|${zsh_plugins}.zsh
    fi

    # Source your static plugins file.
    source ${zsh_plugins}.zsh 


  path+=('/home/dekeeney/bin')
  alias nvim="/home/dekeeney/bin/nvim"
  export EDITOR=/home/dekeeney/bin/nvim
fi

eval "$(starship init zsh)"

export TZ=America/Chicago

function zr () { zellij run --name "$*" -- zsh -ic "$*";}
function zrf () { zellij run --name "$*" --floating -- zsh -ic "$*";}
function ze () { zellij edit "$*";}
function zef () { zellij edit --floating "$*";}

for file in ~/.config/zsh_funcs/*; do
  source "$file"
done
