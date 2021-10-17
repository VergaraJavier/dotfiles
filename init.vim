" Directorio de plugins
call plug#begin('~/.local/share/nvim/plugged')
" Aquí irán los plugins a instalar
Plug 'gruvbox-community/gruvbox'
Plug 'tpope/vim-surround'
Plug 'mbbill/undotree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'airblade/vim-gitgutter' " show git changes
Plug 'itchyny/lightline.vim' " bar
Plug 'ryanoasis/vim-devicons' " icons in bar
Plug 'jiangmiao/auto-pairs' " pair completion
Plug 'neovim/nvim-lspconfig' " lsp
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'} " autocompletion 
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'} " snippets
Plug 'mfussenegger/nvim-jdtls'
Plug 'maxmellon/vim-jsx-pretty' "jsx sintaxis
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

" buffer > tabs
nmap <leader>j :bprev<CR>
nmap <leader>k :bnext<CR>
nmap <leader>q :bp <BAR> bd #<CR>

" seteo auto start para completion y solicito que inicio tabnine
let g:coq_settings = { 'auto_start': v:true,'clients':{ 'tabnine': {'enabled': v:true} }  }
" - Startup LSP Servers
lua require'tomo.lsp'

augroup lsp
   au!
   au FileType java lua require'tomo.jdtls_config'.setup()
augroup end

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

"xclip integration
set clipboard+=unnamedplus

function! ClipboardYank()
  call system('xclip -i -selection clipboard', @@)
endfunction
function! ClipboardPaste()
  let @@ = system('xclip -o -selection clipboard')
endfunction

vnoremap <silent> y y:call ClipboardYank()<cr>
vnoremap <silent> d d:call ClipboardYank()<cr>
nnoremap <silent> p :call ClipboardPaste()<cr>
