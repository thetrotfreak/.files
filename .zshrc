plugins=(git ssh-agent)
zstyle :omz:plugins:ssh-agent quiet yes
# zstyle :omz:plugins:ssh-agent identities <space separated private ssh keys as absolute path if keys are not in the distribution standard ssh dir>
zstyle :omz:plugins:ssh-agent lifetime

# To use browser from WSL2 CLI
export BROWSER=MicrosoftEdge.exe

# Source AOCC (AMD Optimizing C/C++ and Fortran Compiler)
# Read: https://www.amd.com/content/dam/amd/en/documents/txt/aocc-4.0.0-readme.txt
# Read 3.1.1: https://www.amd.com/content/dam/amd/en/documents/pdfs/developer/aocc/aocc-v4.0-ga-user-guide.pdf
# source /opt/AMD/aocc-compiler-4.0.0/setenv_AOCC.sh

# For pip
# export PATH=/home/bivas/.local/bin:$PATH
