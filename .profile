# a .rc for all shells that are bash like

export BASE00="#32302F"
export BASE01="#3C3836"
export BASE02="#5A524C"
export BASE03="#7C6F64"
export BASE04="#BDAE93"
export BASE05="#DDC7A1"
export BASE06="#EBDBB2"
export BASE07="#FBF1C7"
export BASE08="#EA6962"
export BASE09="#E78A4E"
export BASE0A="#D8A657"
export BASE0B="#A9B665"
export BASE0C="#89B482"
export BASE0D="#7DAEA3"
export BASE0E="#D3869B"
export BASE0F="#BD6F3E"

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
export BEMENU_OPTS="--center --fn JetBrainsMonoNerdFont --list 20 -W 0.4 --fixed-height --border 2 --no-spacing --cw 1 --bdr $BASE05 --tb $BASE05 --tf $BASE01 --nf $BASE07 --af $BASE07 --nb $BASE01 --ab $BASE00 --hf $BASE01 --hb $BASE05 --fb $BASE00 --ff $BASE07"

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
