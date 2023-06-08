HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e #emacs like keybindings

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#505050"
export ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd history completion)

# Load plugins
export ZSH_PLUGIN_PATH=/usr/share/zsh/plugins
if [[ -d "$ZSH_PLUGIN_PATH" || "$(ls -A $ZSH_PLUGIN_PATH)" ]] ; then
   source $ZSH_PLUGIN_PATH/*/*.plugin.zsh
fi


export PS1="%n%~%# "

function reload()
{
   source ~/.zshrc
}


if [ -r ~/.commonrc ] ; then
   source ~/.commonrc
fi

#syntax highlighting
if [ -r $ZSH_PLUGIN_PATH/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh ] ; then
   source $ZSH_PLUGIN_PATH/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
fi


if type "oh-my-posh" > /dev/null ; then
   eval "$(oh-my-posh init zsh)"
fi
