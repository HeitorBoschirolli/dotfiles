call plug#begin()
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
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



