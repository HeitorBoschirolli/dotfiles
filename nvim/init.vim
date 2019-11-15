" Print friendly cat face when vim starts
echo ">^.^<"

" basic config ---------------------- {{{

" Use ',' as the leader key
let mapleader = ","

" Use '_' as the local leader key
let maplocalleader = '-'


" Show line numbers
set number

" Show the line number relative to the line with the cursor
set relativenumber

" Round indent to multiple of 'shiftwidth'. Applies to > and < commands.
"
" NOTE: CTRL-T and CTRL-D in Insert mode always round the indent to a multiple of
" 'shiftwidth'
set shiftround

" configure statusline
set statusline=Filename:\ %f " add filename
set statusline+=\  " add separator
set statusline+=filetype:\ %y " add filetype
set statusline+=%= " switch to the right side
set statusline+=%l/%L " add file total and current lines

" }}}


" command-line mode mappings ---------------------- {{{

" move between panes with hjkl
snoremap <c-h> <esc><c-w>h
snoremap <c-j> <esc><c-w>j
snoremap <c-k> <esc><c-w>k
snoremap <c-l> <esc><c-w>l

" }}}


" select mode mappings ---------------------- {{{

" move between panes with hjkl.
snoremap <c-h> <esc><c-w>h
snoremap <c-j> <esc><c-w>j
snoremap <c-k> <esc><c-w>k
snoremap <c-l> <esc><c-w>l

" }}}


" operator pending mode mappings ---------------------- {{{

" move between panes with hjkl.
onoremap <c-h> <esc><c-w>h
onoremap <c-j> <esc><c-w>j
onoremap <c-k> <esc><c-w>k
onoremap <c-l> <esc><c-w>l

" 'operator'p: perform the operation defined by 'operator' inside the
" parentheses.
"
" exemples:
"     - dp: delete content from inside the parentheses
"     - yp: yank content from inside the parentheses
onoremap p i(

" 'operator'in(: perform the operation defined by 'operator' inside the next
" pair of parentheses. The final cursor position will be right after the '('
" character.
"
" examples:
" For all examples suppose you have the text 'a = (1 + 1) * (2 + 1)' and the
" cursor position is at the 'a' character.
"     - din(: delete the content from inside the next pair of parentheses, the
"     resulting text would be 'a = () * (2 + 1)' and the cursor would be at
"     the first occurrence of the ')' character.
onoremap in( :<c-u>normal! f(vi(<cr>

" 'operator'il(: perform the operation defined by 'operator' inside the last
" pair of parentheses. The final cursor position will be right after the '('
" character.
"
" examples:
" For all examples suppose you have the text '(1 + 1) * (2 + 1) + a' and the
" cursor position is at the 'a' character.
"     - din(: delete the content from inside the last pair of parentheses, the
"     resulting text would be 'a = (1 + 1) * () + a' and the cursor would be at
"     the second occurrence of the ')' character.
onoremap il( :<c-u>normal! F(vi(<cr>

" 'operator'an(: perform the operation defined by 'operator' around the next
" pair of parentheses. The final cursor position will be the the '(' character.
"
" examples:
" For all examples suppose you have the text 'a = (1 + 1) * (2 + 1)' and the
" cursor position is at the 'a' character.
"     - dan(: delete the content from around the next pair of parentheses, the
"     resulting text would be 'a =  * (2 + 1)' and the cursor would be right
"     before thr '*' character.
onoremap an( :<c-u>normal! f(va(<cr>

" 'operator'al(: perform the operation defined by 'operator' around the last
" pair of parentheses. The final cursor position will be at the '(' character.
"
" examples:
" For all examples suppose you have the text '(1 + 1) * (2 + 1) + a' and the
" cursor position is at the 'a' character.
"     - dal(: delete the content from around the last pair of parentheses, the
"     resulting text would be 'a = (1 + 1) *  + a' and the cursor would be
"     right before the '+' character.
onoremap al( :<c-u>normal! F(va(<cr>

" }}}


" visual mode mappings ---------------------- {{{

" move between panes with hjkl
xnoremap <c-h> <c-w>h
xnoremap <c-j> <c-w>j
xnoremap <c-k> <c-w>k
xnoremap <c-l> <c-w>l

" }}}


" insert mode mappings ---------------------- {{{

" <c-u>: convert current word to uppercase with
inoremap <c-u> <esc>viwUea

" jk: go to normal mode
inoremap jk <esc>

" move between panes with hjkl
inoremap <c-h> <esc><c-w>h
inoremap <c-j> <esc><c-w>j
inoremap <c-k> <esc><c-w>k
inoremap <c-l> <esc><c-w>l

" }}}


" normal mode mappings ---------------------- {{{

" <leader>ev: open .vimrc (or init.vim) in a vertical split
:nnoremap <leader>ev :split $MYVIMRC<cr>

" <leader>sv: source .vimrc (or init.vim) file
:nnoremap <leader>sv :source $MYVIMRC<cr>

" <esc>: first redraw the screen and removes any search highlighting, then
" execute the default <esc> functionality
"
" NOTE: This does not change the option value of hlsearch, as soon as you use a
" search command, the highlighting comes back.
nnoremap <esc> <esc> :nohlsearch<cr>

" H: go to the beginning of the current line
nnoremap H 0

" L: go to the end of the current line
nnoremap L $

" move between panes with hjkl
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" }}}


" python auto commands ---------------------- {{{

augroup filetype_python
    autocmd!

    " In Insert mode: Use the appropriate number of spaces to insert a <Tab>.
    "
    " Spaces are used in indents with the '>' and '<' commands and when
    " 'autoindent' is on.
    "
    " To insert a real tab when 'expandtab' is on, use CTRL-V<Tab>.
    autocmd FileType python set expandtab

    " Number of spaces to use for each step of (auto)indent. Used for |>>|, |<<|
    " etc.
    autocmd FileType python set shiftwidth=4

    " <localleader>c: comment current line
    autocmd FileType python nnoremap <buffer> <localleader>c I# <esc>

    " iff: insert 'if:' and move the cursor to right before the ':'
    autocmd FileType python iabbrev <buffer> iff if:<left>

    " deff: insert 'def ():' and move the cursor to right before the ')'
    autocmd FileType python iabbrev <buffer> deff def ():<left><left>

augroup END

" }}}


" {yaml, yml} auto commands ---------------------- {{{

augroup filetype_yaml
    autocmd!

    " described in 'python auto commands'
    autocmd FileType yaml set expandtab

    " described in 'python auto commands'
    autocmd FileType yaml set shiftwidth=2

    " <localleader>c: comment current line
    autocmd FileType yaml nnoremap <buffer> <localleader>c I# <esc>

augroup END

" }}}


" Dockerfile auto commands ---------------------- {{{

augroup filetype_dockerfile
    autocmd!

    " described in 'python auto commands'
    autocmd BufWritePre,BufRead Dockerfile* set expandtab
    autocmd BufWritePre,BufRead Dockerfile* set shiftwidth=2

    " <localleader>c: comment current line
    autocmd BufWritePre,BufRead Dockerfile* nnoremap <buffer> <localleader>c I# <esc>

augroup END

" }}}


" Vimscript file settings ---------------------- {{{

augroup filetype_vim
    autocmd!
 
    " enable folding
    autocmd FileType vim setlocal foldmethod=marker

    " described in 'python auto commands'
    autocmd FileType vim set expandtab
    autocmd FileType vim set shiftwidth=4

    " described in 'python auto commands'
    autocmd FileType vim nnoremap <buffer> <localleader>c I" <esc>
augroup END

" }}}

