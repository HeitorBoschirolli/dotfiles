call plug#begin('~/.config/nvim')
call plug#end()

" basic config ---------------------- {{{

" configure statusline
set statusline=FileName:%f " display file name
set statusline+=\ Filetype:%y " display file type
set statusline+=%= " move to the right side of the statusline
set statusline+=col:\ %c " display current column number
set statusline+=\ row:%l/%L " display current and total lines of the file

" }}}


" vim filetype settings ---------------------- {{{

augroup filetype_vim
    autocmd!

    " enable folding
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" }}}
