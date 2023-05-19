HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e #emacs like keybindings

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#505050"
export ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd history completion)

# Load plugins
export ZSH_PLUGIN_PATH=/usr/share/zsh/plugins
source $ZSH_PLUGIN_PATH/*/*.plugin.zsh

export GPG_TTY=$(tty)
export GCM_CREDENTIAL_STORE=gpg

export EDITOR=nano
export SUDO_EDITOR=rnano

export PS1="%n%~%# "

function reload()
{
   source ~/.zshrc
}


if [ -r .aliases ] ; then
   source .aliases
fi

#syntax highlighting
if [ -r $ZSH_PLUGIN_PATH/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh ] ; then
   source $ZSH_PLUGIN_PATH/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
fi


if type "oh-my-posh" > /dev/null ; then
   eval "$(oh-my-posh init zsh)"
fi
