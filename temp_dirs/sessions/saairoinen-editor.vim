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
edit workspaces/mediapackage/saarioinen/backend/backend/application/views.py
argglobal
balt workspaces/mediapackage/saarioinen/backend/backend/application/views.py
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 1 - ((0 * winheight(0) + 33) / 66)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 0
tabnext 1
badd +0 workspaces/mediapackage/saarioinen/backend/backend/application/views.py
badd +1 \[BufExplorer]
badd +9 workspaces/mediapackage/saarioinen/backend/backend/application/serializers.py
badd +275 .vim_runtime/my_plugins/vim-gutentags-master/doc/gutentags.txt
badd +342 .vim_runtime/vimrcs/plugins_config.vim
badd +5 workspaces/mediapackage/saarioinen/frontend/src/components/Gallery.vue
badd +186 workspaces/mediapackage/saarioinen/frontend/src/components/Editor.vue
badd +27 workspaces/mediapackage/saarioinen/frontend/src/App.vue
badd +42 workspaces/mediapackage/saarioinen/frontend/src/components/TitleBar.vue
badd +12 .vim_runtime/my_configs.vim
badd +1 keymap_spanish.h
badd +1 workspaces/mediapackage/saarioinen/Dockerfile
badd +58 workspaces/mediapackage/elonen/Dockerfile
badd +37 workspaces/mediapackage/saarioinen/backend/config/local.py
badd +1 workspaces/mediapackage/saarioinen/backend/.env-dev
badd +10 workspaces/mediapackage/saarioinen/backend/docker-compose.yml
badd +36 workspaces/mediapackage/elonen/backend/config/local.py
badd +12 workspaces/mediapackage/saarioinen/README.md
badd +26 workspaces/mediapackage/saarioinen/makefile
badd +1 workspaces/mediapackage/elonen/backend/docker-compose.yml
badd +21 workspaces/mediapackage/saarioinen/backend/backend/application/migrations/0001_initial.py
badd +1 workspaces/mediapackage/saarioinen/backend/backend/application/migrations/0011_add_anonymized_field_order.py
badd +35 workspaces/mediapackage/saarioinen/backend/backend/users/models.py
badd +32 workspaces/mediapackage/saarioinen/backend/backend/urls.py
badd +21 workspaces/mediapackage/saarioinen/backend/compose/django/gunicorn.sh
badd +37 workspaces/mediapackage/elonen/backend/k8s/deployment.yaml
badd +1 workspaces/mediapackage/saarioinen/frontend/.gitignore
badd +1 workspaces/mediapackage/saarioinen2/.gitignore
badd +1 workspaces/mediapackage/saarioinen2/Dockerfile
badd +1 workspaces/mediapackage/saarioinen2/makefile
badd +1 workspaces/mediapackage/saarioinen2/README.md
badd +26 workspaces/mediapackage/saarioinen/.gitignore
badd +1 workspaces/mediapackage/saarioinen2/backend
badd +1 workspaces/mediapackage/saarioinen2/frontend
badd +1 workspaces/mediapackage/saarioinen2/tags
badd +518 .config/i3/config
badd +1 .vim_runtime/temp_dirs/sessions/meta-backlogs.vim
badd +34 activity-backlogs/mediapackage/saarionen.bl
badd +41 workspaces/mediapackage/saarioinen/frontend/src/components/NavBar.vue
badd +6 workspaces/mediapackage/saarioinen/frontend/src/main.js
badd +1 buffer
badd +250 workspaces/mediapackage/saarioinen/backend/config/common.py
badd +8 workspaces/mediapackage/saarioinen/backend/backend/users/admin.py
badd +1 workspaces/mediapackage/elonen/backend/backend/users/__init__.py
badd +1 buffer.md
badd +48 workspaces/mediapackage/elonen/backend/backend/application/views.py
badd +2 workspaces/mediapackage/saarioinen/frontend/vue.config.js
badd +33 workspaces/mediapackage/saarioinen/backend/requirements/base.txt
badd +1 workspaces/mediapackage/saarioinen/backend/config/staging.py
badd +29 workspaces/mediapackage/saarioinen/backend/config/production.py
badd +1 workspaces/mediapackage/saarioinen/backend/dist/index.html
badd +14 workspaces/mediapackage/saarioinen/backend/backend/application/models.py
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
