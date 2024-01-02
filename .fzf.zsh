# Setup fzf
# ---------
if [[ ! "$PATH" == */home/emoon/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/emoon/.fzf/bin"
fi

# Auto-completion
# --------------
[[ $- == *i* ]] && source "/home/emoon/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/emoon/.fzf/shell/key-bindings.zsh"

# Env
export FZF_DEFAULT_COMMAND='fd'
export FZF_DEFAULT_OPTS='--height 90% --layout=reverse --bind=alt-j:down,alt-k:up,alt-i:toggle+down --border --preview "echo {} | ~/.fzf/plugin/preview.py" --preview-window=right'

# use fzf in bash and zsh
# Use ~~ as the trigger sequence instead of the default **
export FZF_COMPLETION_TRIGGER='\'

_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

# Custom fuzzy completion for "doge" command
#   e.g. doge **<TAB>
_fzf_complete_doge() {
  _fzf_complete --multi --reverse --prompt="doge> " -- "$@" < <(
    echo very
    echo wow
    echo such
    echo doge
  )
}
