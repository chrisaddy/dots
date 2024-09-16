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
alias add="sudo pacman -Syyu"
alias ls='exa -la --color always'
alias c='clear'
alias cargo-watch="cargo watch -x check -x test -x run"
# alias cp="$HOME/.cargo/bin/coreutils cp"
# alias date="$HOME/.cargo/bin/coreutils date"
# alias echo="$HOME/.cargo/bin/coreutils echo"
# alias env="$HOME/.cargo/bin/coreutils env"
# alias head="$HOME/.cargo/bin/coreutils head"
# alias ln="$HOME/.cargo/bin/coreutils ln"
# alias mv="$HOME/.cargo/bin/coreutils mv"
# alias printf="$HOME/.cargo/bin/coreutils printf"
# alias pwd="$HOME/.cargo/bin/coreutils pwd"
# alias rm="$HOME/.cargo/bin/coreutils rm"
# alias sleep="$HOME/.cargo/bin/coreutils sleep"
# alias tail="$HOME/.cargo/bin/coreutils tail"
# alias tee="$HOME/.cargo/bin/coreutils tee"
# alias touch="$HOME/.cargo/bin/coreutils touch"
# alias wc="$HOME/.cargo/bin/coreutils wc"
alias cargo-watch="cargo watch -x check -x test -x run"
alias note="gt modify --edit -q"
alias vim="nvim"

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd --hook pwd zsh)"

# . "$HOME/.cargo/env"


export PATH=$PATH:$HOME/bin/


export EDITOR=nvim

source $HOME/.zsh_kraft_completion;
source $HOME/.zshrc-private

zstyle ':completion:*' menu select
fpath+=~/.zfunc

. "$HOME/.cargo/env"

alias code="open -g -a Cursor"
eval "$(/home/chrisaddy/.local/bin/mise activate zsh)"


ad() {
  dir=$(wd list | awk '{print $1}' | fzf)
  wd $dir
  lf
}

. "/home/chrisaddy/.local/share/mise/installs/rust/1.80.1/env"

fpath+=~/.zfunc; autoload -Uz compinit; compinit

. ~/.nix-profile/etc/profile.d/nix.sh
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

export FLYCTL_INSTALL="/home/chrisaddy/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"
export PATH=$PATH:/home/chrisaddy/.surrealdb
