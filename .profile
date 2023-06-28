# a .rc for all shells that are bash like

export GPG_TTY=$(tty)
export GCM_CREDENTIAL_STORE=gpg

export EDITOR=nano
export SUDO_EDITOR=rnano

export POSH_THEMES_PATH=$HOME/.poshthemes

if [ -r $HOME/.cargo/env ] ; then
   source $HOME/.cargo/env
fi


if [ -r $HOME/.aliases ] ; then
   source $HOME/.aliases
fi

if [ -r $HOME/.profile.local ] ; then
   source $HOME/.profile.local
fi
