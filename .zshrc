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

[ -f $HOME/pbin/aliases ] && source $HOME/pbin/aliases
[ -f $HOME/pbin/exports ] && source $HOME/pbin/exports
[ -f $HOME/pbin/links ] && source $HOME/pbin/links

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/addy/google-cloud-sdk/path.zsh.inc' ]; then . '/home/addy/google-cloud-sdk/path.zsh.inc'; fi
# The next line enables shell command completion for gcloud.
if [ -f '/home/addy/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/addy/google-cloud-sdk/completion.zsh.inc'; fi

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/addy/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/addy/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/addy/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/addy/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

setxkbmap -option caps:swapescape
