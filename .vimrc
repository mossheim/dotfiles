" main .vimrc
" Brian Heim, Author
" 2017

" Basic config settings
colorscheme wombat256mod
set exrc " Force to source .vimrc if present in cwd
set secure " Adds security for non-main .vimrc
set colorcolumn=100 " Highlight 90th column
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" To avoid redraws while executing marcos etc. The reason I enabled this is to stop commands
" from disappearing in ex mode
set lazyredraw

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
" 
" let g:syntastic_always_populate_loc_list = 1 " always populate the list of errors
" let g:syntastic_auto_loc_list = 1 " autopop the list
" let g:syntastic_check_on_open = 1 " check when opening
" let g:syntastic_check_on_wq = 1 " don't check when writing
" let g:syntastic_cpp_include_dirs = ['include']
" let g:syntastic_cpp_checkers = ["clang-tidy", "clang-check", "gcc"]
" let g:syntastic_cpp_check_header = 1 " check hpp files too
" 
" let g:syntastic_cpp_compiler = 'g++'
" 
" let g:syntastic_error_symbol = "✗"
" let g:syntastic_warning_symbol = "⚡"
" 
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

" autocompile this file
map <leader>cc : !g++ -Wall -Wpedantic -std=c++1z % -o %< && ./%< <CR>
map <leader>cmc : !cmake ./build <CR>
map <leader>cmb : !cmake --build ./build <CR>
map <leader>cmi : !cmake --build ./build --target install <CR>

" Apply YCM FixIt
map <F8> :YcmCompleter FixIt<CR>

" For NERDTree
map <C-n> :NERDTree<CR>
" autocmd vimenter * NERDTree

" auto-reload vimrc on write
augroup myvimrchooks
  au!
  autocmd bufwritepost .vimrc source ~/.vimrc
augroup END

" strip trailing whitespace on save
autocmd FileType yml,c,cpp,h,hpp,cc,hh,cxx,java,php autocmd BufWritePre <buffer> %s/\s\+$//e
