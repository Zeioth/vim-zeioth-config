"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sections:
"    -> yankStack
"    -> ffz.vim
"    -> ctrl-p
"    -> far.vim
"    -> zen mode
"    -> vim-table-mode
"    -> vim-prosession
"    -> vim-ctrlpobsession
"    -> vim-fugitive
"    -> git-gutter
"    -> ultisnippets
"    -> gutentags-plus
"    -> markdown-preview
"    -> neural
"    -> vim-autosave
"    -> vim-coc      - linter/intellisense/beautifier
"    -> vimspector   - debugger
"    -> vim-dispatch - compile/run
"    -> vim-test     - unit testing/e2e
"    -> vim-doxygen  - project documentation
"    -> vim-typedoc
"    -> lightline
"    -> vim-whichkey
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" => Load pathogen paths
""""""""""""""""""""""""""""""
let s:vim_runtime = expand('<sfile>:p:h')."/.."
call pathogen#infect(s:vim_runtime.'/sources_forked/{}')
call pathogen#infect(s:vim_runtime.'/sources_non_forked/{}')
call pathogen#infect(s:vim_runtime.'/my_plugins/{}')
call pathogen#helptags()


""""""""""""""""""""""""""""""
" => yankStack
"""""""""""""""""""""""""""""""
" Yankstack adapt to our other remaps
call yankstack#setup()
let g:yankstack_yank_keys = ['y', 'd']
nmap ñ <Plug>yankstack_substitute_older_paste
nmap Ñ <Plug>yankstack_substitute_newer_paste

" NOTE: This is not necessary in vim9 anymore, it seems
" Add wayland compatibility to system clipboard
xnoremap "+y y:call system("wl-copy", @")<cr>
nnoremap "+p :let @"=substitute(system("wl-paste --no-newline"), '<C-v><C-m>', '', 'g')<cr>p

" This register does the same, but it trims line breaks (delete it or keep it, you choose)
nnoremap "*p :let @"=substitute(system("wl-paste --no-newline --primary"), '<C-v><C-m>', '', 'g')<cr>p

" System yank/paste shortcuts
xmap <c-y> "+y
map <c-p> "+p<ESC>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" =>  fzf.vim [Search in code]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Necessary for termux
let g:gfzf_command_prefix='Fzf'
nnoremap <leader>as :Ag<CR>
nnoremap <leader>ab :BLines<CR>
nnoremap <leader>cs :Snippets<CR>
nnoremap <leader>ch :History:<CR>
nnoremap <leader>f :Files<CR>


""""""""""""""""""""""""""""""
" => crtl-p
""""""""""""""""""""""""""""""
let MRU_Max_Entries = 100
let g:ctrlp_working_path_mode = 0
let g:ctrlp_max_height = 25
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'

" Quickly find and open a file in the current working directory
let g:ctrlp_map = '<C-f>'

" Quickly find and open a buffer
map <leader>bb :CtrlPBuffer<cr>

" Quickly find and open a recently opened file
map <leader>o :CtrlPMRU<CR>

" Swap movement keys
let g:ctrlp_prompt_mappings = {
  \ 'PrtSelectMove("j")':   ['<c-k>', '<down>'],
  \ 'PrtSelectMove("k")':   ['<c-j>', '<up>'],
  \ }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" =>  far.vim [Replace keybindings]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Note: Make sure the 'cd project-folder' is correct.
set ignorecase smartcase
let g:far#enable_undo=1
let g:far#source='ag'
let g:far#ignore_files=['~/.vim_runtime/vimrcs/farignore']
let g:far#default_mappings=0
let g:far#default_file_mask='%'

nnoremap <leader>ar :Far foo bar %
nnoremap <leader>a<S-r> :Far foo bar *
nnoremap <leader>ac :Fardo
nnoremap <leader>au :Farundo


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => zen mode (goyo)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NOTE: The numbar counts like 4 spaces.
let g:goyo_width=83
let g:goyo_margin_top = 0
let g:goyo_margin_bottom = 0
nnoremap <silent> <leader>z :Goyo<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim table mode
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:table_mode_corner='|'
let g:table_mode_color_cells=1
let g:table_mode_disable_mappings=1
let g:table_mode_disable_tableize_mappings=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-prosession
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NOTE: Prosession will just track sessions.
" - To create a sessions use: mks!
" - To load a session  source
let g:prosession_on_startup = 0
let g:prosession_dir="~/.vim_runtime/temp_dirs/sessions"
let g:prosession_last_session_dir="~/.vim_runtime/temp_dirs/sessions"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-ctrlpobsession
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader>s :CtrlPObsession<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-ranger
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ranger_terminal = 'foot'
let g:ranger_command_override = 'LC_ALL=es_ES.UTF8 TERMCMD="foot -a \"scratchpad\"" ranger'
let g:ranger_map_keys = 0
map  <leader>r :Ranger<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" =>  vim-fugitive [Git client]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" You can run manual commands like merge and rebase.
let g:fugitive_no_maps = 1
nnoremap <leader>gb :BCommits<CR>
nnoremap <leader>gx :Git blame<CR>
nnoremap <leader>gm :Gvdiffsplit!<CR>
nnoremap <leader>gh :GBrowse<CR>
nnoremap <leader>gt :!gitui<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => git-gutter [git diff]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gitgutter_enabled=0
let g:gitgutter_map_keys = 0
nnoremap <silent> <leader>gd :GitGutterToggle<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ultisnippets [used by FZF.vim]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsSnippetStorageDirectoryForUltiSnipsEdit='~/.vim_runtime/snippets-custom'
let g:UltiSnipsSnippetDirectories=['~/.vim_runtime/snippets-custom']
let g:UltiSnipsEditSplit='vertical'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => gutentags-plus
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gutentags_plus_nomap = 1
let g:gutentags_enabled = 1
let g:gutentags_resolve_symlinks = 1
let g:gutentags_cache_dir = expand('~/.cache/vim/tags')
"let g:gutentags_add_default_project_roots = ['.git', '.hg', '.svn', '.bzr', '_darcs', '_darcs', '_FOSSIL_', '.fslckout']


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => markdown-preview
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Markdown previwer
"nnoremap <C-n> :silent !markdown_previewer %<CR>:redraw!<CR>

" Pandoc
"nnoremap <C-m> :silent !pandoc % -f gfm -o /tmp/vim-pandoc.html<CR>:redraw!<CR>

" vim-grip
" let g:grip_on = 1
" let g:grip_default_map = 0
" let g:grip_disable_when_no_jobs = 0
"nnoremap <C-n> :GripStart<CR>:sleep 1<CR>:GripStop<CR>:redraw!<CR>

" coc-markdown_previewer
nnoremap <C-n> :CocCommand markdown-preview-enhanced.openPreview<CR>:redraw!<CR>

" Autosync activities to the cloud
autocmd BufWritePost *backlog.md silent! !~/tweaks/termux/activities-pc/upload-activities-async.sh <afile>
autocmd BufWritePost *notes.md silent! !~/tweaks/termux/activities-pc/upload-activities-async.sh <afile>
autocmd BufWritePost *todos.md silent! !~/tweaks/termux/activities-pc/upload-activities-async.sh <afile>
autocmd BufWritePost *today.md silent! !~/tweaks/termux/activities-pc/upload-activities-async.sh <afile>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => markdown-preview
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Configure Neural like so in Vimscript
let g:neural = {
\   'source': {
\       'openai': {
\           '',
\       },
\   },
\}
noremap <leader>gp :Neural 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => mindmap-preview
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <C-e> :CocCommand markmap.watch<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-autosave
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Save on lost focus/exit
autocmd FocusLost,VimLeavePre * silent! w

" Also, save once per minute if there are changes.
let g:autosave_seconds = 50
au BufRead,BufNewFile * let b:start_time=localtime()
au CursorHold * silent! call UpdateFile()
function! UpdateFile()
  if ((localtime() - b:start_time) >= g:autosave_seconds)
    let b:start_time=localtime()
   else
     echo 'Only ' . (localtime() - b:start_time) . ' seconds have elapsed so far.'
  endif
endfunction
au BufWritePre * let b:start_time=localtime()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-coc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Coc settings path
let g:coc_config_home = '~/.vim_runtime/vimrcs'

" Disable suggestions for markdown, as it lags too much.
autocmd FileType markdown let b:coc_suggest_disable = 1

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()


" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
inoremap <silent><expr> <c-@> coc#refresh()


" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
" Warning: Using gh instead of gs, overrides select mode.
nnoremap <silent> gh :call ShowDocumentation()<CR>


function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
" nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>ct  <Plug>(coc-format-selected)
nmap <leader>ct  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

" Applying codeAction to the selected region.
" Example: `<leader>ctap` for current paragraph
xmap <leader>cz  <Plug>(coc-codeaction-selected)
nmap <leader>cz  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ca  <Plug>(coc-codeaction)

" Mappings for CoCList
" Show all diagnostics.
nnoremap <leader>cd  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <leader>ce  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <leader>cc  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <leader>co  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <leader>ci  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <leader>cj  :<C-u>CocNext<cr>
" Do default action for previous item.
nnoremap <leader>ck  :<C-u>CocPrev<cr>
" Resume latest coc list.
nnoremap <leader>cp  :<C-u>CocListResume<CR>
" Apply AutoFix to problem on the current line.
nmap <leader>cf  <Plug>(coc-fix-current)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimspector - debugger
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" See ../vimspector_config to see the  per-lanuage settings.

let g:vimspector_base_dir=expand( '$HOME/.vim_runtime/vimspector_config' )
let g:vimspector_install_gadgets = [ 'CodeLLDB', 'netcoredbg', 'debugpy', 'vscode-node-debug2', 'vscode-firefox-debug', 'vscode-chrome-debug' ]
nmap <leader>dh <Plug>VimspectorContinue
nmap <leader>ds :VimspectorReset<cr>
nmap <leader>dr <Plug>VimspectorRestart
nmap <leader>db <Plug>VimspectorToggleBreakpoint
nmap <leader>dl <Plug>VimspectorToggleConditionalBreakpoint
nmap <leader>du <Plug>VimspectorAddFunctionBreakpoint
nmap <leader>dc <Plug>VimspectorRunToCursor
nmap <leader>dn <Plug>VimspectorStepOver
nmap <leader>d+ <Plug>VimspectorStepInto
nmap <leader>d- <Plug>VimspectorStepOut
nmap <leader>d< <Plug>VimspectorUpFrame
nmap <leader>d> <Plug>VimspectorDownFrame
" Normal and visual mode
nmap <leader>de <Plug>VimspectorBalloonEval
xmap <Leader>de <Plug>VimspectorBalloonEval


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-dispatch - compile/run [requires tmux]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" See: https://www.cs.oberlin.edu/~kuperman/help/vim/makefiles.html
" In your project directory, create a Makefile that build and run
" :cd /project_root

" Disable default keybindings
let g:dispatch_no_maps = 1

" defaults
nmap <leader>df :Make<cr>
nmap <leader>dj :echo 'You need to define a way of running this type of file in your vimrc'<cr>

" Per language
augroup run_programs
  " js/ts [Run page on firefox]
  autocmd Filetype javscript,typescript nnoremap <buffer> <leader>dj :Start firefox http://localhost:9999<cr>
  autocmd Filetype javscript,typescript nnoremap <buffer> <leader>df :echo "js/ts applications don't need to be compiled"<cr>

  " python [Run page on firefox]
  autocmd Filetype python nnoremap <buffer> <leader>dj :Start firefox http://localhost:9998<cr>
  autocmd Filetype python nnoremap <buffer> <leader>df :echo 'Assuming you are using django. You can change this behavior in your vimrc'<cr>
augroup END


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-test - test runner
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NOTE: Don't forget you must be runnning the project on terminal first.

" Strategy
let test#strategy = "dispatch"

" Defaults
nnoremap <buffer> <leader>dte :echo 'You must define a e2e tester for this file type in your vimrc'<cr>
nnoremap <buffer> <leader>dtu 'You must define a unit tester for this file type in your vimrc'<cr>
nnoremap <buffer> <leader>dtae :echo 'You must define a e2e tester for this file type in your vimrc'<cr>
nnoremap <buffer> <leader>dtau 'You must define a unit tester for this file type in your vimrc'<cr>


" Per language
augroup run_test
  " js/ts
  autocmd Filetype javascript,typescript nnoremap <buffer> <leader>dte :let test#javascript#runner = 'cypress'<cr>:TestNearest<cr>
  autocmd Filetype javascript,typescript nnoremap <buffer> <leader>dtu :let test#javascript#runner = 'jest'<cr>:TestNearest<cr>
  autocmd Filetype javascript,typescript nnoremap <buffer> <leader>dtae :let test#javascript#runner = 'cypress'<cr>:TestSuite<cr>
  autocmd Filetype javascript,typescript nnoremap <buffer> <leader>dtau :let test#javascript#runner = 'jest'<cr>:TestSuite<cr>

  " Python
  autocmd Filetype python nnoremap <buffer> <leader>dte :let test#python#runner = 'cypress'<cr>:TestNearest<cr>
  autocmd Filetype python nnoremap <buffer> <leader>dtu :let test#python#runner = 'pytest'<cr>:TestNearest<cr>
  autocmd Filetype python nnoremap <buffer> <leader>dtae :let test#python#runner = 'cypress'<cr>:TestSuite<cr>
  autocmd Filetype python nnoremap <buffer> <leader>dtau :let test#python#runner = 'pytest'<cr>:TestSuite<cr>
augroup END


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim doxygen
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" If you need rust support, please consider using 'cargo --doc'

" Enable for the next languages
let g:doxygen_include_filetypes = ['c', 'cpp', 'cs', 'python', 'd', 'fortran', 'java', 'perl', 'vhdl', 'objc', 'php']

" Enable the keybindings, for the included_filetypes
augroup doxygen_mappings
  for ft in g:doxygen_include_filetypes
    execute 'autocmd FileType ' . ft . ' nnoremap <buffer> <C-h> :<C-u>DoxygenOpen<CR>'
    "execute 'autocmd FileType ' . ft . ' nnoremap <buffer> <C-k> :<C-u>DoxygenRegen<CR>'
  endfor
augroup END


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim typedoc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" For this to work, you must install typedoc like
" sudo npm -g typedoc

" Enable for the next languages
let g:typedoc_include_filetypes = ['typescript']

" Enable the keybindings, for the included_filetypes
augroup typedoc_mappings
  for ft in g:typedoc_include_filetypes
    execute 'autocmd FileType ' . ft . ' nnoremap <buffer> <C-h> :<C-u>TypedocOpen<CR>'
    execute 'autocmd FileType ' . ft . ' nnoremap <buffer> <C-k> :<C-u>TypedocRegen<CR>'
  endfor
augroup END


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => lightline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
      \ 'colorscheme': 'tokyonight',
      \ 'active': {
      \   'left': [ ['mode', 'paste'],
      \             ['readonly', 'fileicon', 'filename', 'is_unsaved'],
      \             ['fugitive', 'gitdiff'] ],
      \   'right': [ ['lineinfo'], ['percent', 'coc_ok'], ['coc_info', 'coc_hints', 'coc_errors', 'coc_warnings'] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
      \   'is_unsaved': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': ' %{exists("*FugitiveHead")?FugitiveHead():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'is_unsaved': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*FugitiveHead") && ""!=FugitiveHead())'
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \   'cocstatus': 'coc#status',
      \   'filetype': 'MyFiletype',
      \   'fileicon': 'WebDevIconsGetFileTypeSymbol',
      \   'fileformat': 'MyFileformat',
      \ },
      \ 'component_expand': {
      \   'gitdiff': 'lightline#gitdiff#get',
      \ },
      \ 'separator': { 'left': ' ', 'right': ' ' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }


" Enalbe vim-lightline-coc
call lightline#coc#register()

" Enable gitdiff
let g:lightline#gitdiff#indicator_added = '+'
let g:lightline#gitdiff#indicator_deleted = '-'
let g:lightline#gitdiff#indicator_modified = '~'
let g:lightline#gitdiff#separator = ' '
let g:lightline#gitdiff#show_empty_indicators = 0

" Filename
function! LightlineFilename()
  return &filetype ==# 'vimfiler' ? vimfiler#get_status_string() :
        \ &filetype ==# 'unite' ? unite#get_status_string() :
        \ &filetype ==# 'vimshell' ? vimshell#get_status_string() :
        \ expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => which-key
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set timeoutlen=500
let g:mapleader = ","

"Lead
let g:lead_maps = {
  \'name': "Lead keymap",
  \'<CR>':    "Turn off        (highlights)",
  \'q':       "quit            (window)",
  \'e':       "edit            (vim settings)",
  \'f':       "open            (project buffer)",
  \'ñ':       "yankstack+      (paste older)",
  \'Ñ':       "yankstack-      (paste newer)",
  \'o':       "open            (recent buffer)",
  \'p':       "paste           (after space)",
  \'P':       "paste           (endline)",
  \'r':       "ranger          (open)",
  \'s':       "sessions        (fuzzy)",
  \'w':       "write",
  \'z':       "zen mode",
  \'a': {
    \'name': "[SEARCH/REPLACE]",
    \'b': "search in buffer (code)",
    \'s': "search in project (code)",
    \'r': "replace (in file)",
    \'R': "replace (in project)",
    \'c': "confirm (replace in project)",
    \'u': "undo  (replace in project)",
  \},
  \'c': {
    \'name': "[COC]",
    \'1': "which_key_ignore",
    \'2': "which_key_ignore",
  \},
  \'g': {
    \'name': "[GIT]",
    \'b': "buffer commits  (show)",
    \'d': "diff            (toggle)",
    \'h': "gitHub     (See file)",
    \'m': "mergetool  (local/merged/remote)",
    \'t': "gitui   (client)",
    \'p': "neural  (prompt)",
    \'x': "blame  (enable)",
  \},
  \'d': {
    \'name': "[DEBUGGER]",
    \'h': "start   (debugging)",
    \'s': "stop (debugging)",
    \'r': "restart (debugging w/ same config)",
    \'b': "toggle (breakpoint)",
    \'l': "toggle  (logpoint or conditional break)",
    \'u': "add  (fnc. breakpoint under cursor)",
    \'c': "go     (to cursor)",
    \'n': "step    (next)",
    \'+': "step+  (into function)",
    \'-': "step-  (out of function)",
    \'>': "move+  (current call stack)",
    \'<': "move-  (current call stack)",
    \'e': "eval (expression)",
    \'f': "run (makefile)",
    \'j': "run (program)",
    \'t': {
      \'name': "[TESTS]",
      \'e': "e2e test (this)",
      \'ae': "e2e tests (all)",
      \'u': "unit test(this) ",
      \'au': "unit tests (all) ",
    \}
  \},
  \'b': {
    \'name': "[BUFFER]",
    \'b':     "buffers (fuzzy list)",
    \'a':      "buffers all (delete)",
    \'d':      "buffer delete (delete)",
    \'g': {
      \'name': "[GOTO]",
      \'u':       "next buffer",
      \'p':       "prev buffer",
      \'a':       "buffer 4",
      \'s':       "buffer 3",
      \'h':       "buffer 2",
      \'t':       "buffer 1",
      \'g':       "buffer 5",
      \'y':       "buffer 0",
      \'n':       "buffer 6",
      \'e':       "buffer 7",
      \'o':       "buffer 8",
      \'i':       "buffer 9",
    \}
  \},
  \'h': {
    \'name': "[FAST]",
    \'s': "0",
    \'t': "50%",
    \'g': "75%",
  \},
  \'l': {
    \'name': "[LINE]",
      \'d':       "---  (line)",
      \'h':       "###  (line)",
      \'c':       "```  (block)",
  \},
  \'t': {
    \'name': "[TABS]",
  \},
\}
call which_key#register(',',"g:lead_maps")
nnoremap <silent> <leader>      :<c-u>WhichKey ','<CR>

"Ctrl
let g:ctrl_maps = {
  \'name': "CTRL keymap",
  \'i': "retrace forward",
  \'o': "retrace backwards",
  \'n': "markdown (preview)",
  \'e': "mindmap (preview)",
  \'ñ': "yank stack",
  \'j': "global yank",
  \'p': "global paste",
  \'r': "redo",
  \'t': "toggle (window)",
  \'v': "v-block",
  \'w': "window",
  \'w-=': "resize equally",
  \'w-r': "rotate",
  \'w-n': "h-split",
  \'w-v': "v-split",
\}
call which_key#register('<c>',"g:ctrl_maps")

" Shift can be mapped, but we are not using it because it's usually used by vim.

" Alt can be mapped, but we are not using it because it's usually used by tmux.

" All unmapped ctrl keys show help.
nnoremap <C-q>                  :<c-u>WhichKey '<c>'<CR>
nnoremap <C-y>                  :<c-u>WhichKey '<c>'<CR>
nnoremap <C-u>                  :<c-u>WhichKey '<c>'<CR>
nnoremap <C-a>                  :<c-u>WhichKey '<c>'<CR>
nnoremap <C-s>                  :<c-u>WhichKey '<c>'<CR>
nnoremap <C-d>                  :<c-u>WhichKey '<c>'<CR>
nnoremap <C-g>                  :<c-u>WhichKey '<c>'<CR>
nnoremap <C-l>                  :<c-u>WhichKey '<c>'<CR>
nnoremap <C-x>                  :<c-u>WhichKey '<c>'<CR>
nnoremap <C-c>                  :<c-u>WhichKey '<c>'<CR>
nnoremap <C-b>                  :<c-u>WhichKey '<c>'<CR>
"nnoremap <C-z>                  :<c-u>WhichKey '<c>'<CR> ← commenting this we
" allow suspending the vim process, can be resumed writing 'fg' on terminal.
" but it won't work in terminals running with exec.
