call plug#begin()

" airline
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'Yggdroot/indentLine'

call plug#end()

" ===========================================================
" general configuration
" ===========================================================
set relativenumber
set number

set shiftwidth=4
set expandtab
set tabstop=4
set softtabstop=4
set cursorline
set termguicolors
set nowrap
filetype plugin on
let mapleader=','
nnoremap <Leader><Space> :nohlsearch<CR>

map gt :bn<cr>
map gT :bp<cr>
map gd :bd<cr>

" ===========================================================
" plugins configuration
" ===========================================================

" ============== airline ==============
let g_airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_detect_modified = 0
"" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
"let g:airline_symbols.linenr = ''


let g:gruvbox_contrast_dark='normal'
colorscheme gruvbox

" Enable true color
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif


" nerdcommenter
let g:NERDSpaceDelims = 1
nnoremap <C-_> :call NERDComment('Toggle', 'Toggle')<CR>
inoremap <C-_> <esc>:call NERDComment('Toggle', 'Toggle')<CR>
vnoremap <C-_> :call NERDComment('Toggle', 'Toggle')<CR>

" nerdtree
nnoremap <Leader>n : NERDTreeToggle<cr>
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1
let NERDTreeIgnore = ['\.pyc$', '__pycache__', '.git$']
let g:NERDTreeDirArrowExpandable = ' '
let g:NERDTreeDirArrowCollapsible = ' '
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" indentLine
let g:indentLine_first_char = '┊'
let g:indentLine_char = '┊'
let g:indentLine_showFirstIndentLevel = 1

