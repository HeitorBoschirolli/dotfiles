call plug#begin('~/.config/nvim')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'christoomey/vim-tmux-navigator'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'morhetz/gruvbox'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'sheerun/vim-polyglot'
" fzf and fzf.vim work as one single plugin.
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
" Always load vim-devicons as the last plugin
Plug 'ryanoasis/vim-devicons'
call plug#end()

let mapleader=" "

" basic config ---------------------- {{{

" When a file has been detected to have been changed outside of Vim and it has
" not been changed inside of Vim, automatically read it again.
" When the file has been deleted this is not done, so you have the text from
" before it was deleted.
set autoread

" Show line numbers
set number

" Always show signcolumn with 2 column width
set signcolumn=yes:2

" Use 2 lines for the command line
set cmdheight=2

" configure statusline
set statusline=FileName:%f " display file name
set statusline+=\ Filetype:%y " display file type
set statusline+=%= " move to the right side of the statusline
set statusline+=col:\ %c " display current column number
set statusline+=\ row:%l/%L " display current and total lines of the file

" insert spaces to indent, works for the 'tab' character and the '>' and '<'
" commands
set expandtab

" set identation to 4 spaces
set shiftwidth=4

" Round indent to multiple of 'shiftwidth'. Applies to > and < commands.
"
" NOTE: CTRL-T and CTRL-D in Insert mode always round the indent to a multiple of
" 'shiftwidth'
set shiftround

" * Under default settings, making changes and then opening a new file will
"   display E37: No write since last change (add ! to override).[1]
"
" * Typing :set hidden will change this behaviour.[1]
"
" * With :set hidden, opening a new file when the current buffer has unsaved
"   changes causes files to be hidden instead of closed.[1]
"
" * The unsaved changes can still be accessed by typing :ls and then :b[N], where
"   [N] is the number of a buffer.[1]
"
" According to the coc-nvim README: "if hidden is not set, TextEdit might
" fail".
"
" WARNING: It's easy to forget that you have changes in hidden buffers.
" Think twice when using ":q!" or ":qa!".
"
" [1]: https://medium.com/usevim/vim-101-set-hidden-f78800142855
set hidden

" Do not make file backups after :write.
"
" According to the coc-nvim README: "Some servers have issues with backup
" files".
set nobackup
set nowritebackup

" If in 300 milliseconds nothing is typed the swap file will be written to
" disk (see |crash-recovery|).  Also used for the |CursorHold| autocommand
" event.
"
" Makes the linting messages appear faster on screen.
set updatetime=300

" }}}


" vim filetype settings ---------------------- {{{

augroup filetype_vim
    autocmd!

    " enable folding
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" }}}


" normal mode mappings ---------------------- {{{

" <leader>ev: open .vimrc (or init.vim) in a vertical split
nnoremap <leader>ev :split $MYVIMRC<cr>

" <leader>sv: source .vimrc (or init.vim) file
nnoremap <leader>sv :source $MYVIMRC<cr>

" <esc>: redraws the screen and removes any search highlighting
nnoremap <esc> <esc>:nohl<cr>

" coc-nvim mappings {{{

" gd: goto definition.
"
" DEPENDENDENCIES: coc-nvim
nmap <silent> gd <Plug>(coc-definition)

" gt: goto type definition (return type for function, variable type for
" variables etc.).
"
" DEPENDENDENCIES: coc-nvim
nmap <silent> gt <Plug>(coc-type-definition)

" gi: goto implementation
"
" DEPENDENDENCIES: coc-nvim
nmap <silent> gi <Plug>(coc-implementation)

" gr: goto references. Similar to perform a search operation, but only
" matches the references of the selected object (can be a variable, a function
" etc.).
"
" DEPENDENDENCIES: coc-nvim
nmap <silent> gr <Plug>(coc-references)

" }}}

" nerdtree mappings {{{

" <leader>n: toggle file explorer.
"
" DEPENDENDENCIES: nerdtree
nmap <leader>tn :NERDTreeToggle<CR>

" }}}

" fzf.vim mappings {{{

" <leader>f: search for file in files known to git (git ls-files).
"
" DEPENDENCIES: fzf and fzf.vim
nmap <leader>ff :GFiles<CR>

" <leader>g: recursively search for the pattern on the files from the directory
" in which Vim was opened.
"
" DEPENDENCIES: fzf and fzf.vim
nmap <leader>fp :Ag<CR>

" }}}

" fugitive  mappings {{{

" <leader>gs: open git status pane on horizontal split
"
" DEPENDENCIES: vim fugitive
nnoremap <leader>gs :G<cr>

" <leader>gc: commit staged files and open horizontal split to enter commit
" message
nnoremap <leader>gc :Gcommit<cr>

" <leader>gl: open git log on horizontal split at the bottom of the current
" window and occupies current pane with changes made on last commit. Tipically
" ctrl-o is a good way to go back to the file you were editing.
nnoremap <leader>gl :Glog<cr>

" }}}

" }}}


" insert mode mappings ---------------------- {{{

" <C-u>: make all letters of the current word uppercase without changing the
" cursor position or leaving insert mode.
inoremap <C-u> <esc>viwUea

" }}}


" operator pending mode mappings ---------------------- {{{

" Create function text object
"
" DEPENDENDENCIES: coc-nvim
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" }}}


" visual mode mappings ---------------------- {{{

" Create function text object
"
" DEPENDENDENCIES: coc-nvim
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)

" }}}


" auto commands ---------------------- {{{

" nerdtree auto commands {{{

augroup nerdtree_group
    autocmd!

    " Close neovim if the only window left open is a nerdtree
    autocmd bufenter *
        \ if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree())
        \ | q |
        \ endif
augroup END

" }}}

augroup reaload_group
    autocmd!

    " Update buffer when file is changed on disk. Useful for events like git
    " checkout and git reset
    autocmd FocusGained,CursorHold ?* if getcmdwintype() == '' | checktime | endif
    autocmd FocusGained,CursorHold ?* if getcmdwintype() == '' | GitGutter | endif
augroup END

" }}}


" colorschemes ---------------------- {{{

colorscheme gruvbox
let g:gruvbox_contrast_dark='hard'
set background=dark

" }}}
