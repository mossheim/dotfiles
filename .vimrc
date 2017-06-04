colorscheme wombat256mod
set exrc " Force to source .vimrc if present in cwd
set secure " Adds security for non-main .vimrc
set colorcolumn=100 " Highlight 90th column
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" C++ indentation rules
set cinoptions+=L0:0g0


" For YCM
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"

" For C++ highlighting
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1

" Doxygen highlighting
let g:load_doxygen_syntax=1

execute pathogen#infect()
syntax on
filetype plugin indent on

" Disable directional keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Apply YCM FixIt
map <F8> :YcmCompleter FixIt<CR>

" For NERDTree
map <C-n> :NERDTree<CR>
" autocmd vimenter * NERDTree
