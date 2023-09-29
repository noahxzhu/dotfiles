# Load seperated config files
for conf in "$HOME/.config/zsh/conf.d/"*.zsh; do
  source "${conf}"
done
unset conf

# Starship init
eval "$(starship init zsh)"
