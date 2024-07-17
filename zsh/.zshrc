THEME=$HOME/.oh-my-posh-theme.json
eval "$(oh-my-posh init zsh --config $THEME)"

if [[ -f "/opt/homebrew/bin/brew" ]] then
  # If you're using macOS, you'll want this enabled
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
zinit light mfaerevaag/wd

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
# zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases
alias ls='exa -la --color always'
alias vim='nvim'
alias vimrc="cd ~/.config/nvim && vim"
alias vi="nvim"
alias c='clear'
# alias cp="$HOME/.cargo/bin/coreutils cp"
alias date="$HOME/.cargo/bin/coreutils date"
alias echo="$HOME/.cargo/bin/coreutils echo"
alias env="$HOME/.cargo/bin/coreutils env"
alias head="$HOME/.cargo/bin/coreutils head"
alias ln="$HOME/.cargo/bin/coreutils ln"
alias mv="$HOME/.cargo/bin/coreutils mv"
alias printf="$HOME/.cargo/bin/coreutils printf"
alias pwd="$HOME/.cargo/bin/coreutils pwd"
alias rm="$HOME/.cargo/bin/coreutils rm"
alias sleep="$HOME/.cargo/bin/coreutils sleep"
alias tail="$HOME/.cargo/bin/coreutils tail"
alias tee="$HOME/.cargo/bin/coreutils tee"
alias touch="$HOME/.cargo/bin/coreutils touch"
alias wc="$HOME/.cargo/bin/coreutils wc"
alias cargo-watch="cargo watch -x check -x test -x run"
alias note="gt modify --edit -q"

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd --hook pwd zsh)"

# . "$HOME/.cargo/env"


export EDITOR=nvim

export MISE_SHELL=zsh
export __MISE_ORIG_PATH="$PATH"

mise() {
  local command
  command="${1:-}"
  if [ "$#" = 0 ]; then
    command $HOME.cargo/bin/mise
    return
  fi
  shift

  case "$command" in
  deactivate|s|shell)
    # if argv doesn't contains -h,--help
    if [[ ! " $@ " =~ " --help " ]] && [[ ! " $@ " =~ " -h " ]]; then
      eval "$(command $HOME/.cargo/bin/mise "$command" "$@")"
      return $?
    fi
    ;;
  esac
  command $HOME/.cargo/bin/mise "$command" "$@"
}

_mise_hook() {
  eval "$($HOME/.cargo/bin/mise hook-env -s zsh)";
}
typeset -ag precmd_functions;
if [[ -z "${precmd_functions[(r)_mise_hook]+1}" ]]; then
  precmd_functions=( _mise_hook ${precmd_functions[@]} )
fi
typeset -ag chpwd_functions;
if [[ -z "${chpwd_functions[(r)_mise_hook]+1}" ]]; then
  chpwd_functions=( _mise_hook ${chpwd_functions[@]} )
fi

if [ -z "${_mise_cmd_not_found:-}" ]; then
    _mise_cmd_not_found=1
    [ -n "$(declare -f command_not_found_handler)" ] && eval "${$(declare -f command_not_found_handler)/command_not_found_handler/_command_not_found_handler}"

    function command_not_found_handler() {
        if $HOME/.cargo/bin/mise hook-not-found -s zsh -- "$1"; then
          _mise_hook
          "$@"
        elif [ -n "$(declare -f _command_not_found_handler)" ]; then
            _command_not_found_handler "$@"
        else
            echo "zsh: command not found: $1" >&2
            return 127
        fi
    }
fi

source $HOME/.zsh_kraft_completion;
source $HOME/.zshrc-private
