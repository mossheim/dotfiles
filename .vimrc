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
set cino+=L0:0g0N-st0
let g:brian_cpp_flags = '-Wall -Wpedantic -std=c++1z'

" C++ compiler warnings
let g:C_CFlags = g:brian_cpp_flags

" Doxygen highlighting
let g:load_doxygen_syntax=1

"""""""""""""""""""
" PYTHON CONFIG
"
let g:pymode_python = 'python3'       " syntax checking for python3
let g:pymode_options = 0              " turn off intrusive option changes introduced by pymode. typical...
let g:pymode_rope = 0                 " turn off rope script
let g:pymode_rope_complete_on_dot = 0 " turn off pymode rope
let g:pymode_rope_completion = 0      " turn off pymode rope already!

""""""""""""""""""""
" PATHOGEN BEGIN
execute pathogen#infect()

syntax on
syntax sync fromstart " parse from beginning to get accurate syntax highlighting
filetype plugin indent on

" Basic config settings
" colorscheme wombat256mod
set exrc " Force to source .vimrc if present in cwd
set secure " Adds security for non-main .vimrc
set colorcolumn=100 " Highlight 100th column
set textwidth=100
set is " yes incremental search
set nohls " no highlight search matches
set ignorecase smartcase
set tabstop=4
set softtabstop=4
set belloff=esc
set shiftwidth=4
set expandtab
set foldmethod=indent
set foldlevelstart=4 " start folding at 4 levels
set backspace=2 " make backspace work like most other apps
set formatoptions+=r
set noic " don't ignore case while searching (but do use smartcase)

set list listchars=space:·,trail:×,tab:→\ " listchars, including for tab
set showbreak=+++\ " line continuation begins with '+++ '

" colors
hi ColorColumn               ctermbg=224

hi SpecialKey                ctermfg=250

" Link char to string (o.w. linked to 'constant')
hi link Character String

" light style
hi Boolean                   ctermfg=DarkMagenta cterm=bold
hi Comment                   ctermfg=Grey        cterm=italic
hi Constant                  ctermfg=DarkMagenta cterm=bold
hi Define                    ctermfg=Blue        cterm=bold
hi Delimiter                 ctermfg=Black
hi Error                     ctermfg=Black       ctermbg=218
hi Function                  ctermfg=15          cterm=none
hi Identifier                ctermfg=Cyan        cterm=none
hi Include                   ctermfg=11
hi Number                    ctermfg=Blue
hi PreCondit                 ctermfg=11
hi PreProc                   ctermfg=11
hi SpecialComment            ctermfg=108         cterm=italic
hi Statement                 ctermfg=DarkMagenta cterm=bold
hi String                    ctermfg=Red
hi Title                     ctermfg=DarkBlue    cterm=bold
hi Todo                      ctermfg=DarkGrey    ctermbg=185
hi Type                      ctermfg=DarkGreen   cterm=bold

" swift
hi swiftTypeDefinition       ctermfg=1 cterm=bold

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
hi MatchParen                ctermbg=159         term=reverse
hi DiffText                  ctermbg=189         term=reverse
hi DiffChange                ctermbg=229         term=reverse
hi PmenuSel                  ctermbg=219

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

" insert date as YYYY-MM-DD
nnoremap <leader>td "=strftime("%Y-%m-%d")<CR>p
nnoremap <F4> "=strftime("%Y-%m-%d")<CR>p
vnoremap <F4> "=strftime("%Y-%m-%d")<CR>p
inoremap <F4> <C-R>=strftime("%Y-%m-%d")<CR>

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

" insert date as YYYY-MM-DD HH:MM:SS zone-offset
nnoremap <leader>tld "=strftime('%Y-%m-%d %H:%M:%S %z')<CR>p

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
  inoremap #u #undef<space>
  inoremap uns; using namespace std;<CR>
endfunction

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

" vim-dispatch
map <F9> :Dispatch<CR>

nmap <F3> @:

" fugitive
map <leader>gu :!git pull<CR>
map <leader>gp :Dispatch! git push<CR>
map <leader>gP :Dispatch! git br \| grep \* \| sed "s/[\* ]*//" \| xargs git push -u origin<CR>
map <leader>gc :Gcommit -m ""<left>
map <leader>gC :Gcommit -am ""<left>
map <leader>gc :Gcommit -m ""<left>
" write first to avoid common mistake
map <leader>ga :w<CR>:!git ap<CR>
map <leader>gA :!git add<space>
map <leader>gH :!git ch -b<space>
map <leader>gb :!git br<CR>
map <leader>gh :!git ch<space>
map <leader>gM :!git ch master<CR>
map <leader>gl :!git lg<CR>
map <leader>gs :Gstatus<CR>
map <leader>gr :!git reset<CR>
map <leader>gR :!git reset --hard<CR>
map <leader>gm :!git merge<space>
map <leader>gt :!git tag -a<space>

" config for vim-airline
let g:airline_section_x = ''
let g:airline_section_y = ''
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_skip_empty_sections = 1
let g:airline_theme='papercolor'

" config for ctrl-p
let g:ctrlp_max_depth = 6 " to avoid bloating search time when in a non-git directory
let g:ctrlp_show_hidden = 0 " show hidden files (dotfiles)
let g:ctrlp_open_multiple_files = '2vjr' " open at most 2 tabs when opening multiple files
let g:ctrlp_open_single_match = ['buffer tags', 'buffer']

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
    au FileType swift,yaml,c,cpp,h,hpp,cc,hh,cxx,java,php autocmd BufWritePre <buffer> %s/\s\+$//e
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
nnoremap <leader>u= Yp0v$r=
nnoremap <leader>u- Yp0v$r-
