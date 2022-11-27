" let $NO_COLOR='1'

syntax on

set number relativenumber
set cursorline
set cursorlineopt=number

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent

set noswapfile

set ttyfast

let &shell = executable('pwsh') ? 'pwsh' : 'powershell'
let &shellcmdflag = '-InputFormat Text -OutputFormat Text -NoProfile -NoLogo -Interactive -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"& { $PSStyle.OutputRendering=''PlainText'' } ";'
let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
set shellquote=
set shellxquote=

" use vim-plug as plugin manager
" use a custom colorscheme
call plug#begin()

Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

call plug#end()

colorscheme tokyonight-night

" for transparent background
highlight Normal guibg=none
highlight NonText guibg=none
