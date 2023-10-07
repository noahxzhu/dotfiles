# Vi Mode 
bindkey -v

# Default Editor
export VISUAL=nvim 
export EDITOR=$VISUAL

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

bindkey '^I'   complete-word       # tab          | complete
bindkey '^[[Z' autosuggest-accept  # shift + tab  | autosuggest

zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|=*' 'l:|=* r:|=*'

