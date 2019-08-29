#
# ~/.bashrc
#

# set -x
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '
EDITOR='nvim'
alias ls='ls --color=auto'
alias firefox='firefox-developer-edition'
alias vi='nvim'
alias vim='nvim'

# Custom aliases

# scrot default download location
alias dscrot='scrot ~/Pictures/scrot/%b%d%Y::%H%M%S.png'
alias dscrot2='scrot ~/Pictures/scrot/%b%d%Y::%H%M%S.png -s'

export PATH=~/.local/bin:$PATH:$HOME/.local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin
alias python3="python3.6"


# save path on cd
function cd {
    builtin cd $@
    pwd > ~/.last_dir
}

# restore last saved path
if [ -f ~/.last_dir ]
    then cd `cat ~/.last_dir`
fi

#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && /. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && /. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
#set +x
