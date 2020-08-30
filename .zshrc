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
	poetry
)

source $ZSH/oh-my-zsh.sh

[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true

export RUST_BACKTRACE=full

eval "$(direnv hook zsh)"

[ -f $HOME/pbin/aliases ] && source $HOME/pbin/aliases
[ -f $HOME/pbin/exports ] && source $HOME/pbin/exports
[ -f $HOME/pbin/links ] && source $HOME/pbin/links
[ -f $HOME/pbin/funcs ] && source $HOME/pbin/funcs

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export PATH=$PATH:/usr/local/go/bin
