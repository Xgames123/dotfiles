HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v # vim keybinds
bindkey "^H" vi-backward-char
bindkey "^L" vi-forward-char
bindkey "^K" up-line-or-history 
bindkey "^J" down-line-or-history 

# Plugins
export ZSH_PLUGIN_PATH=/usr/share/zsh/plugins

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#505050"
export ZSH_AUTOSUGGEST_STRATEGY=(completion match_prev_cmd history)

if [ -r $ZSH_PLUGIN_PATH/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh  ] ; then
   source $ZSH_PLUGIN_PATH/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
fi


export PS1="%n%~%# "

function reload()
{
   source ~/.zshrc
}

if [ -r ~/.profile ] ; then
   source ~/.profile
fi


# Syntax highlighting
typeset -A ZSH_HIGHLIGHT_STYLES

TOKENSTYLE="fg=yellow"
ZSH_HIGHLIGHT_STYLES[alias]="$TOKENSTYLE"
ZSH_HIGHLIGHT_STYLES[function]="$TOKENSTYLE"
ZSH_HIGHLIGHT_STYLES[command]="$TOKENSTYLE"
ZSH_HIGHLIGHT_STYLES[builtin]="$TOKENSTYLE"

ZSH_HIGHLIGHT_STYLES[unknown-token]="fg=red,underline"
ZSH_HIGHLIGHT_STYLES[path]="fg=white,underline"
ZSH_HIGHLIGHT_STYLES[reserved-word]="$TOKENSTYLE,bold"
ZSH_HIGHLIGHT_STYLES[precommand]="fg=blue"

TOKENSTYLE="fg=magenta"
ZSH_HIGHLIGHT_STYLES[commandseparator]="$TOKENSTYLE"
ZSH_HIGHLIGHT_STYLES[redirection]="$TOKENSTYLE"
ZSH_HIGHLIGHT_STYLES[globbing]="$TOKENSTYLE"
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]="$TOKENSTYLE"
ZSH_HIGHLIGHT_STYLES[singel-hyphen-option]="$TOKENSTYLE,bold"
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]="$TOKENSTYLE"




if [ -r $ZSH_PLUGIN_PATH/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh ] ; then
   source $ZSH_PLUGIN_PATH/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
fi


if type "oh-my-posh" > /dev/null ; then
   eval "$(oh-my-posh init zsh --config $POSH_THEME)"
fi
