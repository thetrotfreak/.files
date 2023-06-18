#!/bin/sh

# Suppress WSL2 Ubuntu Banner
touch .hushlogin

sudo apt-get update && sudo apt-get upgrade -y

sudo apt-get install build-essential gdb python3.10-venv zsh -y

# Read(for root detection): https://askubuntu.com/a/30157
# Read(for chsh): https://askubuntu.com/a/1325754
sudo chsh -s $(which zsh) $(whoami)
dash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

dash -c "curl -fsSLO https://bootstrap.pypa.io/get-pip.py && python3 get-pip.py && rm get-pip.py"
echo "export PATH=$HOME/.local/bin:\$PATH" >> ~/.zshrc
# since source doesn't work inside dash
# export it to the current ENVIRONMENT to successfully allow Black Vim Integration
export PATH=$HOME/.local/bin:$PATH

dash -c "$(curl -fsSLo ~/.tmux.conf https://raw.githubusercontent.com/thetrotfreak/.files/main/.tmux.conf)"

dash -c "$(curl --create-dirs -fsSLo ~/.vim/pack/python/start/black/plugin/black.vim https://raw.githubusercontent.com/psf/black/stable/plugin/black.vim)"
dash -c "$(curl --create-dirs -fsSLo ~/.vim/pack/python/start/black/autoload/black.vim https://raw.githubusercontent.com/psf/black/stable/autoload/black.vim)"
dash -c "$(curl --create-dirs -fsSLo ~/.vim/colors/gruvbox.vim https://raw.githubusercontent.com/thetrotfreak/.files/main/.vim/colors/gruvbox.vim)"
dash -c "$(curl --create-dirs -fsSLo ~/.vim/colors/catppuccin_mocha.vim https://raw.githubusercontent.com/thetrotfreak/.files/main/.vim/colors/catppuccin_mocha.vim)"
dash -c "$(curl --create-dirs -fsSLo ~/.vim/colors/catppuccin_macchiato.vim https://raw.githubusercontent.com/thetrotfreak/.files/main/.vim/colors/catppuccin_macchiato.vim)"
dash -c "$(curl --create-dirs -fsSLo ~/.vim/colors/catppuccin_latte.vim https://raw.githubusercontent.com/thetrotfreak/.files/main/.vim/colors/catppuccin_latte.vim)"
dash -c "$(curl --create-dirs -fsSLo ~/.vim/colors/catppuccin_frappe.vim https://raw.githubusercontent.com/thetrotfreak/.files/main/.vim/colors/catppuccin_frappe.vim)"
dash -c "$(curl --create-dirs -fsSLo ~/.vim/vimrc https://raw.githubusercontent.com/thetrotfreak/.files/main/.vim/vimrc)"
vim --not-a-term -c Black -c qall
