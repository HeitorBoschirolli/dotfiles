call plug#begin()
" fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" coc
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
call plug#end()

" ============================================================================
" Basic Setup
" ============================================================================
" disable compatibility to old-time vi
set nocompatible

" remap leader key to ,
let g:mapleader=','

" encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

" show matching brackets.
set showmatch

" middle-click paste with mouse
set mouse=v

" highlight search results
set hlsearch

" ============================================================================
" Plugin Setup
" ============================================================================

" ===== fzf =====

" find files
nnoremap <silent> <leader>p :Files<CR>

" find pattern
nnoremap <silent> <leader>f :Ag<CR>

" list buffers
nnoremap <silent> <leader>a :Buffers<CR>

" show file preview on search
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" hide statusline of terminal buffer
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler


" ===== coc ======

" use <tab> for trigger completion and navigate to next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

" use <tab> and <S-tab> to navigate the completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" use <cr> to confirm completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" make <cr> select the first completion item and confirm the completion
" when no item has been selected
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

" close preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
