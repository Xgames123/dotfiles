#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '


if [ -r .aliases ]; then
   source .aliases
fi

if [ -r $HOME/.cargo/env ] ; then
   source $HOME/.cargo/env
fi


if type "oh-my-posh" > /dev/null ; then
   eval "$(oh-my-posh init bash)"
fi
