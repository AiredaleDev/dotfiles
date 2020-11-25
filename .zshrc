# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
# vi mode (emacs be like)
bindkey -v

# Load basic colors
autoload -U colors && colors
# Load git support
autoload -Uz vcs_info
precmd() { vcs_info }
# Change git formatting
zstyle ':vcs_info:git:*' formats 'on branch %b '

setopt PROMPT_SUBST
PROMPT='%{$fg_bold[cyan]%}[%n@%m] %{$reset_color%}%{$fg[blue]%}${PWD/#$HOME/~} %{$fg[yellow]%}${vcs_info_msg_0_}%{$fg_bold[green]%}> %{$reset_color%}'

# Tells compinstall where to write changes (not going to use this very much)
zstyle :compinstall filename '/home/cameron/.zshrc'

autoload -Uz compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zmodload zsh/complist
compinit

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Source aliases
[ -f ~/.config/aliasrc ] && source ~/.config/aliasrc 

# Load autosuggestions and syntax highlighting (this should always be last)
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
 
