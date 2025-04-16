# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git 
        zsh-autosuggestions 
        zsh-syntax-highlighting 
        fast-syntax-highlighting 
        zsh-autocomplete
)
source $ZSH/oh-my-zsh.sh

# User configuration
neofetch
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias cat=bat
alias vim=nvim
alias ls=lsd
alias help=tldr

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
typeset -g POWERLEVEL9K_INSTANT_PROMPT=off

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/heigetvu/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/heigetvu/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/heigetvu/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/heigetvu/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export GOPATH=$HOME/go




# Config fzf
# Use ~~ as the trigger sequence instead of the default **
export FZF_COMPLETION_TRIGGER='``'

# Options to fzf command
export FZF_COMPLETION_OPTS='--border --info=inline'

# Options for path completion (e.g. vim **<TAB>)
export FZF_COMPLETION_PATH_OPTS='--walker file,dir,follow,hidden'

# Options for directory completion (e.g. cd **<TAB>)
export FZF_COMPLETION_DIR_OPTS='--walker dir,follow'

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments ($@) to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --style full \
                      --height=50% \
                      --margin=5%,2%,2%,5% \
                      --info=inline \
                      --border=double \
                      --pointer='→' \
                      --marker='♡' \
                      --border-label ' DIRECTORY ' \
                      --input-label ' Input ' \
                      --bind 'result:transform-list-label:
                          if [[ -z $FZF_QUERY ]]; then
                            echo \" $FZF_MATCH_COUNT items \"
                          else
                            echo \" $FZF_MATCH_COUNT matches for [$FZF_QUERY] \"
                          fi
                          ' \
                      --bind 'focus:transform-preview-label:[[ -n {} ]] && printf \" Previewing [%s] \" {}' \
                      --bind 'focus:+transform-header:file --brief {} || echo \"No file selected\"' \
                      --bind 'ctrl-r:change-list-label( Reloading the list )+reload(sleep 2; git ls-files)' \
                      --color 'border:#aaaaaa,label:#cccccc' \
                      --color 'preview-border:#9999cc,preview-label:#ccccff' \
                      --color 'list-border:#669966,list-label:#99cc99' \
                      --color 'input-border:#996666,input-label:#ffcccc' \
                      --preview 'tree -C {} | head -200'   "$@" ;;
    export|unset) fzf --preview "eval 'echo \$'{}"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --style full \
                      --height=50% \
                      --margin=5%,2%,2%,5% \
                      --info=inline \
                      --border=double \
                      --pointer='→' \
                      --marker='♡' \
                      --border-label ' FILE ' \
                      --input-label ' Input ' \
                      --header-label ' File Type ' \
                      --bind 'result:transform-list-label:
                          if [[ -z $FZF_QUERY ]]; then
                            echo \" $FZF_MATCH_COUNT items \"
                          else
                            echo \" $FZF_MATCH_COUNT matches for [$FZF_QUERY] \"
                          fi
                          ' \
                      --bind 'focus:transform-preview-label:[[ -n {} ]] && printf \" Previewing [%s] \" {}' \
                      --bind 'focus:+transform-header:file --brief {} || echo \"No file selected\"' \
                      --bind 'ctrl-r:change-list-label( Reloading the list )+reload(sleep 2; git ls-files)' \
                      --color 'border:#aaaaaa,label:#cccccc' \
                      --color 'preview-border:#9999cc,preview-label:#ccccff' \
                      --color 'list-border:#669966,list-label:#99cc99' \
                      --color 'input-border:#996666,input-label:#ffcccc' \
                      --color 'header-border:#6699cc,header-label:#99ccff' \
                      --preview 'bat -n --color=always {}' "$@" ;;
  esac
}

# Config ctrl R in fzf
export FZF_CTRL_R_OPTS="
  --style full
  --border=double
  --color 'border:#aaaaaa,label:#cccccc'
  --color 'list-border:#669966,list-label:#99cc99'
  --height=50%
  --margin=5%,2%,2%,5%
  --border-label ' COMMAND '
  --input-label ' Input '
  --color 'input-border:#996666,input-label:#ffcccc'
  --layout=reverse
  --info=inline
  --pointer='→'
  --marker='♡'
  --color header:italic"

# Config ctrl T in fzf
export FZF_CTRL_T_OPTS="
  --style full
  --height=50%
  --margin=5%,2%,2%,5%
  --info=inline
  --border=double
  --pointer='→'
  --marker='♡'
  --border-label ' FILE ' 
  --input-label ' Input ' 
  --header-label ' File Type '
  --walker-skip .git,node_modules,target
  --preview 'bat -n --color=always {}'
  --bind 'result:transform-list-label:
      if [[ -z $FZF_QUERY ]]; then
        echo \" $FZF_MATCH_COUNT items \"
      else
        echo \" $FZF_MATCH_COUNT matches for [$FZF_QUERY] \"
      fi
      '
  --bind 'focus:transform-preview-label:[[ -n {} ]] && printf \" Previewing [%s] \" {}'
  --bind 'focus:+transform-header:file --brief {} || echo \"No file selected\"' \
  --bind 'ctrl-r:change-list-label( Reloading the list )+reload(sleep 2; git ls-files)'
  --color 'border:#aaaaaa,label:#cccccc'
  --color 'preview-border:#9999cc,preview-label:#ccccff'
  --color 'list-border:#669966,list-label:#99cc99'
  --color 'input-border:#996666,input-label:#ffcccc'
  --color 'header-border:#6699cc,header-label:#99ccff'"

# Config alt c in fzf
export FZF_ALT_C_OPTS="
  --style full
  --height=50%
  --margin=5%,2%,2%,5%
  --info=inline
  --border=double
  --pointer='→'
  --marker='♡'
  --walker-skip .git,node_modules,target
  --preview 'tree -C {}'
  --border-label ' DIRECTORY ' 
  --input-label ' Input ' 
  --walker-skip .git,node_modules,target
  --bind 'result:transform-list-label:
      if [[ -z $FZF_QUERY ]]; then
        echo \" $FZF_MATCH_COUNT items \"
      else
        echo \" $FZF_MATCH_COUNT matches for [$FZF_QUERY] \"
      fi
      '
  --bind 'focus:transform-preview-label:[[ -n {} ]] && printf \" Previewing [%s] \" {}'
  --bind 'focus:+transform-header:file --brief {} || echo \"No file selected\"' \
  --bind 'ctrl-r:change-list-label( Reloading the list )+reload(sleep 2; git ls-files)'
  --color 'border:#aaaaaa,label:#cccccc'
  --color 'preview-border:#9999cc,preview-label:#ccccff'
  --color 'list-border:#669966,list-label:#99cc99'
  --color 'input-border:#996666,input-label:#ffcccc'"
