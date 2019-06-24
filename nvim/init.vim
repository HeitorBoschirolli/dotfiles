call plug#begin()
" fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" coc
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

" nerdtree
Plug 'scrooloose/nerdtree'

" airline
Plug 'vim-airline/vim-airline'

" fugitive.vim
Plug 'tpope/vim-fugitive'

" themes
Plug 'challenger-deep-theme/vim', { 'name': 'challenger-deep' }
Plug 'morhetz/gruvbox'
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

" show line numbers
set number

" show line numbers relative to the current line
set relativenumber

" when a file has been detected to have been changed outside of Vim and it has not been
" changed inside of Vim, automatically read it again.
set autoread

" use CTRL+{h, j, k, l} to navigate windows form any mode
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l
inoremap <C-h> <C-\><C-N><C-w>h
inoremap <C-j> <C-\><C-N><C-w>j
inoremap <C-k> <C-\><C-N><C-w>k
inoremap <C-l> <C-\><C-N><C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" use <Esc> to exit terminal insert-mode
tnoremap <Esc> <C-\><C-n>

" toggle 'default' terminal
nnoremap <leader>t :call ChooseTerm("term-slider", 1)<CR>

" start terminal in current pane
nnoremap <C-CR> :call ChooseTerm("term-pane", 0)<CR>
 
function! ChooseTerm(termname, slider)
    let pane = bufwinnr(a:termname)
    let buf = bufexists(a:termname)
    if pane > 0
        " pane is visible
        if a:slider > 0
            :exe pane . "wincmd c"
        else
            :exe "e #"
        endif
    elseif buf > 0
        " buffer is not in pane
        if a:slider
            :exe "botright split"
	    :exe "res -15"
        endif
        :exe "buffer " . a:termname
    else
        " buffer is not loaded, create
        if a:slider
            :exe "botright split"
	    :exe "res -15"
        endif
        :terminal
        :exe "f " a:termname
    endif
endfunction

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

" if hidden is not set, TextEdit might fail.
set hidden

" some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" better display for messages
set cmdheight=2

" you will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" always show signcolumns
set signcolumn=yes

" use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" ===== nerdtree =====
" open nerdtree with <C-n>
map <C-n> :NERDTreeToggle<CR>

" ===== gruvbox (theme) =====
let g:gruvbox_contrast_dark='normal'
colorscheme gruvbox
