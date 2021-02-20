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
set undodir=~/.config/nvim/undodir " set undotree file directory
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
nnoremap <SPACE> <Nop>
let mapleader=" "
let g:airline_section_b = '%{strftime("%c")}'

" Directorio de plugins
call plug#begin('~/.local/share/nvim/plugged')
" Aquí irán los plugins a instalar
Plug 'gruvbox-community/gruvbox'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'mbbill/undotree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()
"
" " Luego de esta línea puedes agregar tus configuraciones y mappings
"Colorscheme options.
set bg=dark
colorscheme gruvbox

inoremap <C-c> <esc> 

" " Map show undo tree
nnoremap <leader>u :UndotreeShow<CR>
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'
let g:fzf_branch_actions = {
      \ 'rebase': {
      \   'prompt': 'Rebase> ',
      \   'execute': 'echo system("{git} rebase {branch}")',
      \   'multiple': v:false,
      \   'keymap': 'ctrl-r',
      \   'required': ['branch'],
      \   'confirm': v:false,
      \ },
      \ 'track': {
      \   'prompt': 'Track> ',
      \   'execute': 'echo system("{git} checkout --track {branch}")',
      \   'multiple': v:false,
      \   'keymap': 'ctrl-t',
      \   'required': ['branch'],
      \   'confirm': v:false,
      \ },
      \}
nmap <leader>f :Files<CR>
