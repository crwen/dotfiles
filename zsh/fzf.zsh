# export FZF_DEFAULT_COMMAND='fd --hidden --follow -E ".git" -E "node_modules" . /etc /home'

source ~/.config/zsh/fzf/completion.zsh
# source ~/.config/zsh/completion.zsh
source ~/.config/zsh/fzf/key-bindings.zsh

# export FZF_DEFAULT_COMMAND='fd -E ".git" -E "node_modules" -E "~/.cache/" -E "~/.m2" '
# export FZF_DEFAULT_COMMAND='fd . ~/.config'
export FZF_DEFAULT_COMMAND='fd'
# export FZF_DEFAULT_OPTS='--height 90% --layout=reverse --bind=alt-j:down,alt-k:up,alt-i:toggle+down --border --preview "echo {} | ccat {}" --preview-window=down'
# export FZF_DEFAULT_OPTS='--height 90% --layout=reverse --border --preview "[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (ccat --color=always {} || highlight -O ansi -l {} || cat {}) " --preview-window=down'
local fzf_preview_cmd='[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (ccat --color=always {} || highlight -O ansi -l {} || cat {}) > /dev/null | head -500'
# export FZF_DEFAULT_OPTS='
#   --height 90% --layout=reverse --border 
#   --preview "[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (ccat --color=always {} || highlight -O ansi -l {} || cat {}) > /dev/null | head -500 "
#   '

PREVIEW="$HOME/.config/zsh/fzf/preview.zsh"

export FZF_DEFAULT_OPTS="--height 90% --layout=reverse --border --preview '${PREVIEW} {}' "


export FZF_TMUX_HEIGHT='80%'
# use fzf in bash and zsh
# Use ~~ as the trigger sequence instead of the default **
# export FZF_COMPLETION_TRIGGER='~~'
export FZF_COMPLETION_TRIGGER='\'

# fzf-tab
# preview  content  when completing cd
zstyle ':fzf-tab:complete:*:*' fzf-preview \
  "[[ -e \$realpath ]] && ${PREVIEW}"' $realpath || echo ${(P)${word}:-$desc}'

# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  # fd --hidden --follow -E ".git" -E ".cache" -E "node_modules" -E ".m2" -E ".local" -E ".gradle" -E "*.app" -E "Library" . "$1"
  fd --hidden --follow -E ".git" -E ".cache" -E "node_modules" -E ".m2" -E ".local" -E ".gradle" -E "*.app" -E "Library" . "$1"
  # fd --hidden --follow -E -E "Library" . "$1"
}
# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  # fd --type d --hidden --follow -E ".git" -E ".cache" -E "node_modules" -E ".m2" -E ".local" -E ".gradle" -E "*.app" -E "Library" . "$1"
  fd --type d --hidden --follow -E ".git" -E ".cache" -E "node_modules" -E ".m2" -E ".local" -E ".gradle" -E "*.app" -E "Library" . "$1"
}

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'tree -C {} | head -200'   "$@" ;;
    export|unset) fzf --preview "eval 'echo \$'{}"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview 'bat -n --color=always {}' "$@" ;;
  esac
}
