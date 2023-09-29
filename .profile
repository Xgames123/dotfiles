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

# bemenu
export BEMENU_SCALE="2"
export BEMENU_OPTS="--center --fn JetBrainsMonoNerdFont --list 20 -W 0.4 --fixed-height --border 2 --no-spacing --cw 1 --bdr #ffd5a0 --tb #ffd5a0 --tf #222222 --nf #EEEEEE --nb #222222 --ab #111111 --hf #222222 --hb #ffd5a0"

# firefox
export MOZ_ENABLE_WAYLAND=1

# qt
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
export QT_QPA_PLATFORM=xcb

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

editenv ()
{
  BUFFER_FILE=/tmp/editenv_buffer 
  echo $(eval "echo \$$1 > \$BUFFER_FILE")
  $EDITOR $BUFFER_FILE
  export $1="$(cat $BUFFER_FILE)"
}

# Start window manager when on tty 1
if [ "$(tty)" = "/dev/tty1" ] ; then
  source .wmrc
fi
