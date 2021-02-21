# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
export UPDATE_ZSH_DAYS=1
DISABLE_UPDATE_PROMPT="true"
# ENABLE_CORRECTION="true" # command autocorrection
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy-mm-dd"

export LANG=en_US.UTF-8
CASE_SENSITIVE="false"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(
	git
	colored-man-pages
	zsh-autosuggestions
	zsh-syntax-highlighting
	wd
)

source $ZSH/oh-my-zsh.sh

[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true

export RUST_BACKTRACE=full

eval "$(direnv hook zsh)"

[ -f $HOME/pbin/aliases ] && source $HOME/dots/aliases
[ -f $HOME/pbin/exports ] && source $HOME/dots/exports
[ -f $HOME/pbin/links ] && source $HOME/dots/links
[ -f $HOME/pbin/funcs ] && source $HOME/dots/funcs

export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:$HOME/dots/bin
export PATH=$PATH:$HOME/dev/data-utils/bin

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH=$PATH:$HOME/.pyenv/versions/3.9.2/bin
export PATH=$PATH:$HOME/.pyenv/versions/3.8.5/bin
export PATH=$PATH:$HOME/.poetry/bin

alias ls="ls -la"
