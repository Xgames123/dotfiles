# a .rc for all shells that are bash related

export GPG_TTY=$(tty)
export GCM_CREDENTIAL_STORE=gpg

export EDITOR=nano
export SUDO_EDITOR=rnano

if [ -r $HOME/.cargo/env ] ; then
   source $HOME/.cargo/env
fi


if [ -r $HOME/.aliases ] ; then
   source $HOME/.aliases
fi
