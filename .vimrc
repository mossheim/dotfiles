" main .vimrc
" Brian Heim, Author
" 2017

" Basic config settings
" colorscheme wombat256mod
set exrc " Force to source .vimrc if present in cwd
set secure " Adds security for non-main .vimrc
set colorcolumn=100 " Highlight 100th column
set textwidth=100
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set foldmethod=syntax
set foldlevelstart=4 " start folding at 4 levels
set backspace=2 " make backspace work like most other apps

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

" For YCM
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

let g:ycm_enable_diagnostic_signs = 0             " gutter signs: they annoy me
let g:ycm_enable_diagnostic_highlighting = 1      " highlighting: reasonably better
let g:ycm_always_populate_location_list = 1       " default 0
let g:ycm_open_loclist_on_ycm_diags = 1           " default 1

let g:ycm_allow_changing_updatetime = 0           " default 1; wait longer before updating

let g:ycm_complete_in_strings = 1                 " default 1
let g:ycm_collect_identifiers_from_tags_files = 1 " default 0
let g:ycm_path_to_python_interpreter = ''         " default ''

let g:ycm_server_use_vim_stdout = 0               " default 0 (logging to console)
let g:ycm_log_level = 'error'                     " default info

let g:ycm_confirm_extra_conf = 0

" C++ compiler warnings
let g:C_CFlags = g:brian_cpp_flags

" Doxygen highlighting
let g:load_doxygen_syntax=1

"""""""""""""""""""
" PYTHON CONFIG
"
let g:pymode_python = 'python3' " syntax checking for python3
let g:pymode_options = 0 " turn off intrusive option changes introduced by pymode. typical...

""""""""""""""""""""
" PATHOGEN BEGIN
execute pathogen#infect()
syntax on
filetype plugin indent on

" colors
hi Folded ctermfg=LightGrey
hi cComment ctermfg=Grey
hi Comment ctermfg=Grey
hi Error ctermbg=9 ctermfg=White
hi String ctermfg=Red

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

" moving between errors (YCM)
map <leader>n :lnext<CR>
map <leader>p :lprev<CR>

" shortcut for editing vimrc
map <leader>ev :e ~/.vimrc<CR>

" insert date as YYYY-MM-DD
nnoremap <leader>td "=strftime("%Y-%m-%d")<CR>p
nnoremap <F4> "=strftime("%Y-%m-%d")<CR>p
inoremap <F4> <C-R>=strftime("%Y-%m-%d")<CR>

" insert date as YYYY-MM-DD HH:MM:SS zone-offset
nnoremap <leader>tld "=strftime('%Y-%m-%d %H:%M:%S %z')<CR>p

" mappings for cpp files
augroup filetype_cpp
    au!
    au FileType cpp map <leader>cc  : !g++ -Wall -Wpedantic -std=c++1z % -o %< && ./%< <CR>
    au FileType cpp map <leader>cmc : !cd build && cmake .. && cd ..<CR>
    au FileType cpp map <leader>cmb : !cmake --build ./build <CR>
    au FileType cpp map <leader>cmi : !cmake --build ./build --target install <CR>
augroup END

" mappings for swift files, for use with spm
augroup filetype_swift
    au!
    au FileType swift map <leader>b :!swift build<CR>
    " TODO: mapping for ./build/debug/x
augroup END

" Apply YCM FixIt
map <F8> :YcmCompleter FixIt<CR>

" vim-dispatch
map <F9> :Dispatch<CR>

nmap <F3> @:

" fugitive
map <leader>gu :!git pull<CR>
map <leader>gp :Dispatch! git push<CR>
map <leader>gc :Gcommit -m ""<left>
" write first to avoid common mistake
map <leader>ga :w<CR>:!git ap<CR>
map <leader>gh :!git ch -b<space>
map <leader>gb :!git br<CR>
map <leader>gk :!git ch<space>
map <leader>gl :!git lg<CR>
map <leader>gs :Gstatus<CR>
map <leader>gr :!git reset<CR>

" config for vim-airline
let g:airline_section_x = ''
let g:airline_section_y = ''
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_skip_empty_sections = 1

" config for ctrl-p
let g:ctrlp_max_depth = 6 " to avoid bloating search time when in a non-git directory
let g:ctrlp_max_files = 2000 " to avoid bloating search time when in a non-git directory
let g:ctrlp_open_multiple_files = '2vjr' " open at most 2 tabs when opening multiple files
let g:ctrlp_open_single_match = ['buffer tags', 'buffer']

" auto-reload vimrc on write
augroup myvimrchooks
    au!
    autocmd bufwritepost .vimrc source ~/.vimrc
augroup END

""""""""""""""""""""""""""""""""""""""""
" filetype things
"
" strip trailing whitespace on save
augroup trailing_whitespace
    au!
    au FileType swift,vim,yaml,c,cpp,h,hpp,cc,hh,cxx,java,php autocmd BufWritePre <buffer> %s/\s\+$//e
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
