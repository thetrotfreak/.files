# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

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
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 13

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
plugins=(git ssh-agent gpg-agent)
zstyle :omz:plugins:ssh-agent quiet yes
zstyle :omz:plugins:ssh-agent lifetime
zstyle :omz:plugins:ssh-agent identities

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vi'
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

. "$HOME/.local/bin/env"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


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
    *)            fd --t f | fzf --preview 'batcat -n --color=always {}' "$@" ;;
  esac
}

# Print tree structure in the preview window
export FZF_ALT_C_OPTS="
  --preview 'tree -C {}' --preview-window hidden:wrap
  --bind 'ctrl-/:toggle-preview'
  --bind 'ctrl-e:become(vim --ttyfail -- {+} < /dev/tty > /dev/tty)'
  --header 'C-/ :Preview, C-E :Edit'"

export FZF_CTRL_R_OPTS="
  --preview 'echo {}' --preview-window hidden:wrap
  --bind 'ctrl-/:toggle-preview'
  --bind 'ctrl-e:execute(echo -n {2..} | vim --ttyfail - )+abort'
  --bind 'ctrl-y:execute-silent(echo -n {2..} | clip.exe)+abort'
  --header 'Ctrl-Y :Clip, Ctrl-E :Edit'"

export FZF_CTRL_T_OPTS="
  --preview 'batcat -n --color=always {}' --preview-window hidden:wrap
  --bind 'ctrl-/:toggle-preview'
  --bind 'ctrl-y:execute-silent(cat {+} | clip.exe)+abort'
  --bind 'ctrl-e:become(vim --ttyfail -- {+} < /dev/tty > /dev/tty)'
  --bind 'ctrl-o:become(view --ttyfail -- {+} < /dev/tty > /dev/tty)'
  --header 'C-Y :Clip, C-E :Edit, C-O :Read'"

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
  --height 50%"
# --bind 'ctrl-e:become(vim --ttyfail -- {+} < /dev/tty > /dev/tty)'"

export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS

# Tinted Scripts
# Place them after fzf to prevent from getting overriden 
. ~/.config/tinted-fzf/sh/base16-gruvbox-dark-soft.sh
. ~/.config/tinted-shell/scripts/base16-gruvbox-dark-soft.sh

# Astral UV
eval "$(uv generate-shell-completion zsh)"
eval "$(uvx --generate-shell-completion zsh)"

# Have batcat auto adapt to shell colors
export BAT_THEME='base16-256'

