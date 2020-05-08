#
# ~/.bashrc
#

# set -x
# If not running interactively, don't do anything
[[ $- != *i* ]] && return
xset b off


PS1='[\u@\h \W]\$ '
EDITOR='nvim'
alias ls='ls --color=auto'
alias firefox='firefox-developer-edition'
alias vi='nvim'
alias vim='nvim'
alias xterm='kitty'

# Custom aliases

# scrot default download location
alias dscrot='scrot ~/Pictures/scrot/%b%d%Y::%H%M%S.png'
alias escrot='scrot ~/Pictures/scrot/%b%d%Y::%H%M%S.png -s'

export PATH=~/.local/bin:$PATH:$HOME/.local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:$HOME/bin:~/.npm-global/bin
export ANDROID_SDK_ROOT=$HOME/Android/Sdk
export JUNIT_HOME=~/Documents/junit
#export CLASSPATH=$JUNIT_HOME/junit.jar:$JUNIT_HOME/hamcrest-core.jar


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
source /usr/share/nvm/init-nvm.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/seen/Downloads/google-cloud-sdk/path.bash.inc' ]; then . '/home/seen/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/seen/Downloads/google-cloud-sdk/completion.bash.inc' ]; then . '/home/seen/Downloads/google-cloud-sdk/completion.bash.inc'; fi
source /opt/ros/melodic/setup.bash
