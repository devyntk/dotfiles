
[[ -e ~/.rbenv ]] ||
    git clone https://github.com/rbenv/rbenv.git ~/.rbenv

eval "$(~/.rbenv/bin/rbenv init - --no-rehash zsh)"
