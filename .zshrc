# Load seperated config files
os_type=$(uname)

# Convert to lowercase
os_type=$(echo $os_type | tr '[:upper:]' '[:lower:]')

if [[ $os_type == "darwin" || $os_type == "linux" ]]; then
    for conf in "$HOME/.config/zsh/conf.d/$os_type/"*.zsh; do
        source "${conf}"
    done
    unset conf
else
    echo "Unknown OS"
fi


# Starship init
eval "$(starship init zsh)"
