" This init.vim for NeoVim on Windows
" let $NO_COLOR='1'

set termguicolors
syntax on
set number relativenumber
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

" Uncomment for transparent background
" highlight Normal guibg=none
" highlight NonText guibg=none

let g:loaded_python3_provider=0
let g:loaded_perl_provider=0

" Watch: youtube.com/watch?v=XA2WjJbmmoM
set nocompatible

" enable syntax and plugins (for netrw)
syntax enable
filetype plugin on

" search down into the subfolders
" provides tab-compeltion for file operations
set path+=**

" display all matching files when we tab-complete
set wildmenu

" display relative line number, cursor line is relative
set number
set relativenumber

" netrw tweaks
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\*'

" Vim hard mode; disable arrow keys, so that your fingers
" never leave the home row on the keyboard
" set backspace=0

nnoremap <buffer> <Left> <Esc>
nnoremap <buffer> <Right> <Esc>
nnoremap <buffer> <Up> <Esc>
nnoremap <buffer> <Down> <Esc>
nnoremap <buffer> <PageUp> <Esc>
nnoremap <buffer> <PageDown> <Esc>

inoremap <buffer> <Left> <Esc>
inoremap <buffer> <Right> <Esc>
inoremap <buffer> <Up> <Esc>
inoremap <buffer> <Down> <Esc>
inoremap <buffer> <PageUp> <Esc>
inoremap <buffer> <PageDown> <Esc>

vnoremap <buffer> <Left> <Esc>
vnoremap <buffer> <Right> <Esc>
vnoremap <buffer> <Up> <Esc>
vnoremap <buffer> <Down> <Esc>
vnoremap <buffer> <PageUp> <Esc>
vnoremap <buffer> <PageDown> <Esc>
