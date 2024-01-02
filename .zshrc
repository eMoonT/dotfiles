# 启动 starship
eval "$(starship init zsh)"

# 启动 mcfly
eval "$(mcfly init zsh)"

# 启动 zoxide
eval "$(zoxide init zsh --cmd cd)"

# 启动zinit
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# 快速目录跳转
zinit ice lucid wait='1'
zinit light skywind3000/z.lua

# 自动建议
zinit ice lucid wait atload='_zsh_autosuggest_start'
zinit light zsh-users/zsh-autosuggestions

# 语法高亮
zinit ice lucid wait atinit='zpcompinit'
zinit light zdharma/fast-syntax-highlighting

# sudo
zinit ice lucid wait='1'
zinit snippet OMZ::plugins/sudo/sudo.plugin.zsh

# 补全
zinit ice lucid wait blockf atpull'zinit creinstall -q .'
zinit light zsh-users/zsh-completions

#目录补全
zinit ice lucid wait='1'
zinit snippet OMZ::plugins/zsh-interactive-cd/zsh-interactive-cd.plugin.zsh

## Load OMZ
# zinit snippet OMZ::lib/theme-and-appearance.zsh
zinit snippet OMZ::lib/completion.zsh
zinit snippet OMZ::lib/history.zsh
zinit snippet OMZ::lib/key-bindings.zsh
zinit snippet OMZ::lib/theme-and-appearance.zsh



# vi-mode
zinit snippet OMZ::plugins/vi-mode/vi-mode.plugin.zsh

## 解压缩
# zinit ice svn lucid wait='1'
# zinit snippet OMZ::plugins/extract
# zinit snippet OMZ::plugins/extract/extract.plugin.zsh

## git
zinit ice lucid wait='1'
zinit snippet OMZ::plugins/git/git.plugin.zsh


# Vi-Mode
function zle-keymap-select {
        if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
                echo -ne '\e[1 q'
        elif [[ ${KEYMAP} == main ]] || [[ ${KEYMAP} == viins ]] || [[ ${KEYMAP} = '' ]] || [[ $1 = 'beam' ]]; then
                echo -ne '\e[5 q'
  fi
}

### commond hot
zsh_stats () {
  fc -l 1 | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl | head -n20
}

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

## fzf tab
# zinit ice lucid wait='zpcompinit'
# zinit light Aloxaf/fzf-tab

# 设置代理
getip(){
     export PROXY_HTTP="127.0.0.1:7890"
     export PROXY_SOCKS5="127.0.0.1:1089"
}

ip_() {
    curl cip.cc
}

proxy() {
    getip
    export http_proxy="${PROXY_HTTP}"
    export HTTP_PROXY="${PROXY_HTTP}"
    export https_proxy="${PROXY_HTTP}"
    export HTTPS_PROXY="${PROXY_HTTP}"
    export ALL_PROXY="${PROXY_SOCKS5}"
    export all_proxy="${PROXY_SOCKS5}"
    #git config --global http.https://github.com.proxy socks5://${PROXY_SOCKS5}
    ip_
}

unpro() {
    unset http_proxy
    unset https_proxy
    unset HTTP_PROXY
    unset HTTPS_PROXY
    unset ALL_PROXY
    unset all_proxy
    git config --global --unset http.https://github.com.proxy
    ip_
}

fgo() {
    var=`fzf`
    cd `echo $var | awk -F'/' '{gsub($NF,"");print $0}' | sed 's/\./\/home\/emoon/g'`
}

vnc() {
    nohup x0vncserver -rfbauth /home/emoon/.vnc/passwd > /tmp/nohup 2>&1 &
}
# history
export SAVEHIST=$HISTSIZE
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.

export EDITOR='vim'

# alias config
alias ra='ranger'
alias ne='neofetch | lolcat'
alias x='extract'
alias du='dust'

alias egrep='egrep --color=auto'
alias pn='pnpm'
alias fvi='vi $(fzf)'

alias vz='nvim ~/.zshrc'
alias sz='source ~/.zshrc'

alias fmax='find ./ -type f -print0  | xargs -0  du -h | sort -nr | head -n10'
alias cat='bat'
alias grep='grep --color=auto'
alias ls='lsd'
alias ll='exa -l --color always --icons -a -s type'
alias conda_run='source /opt/anaconda/bin/activate'

alias setsck5='export ALL_PROXY=socks5://1.12.59.40:10230'
alias unsetsck5='unset ALL_PROXY'

alias ora_vnc="ssh -o ProxyCommand='ssh -W %h:%p -p 443 ocid1.instanceconsoleconnection.oc1.uk-london-1.anwgiljt275eacachwppcjfd4yzcifgrc63cqh4ze7rs47sx5hoyyhp4uima@instance-console.uk-london-1.oci.oraclecloud.com' -N -L localhost:5900:ocid1.instance.oc1.uk-london-1.anwgiljt275eacaccdjlzhmppomt4wuir7hnyh7n4rqqr3fdazrfwcuu5n7q:5900 ocid1.instance.oc1.uk-london-1.anwgiljt275eacaccdjlzhmppomt4wuir7hnyh7n4rqqr3fdazrfwcuu5n7q"

eval $(thefuck --alias)

precmd () { echo -n "\x1b]1337;CurrentDir=$(pwd)\x07" }

source /home/emoon/.config/broot/launcher/bash/br

# pnpm
export PNPM_HOME="/home/emoon/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end___MY_VMOPTIONS_SHELL_FILE="${HOME}/.jetbrains.vmoptions.sh"; if [ -f "${___MY_VMOPTIONS_SHELL_FILE}" ]; then . "${___MY_VMOPTIONS_SHELL_FILE}"; fi
#
# fnm
export PATH="/run/user/1000/fnm_multishells/326319_1703478494426/bin":$PATH
export FNM_DIR="/home/emoon/.local/share/fnm"
export FNM_MULTISHELL_PATH="/run/user/1000/fnm_multishells/326319_1703478494426"
export FNM_NODE_DIST_MIRROR="https://nodejs.org/dist"
export FNM_ARCH="x64"
export FNM_VERSION_FILE_STRATEGY="local"
export FNM_LOGLEVEL="info"
export FNM_RESOLVE_ENGINES="false"
export FNM_COREPACK_ENABLED="false"
