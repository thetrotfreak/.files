local user='%{$fg_bold[green]%}%n@%{$fg_bold[green]%}%m%{$reset_color%}'
local pwd='%{$fg_bold[blue]%}%c%{$reset_color%}'

PROMPT="${user}:${pwd}"
PROMPT+='$(git_prompt_info)$ '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[white]%}:%{$fg_bold[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}*"
