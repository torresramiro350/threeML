let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/threeML
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +49 ~/threeML/threeML/minimizer/ROOT_minimizer.py
badd +74 ~/threeML/threeML/config/config_structure.py
argglobal
%argdel
edit ~/threeML/threeML/config/config_structure.py
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 119 + 119) / 239)
exe 'vert 2resize ' . ((&columns * 119 + 119) / 239)
argglobal
balt ~/threeML/threeML/minimizer/ROOT_minimizer.py
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
13,18fold
22,28fold
32,35fold
39,43fold
60,64fold
65,68fold
83,85fold
86,87fold
let &fdl = &fdl
let s:l = 71 - ((31 * winheight(0) + 30) / 60)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 71
normal! 07|
wincmd w
argglobal
if bufexists(fnamemodify("~/threeML/threeML/minimizer/ROOT_minimizer.py", ":p")) | buffer ~/threeML/threeML/minimizer/ROOT_minimizer.py | else | edit ~/threeML/threeML/minimizer/ROOT_minimizer.py | endif
if &buftype ==# 'terminal'
  silent file ~/threeML/threeML/minimizer/ROOT_minimizer.py
endif
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
8,12fold
20,26fold
33,37fold
48,56fold
81,82fold
91,92fold
90,92fold
113,115fold
119,121fold
125,127fold
131,133fold
116,137fold
113,137fold
84,137fold
149,152fold
155,159fold
148,159fold
144,161fold
167,169fold
139,171fold
187,190fold
184,190fold
197,198fold
196,198fold
173,200fold
207,213fold
202,219fold
78,219fold
let &fdl = &fdl
let s:l = 42 - ((11 * winheight(0) + 30) / 60)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 42
normal! 0
wincmd w
exe 'vert 1resize ' . ((&columns * 119 + 119) / 239)
exe 'vert 2resize ' . ((&columns * 119 + 119) / 239)
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
