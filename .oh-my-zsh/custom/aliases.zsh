# Put files in this folder to add your own custom functionality.
# See: https://github.com/ohmyzsh/ohmyzsh/wiki/Customization
#
# Files in the custom/ directory will be:
# - loaded automatically by the init script, in alphabetical order
# - loaded last, after all built-ins in the lib/ directory, to override them
# - ignored by git by default
#
# Example: add custom/shortcuts.zsh for shortcuts to your local projects
#
# brainstormr=~/Projects/development/planetargon/brainstormr
# cd $brainstormr

export EDITOR=vim

alias zshconfig="$EDITOR ~/.zshrc"
alias ohmyzsh="$EDITOR ~/.oh-my-zsh"

# Handy aliases for work stuff
alias orgs="cd $HOME/projects/DIR_NAME"
alias orgv="deactivate > /dev/null 2>&1 || source $HOME/projects/DIR_NAME/.venv/bin/activate"
alias orgp="source $HOME/projects/DIR_NAME/pythonpath.sh"
alias org="orgs && orgv"

# This unsets the OMZ's default alias d which is some `dirs`
alias d=docker
alias e=vim
alias o=view
alias cls=clear

# Most used git commands
alias gpl="git pull --ff-only"
alias gpsh="git push -u"
alias gss="git status -s"

alias gsc="git switch -c"
alias gsl="git switch -"
alias gs="git switch"

alias ga="git add"
alias gc="git commit -S"

alias gd="git diff"
alias gdi="git diff --staged"

alias gr="git rebase"

alias ghl="git stash list"
alias gsh="git stash --message"
alias ghp="git stash show"

alias gl="git log --oneline"

alias gwl="git worktree list"
alias gwa="git worktree add"
alias gwrm="git worktree remove"

alias gfs="git fetch && git status"
