plugins=(git ssh-agent)
zstyle :omz:plugins:ssh-agent quiet yes
zstyle :omz:plugins:ssh-agent identities <space separated private ssh keys as absolute path if keys are not in the distribution standard ssh dir>
zstyle :omz:plugins:ssh-agent lifetime
