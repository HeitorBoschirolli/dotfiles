call plug#begin('~/.config/nvim')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" basic config ---------------------- {{{

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
