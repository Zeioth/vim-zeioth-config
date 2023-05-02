"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sections:
"    -> python
"    -> ccc
"    -> shell
"    -> vue
"    -> markdown
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" => python
""""""""""""""""""""""""""""""
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self

au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako

au FileType python map <buffer> F :set foldmethod=indent<cr>

au FileType python inoremap <buffer> $r return 
au FileType python inoremap <buffer> $i import 
au FileType python inoremap <buffer> $p print 
au FileType python inoremap <buffer> $f # --- <esc>a
au FileType python map <buffer> <leader>1 /class 
au FileType python map <buffer> <leader>2 /def 
au FileType python map <buffer> <leader>C ?class 
au FileType python map <buffer> <leader>D ?def 


""""""""""""""""""""""""""""""
" => css
"""""""""""""""""""""""""""""""
" Omni complete functions
autocmd FileType css set omnifunc=csscomplete#CompleteCSS


""""""""""""""""""""""""""""""
" => shell 
""""""""""""""""""""""""""""""
if exists('$TMUX') 
    if has('nvim')
        set termguicolors
    else
        set term=screen-256color 
    endif
endif


""""""""""""""""""""""""""""""
" => vue
""""""""""""""""""""""""""""""
" Monkey patch to provide  % support to vue (may affect coc debugger)
" autocmd BufNewFile,BufRead *.vue set filetype=html


""""""""""""""""""""""""""""""
" => Markdown
""""""""""""""""""""""""""""""
let vim_markdown_folding_disabled = 1
autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
