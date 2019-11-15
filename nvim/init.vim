call plug#begin('~/.config/nvim')
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

" }}}


" vim filetype settings ---------------------- {{{

augroup filetype_vim
    autocmd!

    " enable folding
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" }}}
