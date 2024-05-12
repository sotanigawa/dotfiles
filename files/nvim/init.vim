call plug#begin('~/.local/share/nvim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'ntpeters/vim-better-whitespace'
Plug 'Mofiqul/dracula.nvim'
call plug#end()

set encoding=utf-8
set number
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab smartindent
set ignorecase smartcase incsearch hlsearch

colorscheme dracula
