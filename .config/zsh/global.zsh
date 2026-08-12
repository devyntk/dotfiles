autoload -U is-at-least

if command -v oh-my-posh >/dev/null 2>&1; then
  _my_omp_init() {
    if [ -f "$1" ] ; then
      eval "$(oh-my-posh init zsh --config "$1")"
    elif command -v starship >/dev/null 2>&1; then
      eval "$(starship init zsh)"
    else
      eval "$(oh-my-posh init zsh)"
    fi
  }
  # omp seems to be incompatible with ZSH 5.0
  if is-at-least 5.1.0; then
    _my_omp_init ~/.config/oh-my-posh/theme.omp.toml
  else
      eval "$(starship init zsh)"
  fi
  unset -f _my_omp_init
elif command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi

autoload -U +X compinit && compinit

export TZ=America/Chicago
