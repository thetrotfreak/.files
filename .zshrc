# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussel" # set by `omz`

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 1

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

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
# plugins=(git ssh-agent tmux)
plugins=(git ssh-agent gpg-agent)
zstyle :omz:plugins:ssh-agent quiet yes
zstyle :omz:plugins:ssh-agent identities id_rsa
zstyle :omz:plugins:ssh-agent lifetime
# export ZSH_TMUX_AUTOSTART=false
# export ZSH_TMUX_AUTOCONNECT=false
# export ZSH_TMUX_CONFIG=$HOME/.tmux.conf
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
else
   export EDITOR='vim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias vim="vim"
alias zshconfig="$EDITOR ~/.zshrc"
alias ohmyzsh="$EDITOR ~/.oh-my-zsh"
export PATH=$HOME/.local/bin:$PATH
export PATH="/mnt/c/Program Files (x86)/Microsoft/Edge/Application":$PATH
export BROWSER=msedge.exe

# Use ~~ as the trigger sequence instead of the default **
# export FZF_COMPLETION_TRIGGER='~~'

# Options to fzf command
# export FZF_COMPLETION_OPTS='--border --info=inline-right'

# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'tree -C {} | head -200'      "$@" ;;
    export|unset) fzf --preview "eval 'echo \$'{}"            "$@" ;;
    ssh)          fzf --preview 'dig {}'                      "$@" ;;
    *)            fd -t f | fzf --preview 'batcat -n --color=always {}' "$@" ;;
  esac
}

# Print tree structure in the preview window
export FZF_ALT_C_OPTS="
  --preview 'tree -C {}' --preview-window hidden:wrap
  --bind 'ctrl-/:toggle-preview'
  --bind 'ctrl-e:become(vim --ttyfail -- {+} < /dev/tty > /dev/tty)'"

# export FZF_CTRL_R_OPTS="
#   --preview 'echo {}' --preview-window up:3:hidden:wrap
#   --bind 'ctrl-/:toggle-preview'
#   --bind 'ctrl-y:execute-silent(echo -n {2..} | clip.exe)+abort'
#   --bind 'ctrl-e:become(vim --ttyfail -- {+} < /dev/tty > /dev/tty)'
#   --color header:italic
#   --header 'Press CTRL-Y to copy command into clipboard'"
export FZF_CTRL_R_OPTS="
  --preview 'echo {}' --preview-window hidden:wrap
  --bind 'ctrl-/:toggle-preview'
  --bind 'ctrl-e:execute(echo -n {2..} | vim --ttyfail - )+abort'
  --bind 'ctrl-y:execute-silent(echo -n {2..} | clip.exe)+abort'
  --color header:italic
  --header 'Ctrl-Y copies command to clipboard'"

export FZF_CTRL_T_OPTS="
  --preview 'batcat -n --color=always {}' --preview-window hidden:wrap
  --bind 'ctrl-/:toggle-preview'
  --bind 'ctrl-y:execute-silent(cat {+} | clip.exe)+abort'
  --bind 'ctrl-e:become(vim --ttyfail -- {+} < /dev/tty > /dev/tty)'
  --color header:italic
  --header 'Ctrl-Y concatenates file to clipboard'"

export FZF_ALT_C_COMMAND='fd --type d --strip-cwd-prefix --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS"
  --cycle
  --multi
  --extended
  --no-mouse
  --no-scrollbar
  --layout=reverse
  --border=rounded
  --info=inline-right
  --marker='+'
  --tabstop=4
  --height 40%"
# --bind 'ctrl-e:become(vim --ttyfail -- {+} < /dev/tty > /dev/tty)'"

# Read: https://github.com/catppuccin/fzf?tab=readme-ov-file#usage 
# export CATPPUCCIN_MACCHIATO="\
#   --color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796 \
#   --color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 \
#   --color=marker:#f4dbd6,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796"
# export CATPPUCCIN_FRAPPE=" \
#   --color=bg+:#414559,bg:#303446,spinner:#f2d5cf,hl:#e78284 \
#   --color=fg:#c6d0f5,header:#e78284,info:#ca9ee6,pointer:#f2d5cf \
#   --color=marker:#f2d5cf,fg+:#c6d0f5,prompt:#ca9ee6,hl+:#e78284"
# export CATPPUCCIN_MOCHA="\
#   --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
#   --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
#   --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"
# export HARMONIC_DARK="\
#   --color=fg:#cbd6e2,bg:#0b1c2c,hl:#56bf8b \
#   --color=fg+:#56bf8b,bg+:#223b54,hl+:#56bf8b \
#   --color=info:#8bbf56,prompt:#bf568b,pointer:#bf8b56 \
#   --color=marker:#568BBF,spinner:#8bbf56,header:#627e99"
# 
# export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS$HARMONIC_DARK
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS

autoload -U compinit
compinit -i

source /opt/AMD/aocc-compiler-4.2.0/setenv_AOCC.sh
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
alias lt="tree --prune"

# fnm
export PATH="/home/$USER/.local/share/fnm:$PATH"
eval "`fnm env`"
alias x="tmux -L tmux_sock_null -f /dev/null"

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        source "$BASE16_SHELL/profile_helper.sh"

export NODE_EXTRA_CA_CERTS="/usr/local/share/ca-certificates/SSL_CA_Central.pem.crt"
base16_dracula
