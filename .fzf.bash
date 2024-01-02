# Setup fzf
# ---------
if [[ ! "$PATH" == */home/emoon/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/emoon/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/emoon/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/emoon/.fzf/shell/key-bindings.bash"
