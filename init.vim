" Directorio de plugins
call plug#begin('~/.local/share/nvim/plugged')
" Aquí irán los plugins a instalar
Plug 'gruvbox-community/gruvbox'
Plug 'tpope/vim-surround'
Plug 'mbbill/undotree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'airblade/vim-gitgutter' " show git changes
Plug 'itchyny/lightline.vim' " bar
Plug 'ryanoasis/vim-devicons' " icons in bar
call plug#end()
"
" " Luego de esta línea puedes agregar tus configuraciones y mappings
"Colorscheme options.
set bg=dark
colorscheme gruvbox

inoremap <C-c> <esc> 

" " Map show undo tree
nnoremap <leader>u :UndotreeShow<CR>
"telescope
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

" Line bubbling
" Use these two if you don't have prettier
nnoremap <silent> <c-j> :m .+1<CR>==
nnoremap <silent> <c-k> :m .-2<CR>==
nnoremap <silent> <c-j> :m .+1<CR>
nnoremap <silent> <c-k> :m .-2<CR>
inoremap <silent> <c-j> <Esc>:m .+1<CR>==gi
inoremap <silent> <c-k> <Esc>:m .-2<CR>==gi
vnoremap <silent> <c-j> :m '>+1<CR>gv=gv
vnoremap <silent> <c-k> :m '<-2<CR>gv=gv

