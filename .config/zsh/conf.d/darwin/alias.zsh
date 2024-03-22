# Alias
alias lg="lazygit"

alias ta="tmux a"
alias tat="tmux a -t"
alias tk="tmux kill-server"
alias tl="tmux ls"
alias tn="tmux new -s $(basename $PWD)"
alias tnn="tmux new -s"

alias t='sesh connect $(sesh list | fzf)'
