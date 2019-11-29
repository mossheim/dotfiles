" main .vimrc
" Brian Heim, Author
" 2017

" Use (real) tabs of 4 on SuperCollider files
augroup filetype_sc
    au!
    au BufRead,BufNewFile *.sc set tabstop=4
    au BufRead,BufNewFile *.sc set softtabstop=4
    au BufRead,BufNewFile *.sc set shiftwidth=4
    au BufRead,BufNewFile *.sc set noexpandtab
augroup END

" automatically reload files that have changed externally
set autoread

" C++ indentation rules
set cino+=L0:0g0N-st0(1s
let g:brian_cpp_flags = '-Wall -Wpedantic -std=c++1z'

" C++ compiler warnings
let g:C_CFlags = g:brian_cpp_flags

" Doxygen highlighting
let g:load_doxygen_syntax=1

" utl.vim settings
let g:utl_cfg_hdl_scm_http_system = "silent !open -a Firefox '%u'"
let g:utl_cfg_hdl_scm_http=g:utl_cfg_hdl_scm_http_system

" vim-orgmode settings
let g:org_agenda_files=['~/org/*.org']

"""""""""""""""""""
" PYTHON CONFIG
"
let g:pymode_python = 'python3'       " syntax checking for python3
let g:pymode_options = 0              " turn off intrusive option changes introduced by pymode. typical...
let g:pymode_rope = 0                 " turn off rope script
let g:pymode_rope_complete_on_dot = 0 " turn off pymode rope
let g:pymode_rope_completion = 0      " turn off pymode rope already!

let maplocalleader=' '

""""""""""""""""""""
" PATHOGEN BEGIN
execute pathogen#infect()

packadd! matchit

syntax on
syntax sync fromstart " parse from beginning to get accurate syntax highlighting
filetype plugin indent on

" Basic config settings
" colorscheme wombat256mod
set exrc " Force to source .vimrc if present in cwd
set secure " Adds security for non-main .vimrc
set colorcolumn=120 " Highlight 100th column
set textwidth=120
set is " yes incremental search
set nohls " no highlight search matches
set ignorecase smartcase
set tabstop=4
set softtabstop=4
set belloff=esc
set shiftwidth=4
set expandtab
set foldmethod=manual
set foldlevelstart=4 " start folding at 4 levels
set foldopen-=search
set foldopen-=block
set backspace=2 " make backspace work like most other apps
set formatoptions+=r
set cursorline

set list listchars=space:·,trail:×,tab:→\ " listchars, including for tab
set showbreak=+++\ " line continuation begins with '+++ '

set diffopt+=algorithm:patience
set diffopt+=indent-heuristic

set lazyredraw " makes macros so much faster

" Link char to string (o.w. linked to 'constant')
hi link Character String

" light style
hi Boolean                   ctermfg=11          cterm=NONE
hi Comment                   ctermfg=Grey        cterm=italic
hi Constant                  ctermfg=11          cterm=NONE
hi Define                    ctermfg=Blue        cterm=bold
hi Delimiter                 ctermfg=Black
hi Error                     ctermfg=Black       ctermbg=218
hi Function                  ctermfg=15          cterm=none
hi Identifier                ctermfg=Cyan        cterm=none
hi Include                   ctermfg=DarkMagenta
hi Number                    ctermfg=Blue
hi PreCondit                 ctermfg=DarkMagenta
hi PreProc                   ctermfg=White
hi SpecialComment            ctermfg=108         cterm=italic
hi Statement                 ctermfg=11          cterm=NONE
hi String                    ctermfg=Red
hi Title                     ctermfg=DarkBlue    cterm=bold
hi Todo                      ctermfg=DarkGrey    ctermbg=185
hi Type                      ctermfg=Blue        cterm=NONE

" swift
hi swiftTypeDefinition       ctermfg=1           cterm=bold

" markdown
hi markdownCode              ctermfg=Cyan

" doxygen
hi doxygenSpecialOneLineDesc ctermfg=109         cterm=none
hi doxygenKeyword            ctermfg=109         cterm=bold
hi doxygenBrief              ctermfg=109         cterm=bold
hi doxygenBody               ctermfg=109         cterm=bold
hi doxygenSpecial            ctermfg=109         cterm=bold

" vim-specific
hi Directory                 ctermfg=57
hi ErrorMsg                  ctermfg=Black       ctermbg=218
hi MoreMsg                   ctermfg=70
hi Question                  ctermfg=70
hi WarningMsg                ctermfg=Black       ctermbg=LightRed
hi Visual                    ctermbg=255         term=reverse
hi MatchParen                ctermbg=117         term=reverse
hi DiffText                  ctermbg=189         term=reverse
hi DiffChange                ctermbg=229         term=reverse
hi PmenuSel                  ctermbg=219
hi Folded                    ctermbg=255         ctermfg=246

hi CursorLine                ctermbg=230         cterm=none

hi DiffAdd                   ctermbg=193  term=bold    guibg=LightBlue    cterm=bold
hi DiffChange                ctermbg=229 term=reverse guibg=LightMagenta
hi DiffDelete                ctermfg=196 ctermbg=224  guibg=LightCyan    term=bold  guifg=Blue gui=bold
hi DiffText                  ctermbg=195 guibg=Red    term=reverse       gui=bold

" colors
hi ColorColumn               ctermbg=224

hi SpecialKey                ctermfg=253

" orgmode
hi link org_heading1 Title
hi link org_heading2 Constant
hi link org_heading3 Type
hi link org_heading4 String
hi link org_heading5 PreProc
hi link org_heading6 Identifier
hi link org_heading7 Special
hi org_todo_keyword_DONE ctermfg=64 ctermbg=194

if $SOLARIZED == 'DARK'
    hi ColorColumn               ctermbg=59
    hi CursorLine                ctermbg=53         cterm=none
    hi SpecialKey                ctermfg=238
endif

" ---- Splits ----
" resize splits when windows are resized
autocmd VimResized * wincmd =

" Disable directional keys
map  <up>    <nop>
map  <down>  <nop>
map  <left>  <nop>
map  <right> <nop>
imap <up>    <nop>
imap <down>  <nop>
imap <left>  <nop>
imap <right> <nop>

" SPACE as leader
nnoremap <Space> <nop>
let mapleader="\<space>"

" moving between panes
map <leader>h <C-w>h
map <leader>j <C-w>j
map <leader>k <C-w>k
map <leader>l <C-w>l

" moving between errors
map <leader>n :lnext<CR>
map <leader>p :lprev<CR>

" shortcut for editing vimrc
map <leader>ev :e ~/.vimrc<CR>

" edit prev buffer & delete current
map <leader>dc <C-^>:bd #<CR>

" insert date as YYYY-MM-DD
nnoremap <leader>td "=strftime("%Y-%m-%d")<CR>p
nnoremap <F4> "=strftime("%Y-%m-%d")<CR>p
vnoremap <F4> "=strftime("%Y-%m-%d")<CR>p
inoremap <F4> <C-R>=strftime("%Y-%m-%d")<CR>
inoremap <F5> Brian Heim <C-R>=strftime("%Y-%m-%d")<CR>

" insert date as YYYY-MM-DD HH:MM:SS zone-offset
nnoremap <leader>tld "=strftime('%Y-%m-%d %H:%M:%S %z')<CR>p

function! SynStack()
    for id in synstack(line("."), col("."))
        echo synIDattr(id, "name")
    endfor
endfunction

map <F12> :call SynStack()<CR>

" reveal syntax highlighting state of object under cursor
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" taken from Saleem Abdulrasool (compnerd)
function! s:CLangShortcuts()
  inoremap #in #include<space>
  inoremap #ifn #ifndef<space>
  inoremap #ifd #ifdef<space>
  inoremap #d #define<space>
  inoremap #els #else
  inoremap #eli #elif<space>
  inoremap #en #endif
  inoremap #p #pragma<space>
  inoremap #o #pragma once
  inoremap #u #undef<space>
  inoremap uns; using namespace std;<CR>
endfunction

" recognize .config files as xml
autocmd BufRead,BufNewFile *.config set filetype=xml

" mappings for cpp files
augroup filetype_cpp
    au!
    au FileType cpp map <leader>cc  : !g++ -Wall -Wpedantic -std=c++1z % -o %< && ./%< <CR>
    au FileType cpp map <leader>cmc : !cd build && cmake .. && cd ..<CR>
    au FileType cpp map <leader>cmb : !cmake --build ./build <CR>
    au FileType cpp map <leader>cmi : !cmake --build ./build --target install <CR>
    au FileType cpp,c execute s:CLangShortcuts()
augroup END

" mappings for swift files, for use with spm
augroup filetype_swift
    au!
    au FileType swift map <leader>b  :!swift build<CR>
    au FileType swift map <leader>tt :!swift test<CR>
    au FileType swift map <leader>tp :!swift test --parallel<CR>
    " TODO: mapping for ./build/debug/x
augroup END

" mappings for git commit files (turn spellcheck on!)
augroup filetype_gitcommit
    au!
    au FileType gitcommit set spell
augroup END

" vim-dispatch
map <F9> :Dispatch<CR>

nmap <F3> @:

" fugitive
map <leader>gu :!git pull<CR>
map <leader>gp :Dispatch! git push origin<CR>
" use with care...
map <leader>gFP :Dispatch! git push origin --force<CR>
map <leader>gP :Dispatch! git branch \| grep \* \| sed "s/[\* ]*//" \| xargs git push -u origin<CR>
map <leader>gcc :Gcommit -m ""<left>
map <leader>gcf :!git commit --fixup<space>
map <leader>gcs :!git commit --squash<space>
map <leader>gC :Gcommit -am ""<left>
" view staged changes
map <leader>gd :!git diff --cached<CR>
" I use it more like "emend"
map <leader>ge :Gcommit --amend<CR>
" write first to avoid common mistake
map <leader>ga :w<CR>:!git add -p<CR>
map <leader>gA :!git add<space>
map <leader>gH :!git checkout -b<space>
map <leader>gb :!git branch<CR>
map <leader>gh :!git checkout<space>
map <leader>gl :!git log --oneline --graph --decorate<CR>
map <leader>gL :!git log --branches --remotes --tags --oneline --graph --decorate<CR>
map <leader>gs :!git status -sb<CR>
map <leader>gS :Gstatus<CR>
map <leader>gr :!git reset<CR>
map <leader>gR :!git reset --hard<CR>
map <leader>gm :!git merge<space>
map <leader>gt :!git tag -a<space>
map <leader>gi :!git rebase -i<CR>
map <leader>gf :!git clang-format -fq<CR><CR>

" ripgrep
map <leader>rg :!rg ""<left>
map <leader>rw "tyiw:!rg "<C-R>t"<CR>
map <leader>rW "tyiW:!rg "<C-R>t"<CR>
vmap <leader>rv "ty:!rg "<C-R>t"<CR>

" typedef to using
nmap <leader>t2u :%s/typedef \+\(.\+\) \+\(\w\+\);/using \2 = \1;<CR>

" comment TODO
nmap <leader>ctd I// <Esc>A TODO<Esc>

" config for vim-airline
let g:airline_section_x = ''
let g:airline_section_y = ''
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_skip_empty_sections = 1
let g:airline_theme='papercolor'

" config for ctrl-p
let g:ctrlp_max_depth = 7 " to avoid bloating search time when in a non-git directory
let g:ctrlp_show_hidden = 1 " show hidden files (dotfiles)
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/](\.git|CMakeFiles)$',
    \ 'file': '\v(\.gitignore|.*\.swp)$'
    \ }
let g:ctrlp_open_multiple_files = '3vjr' " open at most this many tabs when opening multiple files
let g:ctrlp_open_single_match = ['buffer tags', 'buffer']
let g:ctrlp_switch_buffer = ''

" auto-reload vimrc on write
augroup myvimrchooks
    au!
    autocmd bufwritepost .vimrc source ~/.vimrc | AirlineRefresh
augroup END

""""""""""""""""""""""""""""""""""""""""
" filetype things
"
" strip trailing whitespace on save
augroup trailing_whitespace
    au!
    "au FileType sml,swift,yaml,c,cpp,h,hpp,cc,hh,cxx,java,php autocmd BufWritePre <buffer> %s/\s\+$//e
augroup END

" set dispatch command for latex files
augroup filetype_tex
    au!
    au FileType tex let b:dispatch = 'pdflatex %'
augroup END

""""""""""""""""""""""""""""""""""""""""
" selected templates & mappings from c-support by wolfgang mehner
"
" block completion (good cross-language)
inoremap  {<CR>    {<CR>}<Esc>O
vnoremap  {<CR>   S{<CR>}<Esc>Pk=iB
inoremap  [<CR>    [<CR>]<Esc>O
vnoremap  [<CR>   S[<CR>]<Esc>Pk=iB
inoremap  (<CR>    (<CR>)<Esc>O
vnoremap  (<CR>   S(<CR>)<Esc>Pk=iB
" for C++ classes/structs
inoremap  {;<CR>   {<CR>};<Esc>O

augroup filetype_python
    au!
    au FileType python inoremap '''<CR>  '''<CR>'''<Esc>O
    au FileType python inoremap """<CR>  """<CR>"""<Esc>O
    au FileType python inoremap '''<Space>  '''<Space><Space>'''<Esc>Bhi
    au FileType python inoremap """<Space>  """<Space><Space>"""<Esc>Bhi
    au FileType python nnoremap <leader>' i'''<CR>'''<Esc>O
    au FileType python nnoremap <leader>" i"""<CR>"""<Esc>O
    au FileType python nnoremap <leader>nem iif __name__ == "__main__":<CR>
augroup END

" underlines current line with ='s or -'s
nnoremap <leader>u= Yp0v$r=k
nnoremap <leader>u- Yp0v$r-k

" moves current arg in a param list to back of the list

" this version shifts the current parameter one right without modifying whitespace
" assumes no [](){}, in the parameter list
nnoremap <leader>sl ?[(,{[]<CR>wvf,geyf,wv/[,)}\]]<CR>gepF,?[(,{[]<CR>wvf,gep

" this version assumes there is no whitespace around the parameters except after the comma
" assumes no [](){}, in the parameter list
nnoremap <leader>sL ?[(,{[]<CR>lvt,d2lv/[,)}\]]<CR>pF,P

" this version rotates all parameters left and puts the leftmost parameter at the end
" assumes (abc, def) whitespacing
" is ok with ()[]{} in parameter list as long as % catches it fine, but not ,
nnoremap <leader>sb %ldt,wv%%hp%p

" same thing, but all parameters right
nnoremap <leader>sf %lv%%F,hdwv%%hp%p

" try it out:
" (b, a)
" (cd  , ab )
" (5 + 8(), george* 7)
" (abc, def, geh, ijkl)
" (ab, cd)
" (b, a, c)
" {c, a, b}

" tags
nnoremap <leader>mt :Dispatch! ctags -R src<CR>
nnoremap <leader>[ :tprev<CR>
nnoremap <leader>] :tnext<CR>

nnoremap <leader>, :cprev<CR>zz
nnoremap <leader>. :cnext<CR>zz

" get italics
set t_ZH=[3m
set t_ZR=[23m

" toggle listchars
nnoremap <F8> :set list!<CR>

" fix common mistake
inoremap :; ::

" helper function -- if buffer exists, switch to it, otherwise edit it
" Added this because otherwise using :e means we lose previous position in file.
function! SwitchToOrEdit(bufname)
    let bnr = bufnr(a:bufname)
    if bnr > 0
        :exe 'b ' . bnr
    else
        :exe 'e ' . a:bufname
    endif
endfunction

" "Edit Cpp"/"Edit Header"
" Switches to .cpp/.h version of current file. If already in header/cpp, don't switch.
nnoremap <leader>ec q:icall SwitchToOrEdit("<C-r>#<Esc>:s/\.h$/.cpp/e<CR>A")<CR>
nnoremap <leader>eh q:icall SwitchToOrEdit("<C-r>#<Esc>:s/\.cpp$/.h/e<CR>A")<CR>

" Update Signature In Header
"
" This will take the signature of the function on the current line and update the
" corresponding declaration in the header.
"
" Assumes:
" - using this from a .cpp file
" - If file is foo.cpp, header is foo.h
" - Signature is on one line in both definition and declaration
" - Declaration in header is indented by >=4 spaces
"
" Caveats:
" - clobbers buffer b
" - only updates whatever is on the same line as the function name (i.e. maybe not template params etc.)
" - will jump to first func with same name in header
"
" Possible improvements -- jump to class first in case some other class in the header also has the same function?
nmap <leader>usih :w<CR>yy ehggpA;<Esc>:s/\(\w\+::\)\+/<CR>f(b"byiwdd/    \(\w\\|:\)\+ <C-r>b(.*).*;$<CR>pkdwjPkdd:w<CR><C-^>

" Update Signature In Cpp
"
" This will take the signature of the function on the current line and update the
" corresponding definition in the cpp file.
"
" Assumes:
" - using this from a .h file
" - If file is foo.h, impl is foo.cpp
" - Signature is on one line in both definition and declaration
"
" Caveats:
" - clobbers buffers b and c
" - clobbers mark z
" - only updates whatever is on the same line as the function name (i.e. maybe not template params etc.)
" - will jump to first func with same class::name in cpp file
nmap <leader>usic mz:w<CR>"byy?^ *class<CR>k/class<CR>w"cyiw ecgg"bpf(B"cPa::<Esc>$x0dwf(B"byt("cyydd/<C-r>b<CR>Vp:w<CR><C-^>'z

" Paste Signature In Header
"
" If you have just yanked a function signature, pastes and formats it for the header.
"
" Assumes:
" - function signature is single line
nnoremap <leader>psih p==A;<Esc>0f(F:dBx:w<CR>
