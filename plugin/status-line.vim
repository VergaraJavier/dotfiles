set laststatus=2
set showtabline=0

function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction

function! FileNameWithIcon() abort
  return winwidth(0) > 70  ?  WebDevIconsGetFileTypeSymbol() . ' ' . expand('%:T') : ''
endfunction

let g:lightline = { 'colorscheme': 'gruvbox' }

let g:lightline.component_function = { 'gitstatus': 'GitStatus' }
let g:lightline.component = { 'filename_with_icon': '%{FileNameWithIcon()}' }

let g:lightline.active = {
      \ 'left': [['mode', 'readonly'], ['filename_with_icon', 'modified']],
      \ 'right': [['lineinfo'], ['percent'], ['gitstatus', 'fileformat', 'fileencoding', 'filetype']]
      \ }
