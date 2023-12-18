# a .rc for all shells that are bash like

# darksands
export COLOR_ACCENT="#ffd5a0"
export COLOR_TEXT="#C2BAB2"

export COLOR_OK="#89b482"
export COLOR_PINK="#d3869b"

export COLOR_ERROR="#ea6962"
export COLOR_WARN="#e78a4e"
export COLOR_INFO="#7daea3"

export COLOR_LAYER0="#191817"
export COLOR_LAYER1="#232020"
export COLOR_LAYER2="#2b2828"
export COLOR_LAYER3="#353232"
export COLOR_LAYER4="#3f3c3c"


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
export BEMENU_OPTS="--center --fn JetBrainsMonoNF --list 20 -W 0.4 --fixed-height --border 2 --no-spacing --cw 1 --bdr $COLOR_ACCENT --tb $COLOR_ACCENT --tf $COLOR_LAYER1 --nf $COLOR_TEXT --af $COLOR_TEXT --nb $COLOR_LAYER0 --ab $COLOR_LAYER1 --hf $COLOR_LAYER1 --hb $COLOR_ACCENT --fb $COLOR_LAYER1 --ff $COLOR_TEXT"

# firefox
export MOZ_ENABLE_WAYLAND=1

# qt
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
export QT_QPA_PLATFORM=xcb

export NOTES_DIR="$HOME/source/repos/notes"
export AUR_DIR="$HOME/source/aur"
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

PATH="$PATH:$HOME/.cargo/bin"

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
