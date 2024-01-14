# Protocol Buffers
export PATH=$HOME/Tools/protoc-25.2/bin:$PATH

# Pet 
export PATH=$HOME/Tools/pet:$PATH

# z.sh
. "/opt/homebrew/etc/profile.d/z.sh"


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$HOME/Tools/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/Tools/miniconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/Tools/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/Tools/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
