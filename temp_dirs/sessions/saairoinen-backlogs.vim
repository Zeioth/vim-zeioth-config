let SessionLoad = 1
if &cp | set nocp | endif
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
argglobal
%argdel
$argadd \[BufExplorer]
edit ~/activity-backlogs/meta/productivity-todos.md
argglobal
balt activity-backlogs/mediapackage/saarionen.bl
setlocal fdm=expr
setlocal fde=pandoc#folding#FoldExpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=2
setlocal fml=1
setlocal fdn=10
setlocal nofen
let s:l = 1916 - ((29 * winheight(0) + 24) / 48)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1916
normal! 0
tabnext 1
badd +316 activity-backlogs/mediapackage/saarionen.bl
badd +1 \[BufExplorer]
badd +19 .vim_runtime/vimrcs/plugins_config.vim
badd +78 buffer
badd +1 activity-backlogs/mediapackage/saarionen-chocolate.bl
badd +25 workspaces/mediapackage/saarioinen/backend/backend/application/views.py
badd +93 .vim_runtime/my_configs.vim
badd +80 workspaces/git-forks/qmk_firmware/keyboards/crkbd/keymaps/default/README.md
badd +587 workspaces/git-forks/qmk_firmware/keyboards/crkbd/keymaps/default/keymap.c
badd +0 ~/activity-backlogs/meta/productivity-todos.md
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToOScI
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
nohlsearch
let g:this_session = v:this_session
let g:this_obsession = v:this_session
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
