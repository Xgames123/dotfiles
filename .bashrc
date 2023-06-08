#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '


if [ -r $HOME/.commonrc ]; then
   source $HOME/.commonrc
fi


if type "oh-my-posh" > /dev/null ; then
   eval "$(oh-my-posh init bash)"
fi
