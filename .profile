# a .rc for all shells that are bash like

export XDG_CURRENT_DESKTOP=wlroots
export GPG_TTY=$(tty)
export GCM_CREDENTIAL_STORE=gpg

if type nvim > /dev/null ; then
  export EDITOR=nvim
elif type vim > /dev/null ; then
  export EDITOR=vim
elif type vi > /dev/null ; then
  export EDITOR=vi
elif type nano > /dev/null ; then
  export EDITOR=nano
  if type rnano > /dev/null ; then
  export SUDO_EDITOR=rnano
  fi
fi

export POSH_THEMES_PATH=$HOME/.poshthemes
export POSH_THEME=$POSH_THEMES_PATH/ldev2.json

if [ -r $HOME/.cargo/env ] ; then
   source $HOME/.cargo/env
fi


if [ -r $HOME/.aliases ] ; then
   source $HOME/.aliases
fi

if [ -r $HOME/.profile.local ] ; then
   source $HOME/.profile.local
fi


# Start window manager when on tty 1
if [ "$(tty)" = "/dev/tty1" ] ; then
   if type dwl > /dev/null ; then
      echo "" > /tmp/dwl.log # clear log file
      dwl -s 'somebar' &>> /tmp/dwl.log
   fi
fi
