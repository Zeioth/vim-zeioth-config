"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sections:
"    -> general
"    -> buffers/windows/tabs
"    -> user interface
"    -> alt keybindings
"    -> helper functions
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => general
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=1000

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
set noswapfile

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file
" (useful for handling the permission-denied error)
command! W execute 'w !sudo tee %'


" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" Remap VIM 0 to first non-blank character
map 0 ^

" [LINE]
nnoremap <leader>ld o------------------------------------------------------------------------------<ESC>o<ESC>0
nnoremap <leader>lh o##############################################################################<ESC>o<ESC>0
nnoremap <leader>lc o```<CR><CR>```<ESC>k

" Map Ctrl-Backspace to delete the previous word in insert mode.
set backspace=indent,eol,start
imap <c-bs> <c-w>
let &t_TI = "\<Esc>[>4;2m"
let &t_TE = "\<Esc>[>4m"
noremap <C-h> ciw
inoremap <C-h> <ESC>ciw

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" https://unix.stackexchange.com/a/336537/43420
set foldmethod=indent
set foldnestmax=10
set foldlevel=2
set nofoldenable

" Trim spaces on save
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.ts,*.py,*.wiki,*.sh,*.coffee,*.md :call CleanExtraSpaces()
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => buffers/windows/tabs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" BUFFERS
" --------------------------
" Map <Space> to / (search)
map <space> /

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
nnoremap <leader>ba :w <bar> %bd <bar> e# <bar> bd# <CR>

" Buffer shortcuts by id
map <leader>bgu :bprevious<cr>
map <leader>bgp :bnext<cr>
map <leader>bga :buffer 4<CR>
map <leader>bgs :buffer 3<CR>
map <leader>bgh :buffer 2<CR>
map <leader>bgt :buffer 1<CR>
map <leader>bgg :buffer 5<CR>
map <leader>bgy :buffer 0<CR>
map <leader>bgn :buffer 6<CR>
map <leader>bge :buffer 7<CR>
map <leader>bgo :buffer 8<CR>
map <leader>bgi :buffer 9<CR>

" WINDOWS
" --------------------------
" Quick move between windows
map <C-t> <C-W><C-W>

" Close the current window [without closing the buffer]
nmap <leader>q :q<cr>

" TABS
" --------------------------
" delete the last cr if you wanna specify a number.
map <leader>tn :tabnew<cr><cr>
map <leader>to :tabonly<cr><cr>
map <leader>tc :tabclose<cr><cr>
map <leader>tm :tabmove<cr><cr>
map <leader>td :tabnext<cr><cr>
" Last accessed tab with <lead>tl [toggle]
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => User interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Wild menu - On
set wildmenu

" Wild menu - Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

"Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Add a bit extra margin to the left
set foldcolumn=1

" Enable syntax highlighting
syntax enable

" Default color
set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Always show the status line
set laststatus=2


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => go to next/prev html tag
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" next tag
nnoremap <leader>c1 :<C-u>call search('<[a-zA-B0-9]', 'sWz')<CR>

" previous tag
nnoremap <leader>c2 :<C-u>call search('<[a-zA-B0-9]', 'bsWz')<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => turn persistent undo on
"    means that you can undo even when you close a buffer/VIM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
    set undodir=~/.vim_runtime/temp_dirs/undodir
    set undofile
catch
endtry


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => fast editing and reloading of vimrc configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>e :e! ~/.vim_runtime/my_configs.vim<cr>
autocmd! bufwritepost ~/.vim_runtime/my_configs.vim source ~/.vim_runtime/my_configs.vim


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => enable alt keybindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
execute "set <M-q>=\eq"
execute "set <M-d>=\ed"
execute "set <M-r>=\er"
execute "set <M-w>=\ew"
execute "set <M-b>=\eb"
execute "set <M-a>=\ea"
execute "set <M-s>=\es"
execute "set <M-h>=\eh"
execute "set <M-t>=\et"
execute "set <M-g>=\eg"
execute "set <M-z>=\ez"
execute "set <M-x>=\ex"
execute "set <M-m>=\em"
execute "set <M-c>=\ec"
execute "set <M-v>=\ev"

execute "set <M-j>=\ej"
execute "set <M-f>=\ef"
execute "set <M-u>=\eu"
execute "set <M-p>=\ep"
"execute "set <M-ñ>=\eñ"
execute "set <M-y>=\ey"
execute "set <M-n>=\en"
execute "set <M-e>=\ee"
execute "set <M-o>=\eo"
execute "set <M-i>=\ei"
execute "set <M-k>=\ek"
execute "set <M-l>=\el"
"execute "set <M-,>=\e,"
"execute "set <M-.>=\e."
"execute "set <M-?>=\e?"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

" Wrapper for keybindings that use visual selection.
function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction

