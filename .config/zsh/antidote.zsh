export NVM_LAZY_LOAD=true
ZSH_AUTOSUGGEST_STRATEGY=(completion history)
zstyle :omz:plugins:iterm2 shell-integration yes

# zsh-history-substring-search configuration
bindkey '^[[A' history-substring-search-up # or '\eOA'
bindkey '^[[B' history-substring-search-down # or '\eOB'
HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1

[[ -e ${ZDOTDIR:-~}/.antidote ]] ||
    git clone https://github.com/mattmc3/antidote.git ${ZDOTDIR:-~}/.antidote

source ${ZDOTDIR:-~}/.antidote/antidote.zsh

fpath=(/path/to/antidote/functions $fpath)
autoload -Uz antidote

function load_antidote_plugins {
    readonly name=${1:?"The plugin file name must be specified."}

    # Set the root name of the plugins files (.txt and .zsh) antidote will use.
    zsh_plugins=${HOME}/.config/zsh/plugins/${name}

    # Ensure the .zsh_plugins.txt file exists so you can add plugins.
    [[ -f ${zsh_plugins}.txt ]] || touch ${zsh_plugins}.txt

    # Generate a new static file whenever .zsh_plugins.txt is updated.
    if [[ ! ${zsh_plugins}.zsh -nt ${zsh_plugins}.txt ]]; then
      antidote bundle <${zsh_plugins}.txt >|${zsh_plugins}.zsh
    fi

    # Source your static plugins file.
    source ${zsh_plugins}.zsh 
}

load_antidote_plugins "base"
