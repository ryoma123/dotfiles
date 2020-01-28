set -x PATH ~/.rbenv/bin $PATH
set -x PATH ~/Library/Python/3.7/bin $PATH
rbenv init - | source
set -x GOPATH $HOME/go
set -x fish_user_paths $fish_user_paths $GOPATH/bin
set -x fish_user_paths $fish_user_paths $HOME/.cargo/bin
set -x PATH $HOME/.nodebrew/current/bin $PATH
