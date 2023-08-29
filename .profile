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
export BEMENU_SCALE="3"
export BEMENU_OPTS="--center --fn JetBrainsMonoNerdFont --list 10 -W 0.15 --fixed-height --border 2 --no-spacing --binding vim --cw 1 --bdr #ffd5a0 --tb #ffd5a0 --tf #111111 --nf #EEEEEE --nb #111111 --hf #ffd5a0 --hb #222222"



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
   if type dwl > /dev/null ; then
      echo "" > /tmp/dwl.log # clear log file
      echo "" > /tmp/dwl_action 
      dwl -s 'somebar' &>> /tmp/dwl.log
      action="$(cat /tmp/dwl_action)"
      echo "action: $action"
      echo ""
      if [ "$action" = "poweroff" ] ; then
        sudo poweroff
      elif [ "$action" = "reboot" ] ; then
        sudo reboot
      elif [ "$action" = "exit" ] ; then
        exit
      fi
   fi
fi
