# WSL2 Ubuntu 22.04.2 LTS (Jammy Jellyfish)
### Quick Setup:
```console
curl https://raw.githubusercontent.com/thetrotfreak/.files/main/wsl2.sh | dash
```
### Windows Terminal Profile:

```console
wsl.exe --shell-type login --cd ~ --distribution Ubuntu tmux attach-session -t base || tmux new -s base
```
### References:
|What?|Where?|Note!|
|---|---|---|
|Oh My Zsh!|https://github.com/ohmyzsh/ohmyzsh/wiki#welcome-to-oh-my-zsh|
|**uv** - An extremely fast Python package and project manager, written in Rust.|https://docs.astral.sh/uv/getting-started/installation/|
|**pip** - The Python Package Installer|https://pip.pypa.io/en/stable/installation/#get-pip-py|
|**AOCC** - AMD Optimizing C/C++ and Fortran Compilers|https://www.amd.com/en/developer/aocc.html|`curl` [*this*](https://download.amd.com/developer/eula/aocc/aocc-4-2/aocc-compiler-4.2.0_1_amd64.deb)) directly to avoid the **EULA**|
|**Black** - The Uncompromising Code Formatter|https://black.readthedocs.io/en/stable/integrations/editors.html#vim-8-native-plugin-management|
|**Autopep8** - The Compromising Code Formatter|https://github.com/tell-k/vim-autopep8|
|ClangFormat|https://clang.llvm.org/docs/ClangFormat.html#vim-integration|
|Vim Meetups|https://youtu.be/XA2WjJbmmoM?t=315|
|MySQL|https://www.digitalocean.com/community/tutorials/how-to-install-mysql-on-ubuntu-22-04#step-2-configuring-mysql|
|**JDK** - Eclipse Temurin|https://adoptium.net/installation/linux/#_deb_installation_on_debian_or_ubuntu|
|Docker|https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository|
|**Volta** - The Hassle-Free JavaScript Tool Manager|https://docs.volta.sh/guide/getting-started|
|GitHub CLI|https://github.com/cli/cli/blob/trunk/docs/install_linux.md#debian-ubuntu-linux-raspberry-pi-os-apt|Read [*this*](https://cli.github.com/manual/gh_completion)
|GitLab CLI|https://gitlab.com/gitlab-org/cli/-/releases|Read [*this*](https://github.com/thetrotfreak/.files/blob/main/glab.md)
|`fzf`|https://github.com/junegunn/fzf#using-git|
|`fd`|https://github.com/sharkdp/fd#on-ubuntu|
|`cscope`|https://cscope.sourceforge.net/|Read [*tutorial*](https://cscope.sourceforge.net/cscope_vim_tutorial.html)
