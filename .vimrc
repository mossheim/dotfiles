" main .vimrc
" Brian Heim, Author
" 2017

" Basic config settings
" colorscheme wombat256mod
set exrc " Force to source .vimrc if present in cwd
set secure " Adds security for non-main .vimrc
set colorcolumn=100 " Highlight 90th column
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set foldmethod=syntax
set foldlevelstart=4 " start folding at 4 levels

" colors
hi Folded ctermfg=LightGrey
hi CComment ctermfg=Grey

" Use (real) tabs of 4 on SuperCollider files
autocmd BufRead,BufNewFile *.sc set tabstop=4
autocmd BufRead,BufNewFile *.sc set softtabstop=4
autocmd BufRead,BufNewFile *.sc set shiftwidth=4
autocmd BufRead,BufNewFile *.sc set noexpandtab

" automatically reload files that have changed externally
set autoread

" C++ indentation rules
set cino+=L0:0g0N-st0
let g:brian_cpp_flags = '-Wall -Wpedantic -std=c++1z'

" For YCM

"YCM will put icons in Vim's gutter on lines that have a diagnostic set.
"Turning this off will also turn off the YcmErrorLine and YcmWarningLine
"highlighting
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_always_populate_location_list = 1 "default 0
let g:ycm_open_loclist_on_ycm_diags = 1 "default 1


let g:ycm_complete_in_strings = 1 "default 1
let g:ycm_collect_identifiers_from_tags_files = 1 "default 0
let g:ycm_path_to_python_interpreter = '' "default ''
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

let g:ycm_server_use_vim_stdout = 0 "default 0 (logging to console)
let g:ycm_server_log_level = 'debug' "default info

let g:ycm_confirm_extra_conf = 0

" For C++ highlighting
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1

" C++ compiler warnings
let g:C_CFlags = g:brian_cpp_flags

" Doxygen highlighting
let g:load_doxygen_syntax=1

" Syntastic settings
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_always_populate_loc_list = 1 " always populate the list of errors
" let g:syntastic_auto_loc_list = 1 " autopop the list
" let g:syntastic_check_on_open = 1 " check when opening
" let g:syntastic_check_on_wq = 1 " don't check when writing
" let g:syntastic_cpp_include_dirs = ['include']
" let g:syntastic_cpp_checkers = ["clang-tidy", "clang-check", "gcc"]
" let g:syntastic_cpp_check_header = 1 " check hpp files too
" let g:syntastic_cpp_compiler = 'g++'
" let g:syntastic_error_symbol = "✗"
" let g:syntastic_warning_symbol = "⚡"
" let g:syntastic_cpp_compiler_options = g:brian_cpp_flags

""""""""""""""""""""
" PATHOGEN BEGIN
execute pathogen#infect()
syntax on
filetype plugin indent on

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

map <leader>n :lnext<CR>
map <leader>p :lprev<CR>

" insert a new line at the cursor
map <leader>bh i<CR><ESC>

" insert date as YYYY-MM-DD
nnoremap <leader>td "=strftime("%Y-%m-%d")<CR>p
nnoremap <F4> "=strftime("%Y-%m-%d")<CR>p
inoremap <F4> <C-R>=strftime("%Y-%m-%d")<CR>

" autocompile this file
map <leader>cc : !g++ -Wall -Wpedantic -std=c++1z % -o %< && ./%< <CR>
map <leader>cmc : !cd build && cmake .. && cd ..<CR>
map <leader>cmb : !cmake --build ./build <CR>
map <leader>cmi : !cmake --build ./build --target install <CR>

" Apply YCM FixIt
map <F8> :YcmCompleter FixIt<CR>

" vim-dispatch
map <F9> :Dispatch<CR>

" fugitive
map <leader>gp :Gpush<CR>
map <leader>gc :Gcommit -m ""<left>
" write first to avoid common mistake
map <leader>ga :w<CR>:Git ap<CR>
map <leader>gb :Git ch -b<space>
map <leader>gk :Git ch<space>
map <leader>gl :Git lg<CR>
map <leader>gs :Gstatus<CR>
map <leader>gr :Git reset<CR>

" config for vim-airline
let g:airline_section_x = ''
let g:airline_section_y = ''
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_skip_empty_sections = 1

" For NERDTree
map <C-n> :NERDTree<CR>

" MACOS ONLY
" copy/paste clipboard
map <leader>y :w !pbcopy<CR><CR>
map <leader>p :r !pbpaste<CR>

" auto-reload vimrc on write
augroup myvimrchooks
  au!
  autocmd bufwritepost .vimrc source ~/.vimrc
augroup END

" strip trailing whitespace on save
autocmd FileType yml,c,cpp,h,hpp,cc,hh,cxx,java,php autocmd BufWritePre <buffer> %s/\s\+$//e

""""""""""""""""""""""""""""""""""""""""
" selected templates & mappings from c-support by wolfgang mehner
"
" block completion (good cross-language)
inoremap  {<CR>    {<CR>}<Esc>O
vnoremap  {<CR>   S{<CR>}<Esc>Pk=iB
