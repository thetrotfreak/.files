The output of this command will be computer code and is meant to be saved 
to a file or immediately evaluated by an interactive shell. To load completions:

### Bash

To load completions in your current shell session:

```plaintext
source <(glab completion -s bash)
```

To load completions for every new session, execute once:

#### Linux

```plaintext
glab completion -s bash > /etc/bash_completion.d/glab
```

#### macOS

```plaintext
glab completion -s bash > /usr/local/etc/bash_completion.d/glab
```

### Zsh

If shell completion is not already enabled in your environment you will need
to enable it. You can execute the following once:

```plaintext
echo "autoload -U compinit; compinit" >> ~/.zshrc
```

To load completions in your current shell session:

```plaintext
source <(glab completion -s zsh); compdef _glab glab
```

To load completions for every new session, execute once:

#### Linux

```plaintext
glab completion -s zsh > "${fpath[1]}/_glab"
```

#### macOS

```plaintext
glab completion -s zsh > /usr/local/share/zsh/site-functions/_glab
```

### fish

To load completions in your current shell session:

```plaintext
glab completion -s fish | source
```

To load completions for every new session, execute once:

```plaintext
glab completion -s fish > ~/.config/fish/completions/glab.fish
```

### PowerShell

To load completions in your current shell session:

```plaintext
glab completion -s powershell | Out-String | Invoke-Expression
```

To load completions for every new session, add the output of the above command
to your powershell profile.

When installing glab through a package manager, however, it's possible that
no additional shell configuration is necessary to gain completion support. 
For Homebrew, see <https://docs.brew.sh/Shell-Completion>


USAGE
  glab completion [flags]

FLAGS
      --no-desc        Do not include shell completion description
  -s, --shell string   Shell type: {bash|zsh|fish|powershell} (default "bash")

INHERITED FLAGS
  --help   Show help for command

LEARN MORE
  Use 'glab <command> <subcommand> --help' for more information about a command.

