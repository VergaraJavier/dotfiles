set guicursor=
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
" set noshowmode
"signcolumn=yes
"isfname+=@-@
" " set ls=0
"
" " Give more space for displaying messages.
set cmdheight=1
"
" " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" " delays and poor user experience.
set updatetime=50
"
" " Don't pass messages to |ins-completion-menu|.
set shortmess+=c
"
"set colorcolumn=80
"
" Directorio de plugins
call plug#begin('~/.local/share/nvim/plugged')
" Aquí irán los plugins a instalar
Plug 'gruvbox-community/gruvbox'

call plug#end()
"
" " Luego de esta línea puedes agregar tus configuraciones y mappings
"Colorscheme options.
set bg=dark
colorscheme gruvbox
