set nocompatible              " be iMproved, required

so ~/.vim/plugins.vim
" Put your non-Plugin stuff after this line

syntax enable

set t_Co=256
colorscheme atom-dark-256
colorscheme badwolf

set backspace=indent,eol,start

set background=dark
let mapleader=','

set tabstop=4 " number of visual spaces per TAB
set softtabstop=4 " number of spaces in tab when editing
set expandtab " tabs are spaces
set shiftwidth=4
filetype plugin indent on

set number "Activate line numbers
set linespace=2
set guifont=InputMono_Light:h16
set guioptions-=r
set guioptions-=L
set guioptions-=e
set wildmenu " visual autocomplete for command menu
set showmatch " highlight matching [{()}]

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" $/^ doesn't do anything
"nnoremap $ <nop>
"nnoremap ^ <nop>

nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" jk is escape
inoremap jk <esc>

"----- Search -----
set hlsearch
set incsearch
nmap <Leader><space> :nohlsearch<cr>

"----- Make Myself Learn Vim -----
"nnoremap <left> :echoe "Use h"<cr>
"nnoremap <right> :echoe "Use l"<cr>
"nnoremap <up> :echoe "Use k"<cr>
"nnoremap <down> :echoe "Use j"<cr>

" save session
nnoremap <leader>s :mksession<CR>

" toggle paste mode
nnoremap <leader>p :set paste!<cr>

" open ag.vim
nnoremap <leader>a :Ag<cr>

"-------------Plugins--------------"
""/
"/ CtrlP
""/
nmap <C-R> :CtrlPBufTag<cr>
nmap <D-F12> :CtrlPBufTag<cr>
nmap <C-E> :CtrlPMRUFiles<cr>
nmap <D-e> :CtrlPMRUFiles<cr>

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|vendor'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0

if system("which ag")    
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" NERDTree
let NERDTreeHijackNetrw=0
nmap <D-1> :NERDTreeToggle<cr>
nmap <Leader>1 :NERDTreeToggle<cr>

" Gundo
nnoremap <leader>u :GundoToggle<CR>

" Airline
let g:airline_theme = 'powerlineish'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" terryma/vim-multiple-cursors
" let g:multi_cursor_use_default_mapping=0
" let g:multi_cursor_next_key='<C-n>'
" let g:multi_cursor_prev_key='<C-p>'
" let g:multi_cursor_skip_key='<C-x>'
" let g:multi_cursor_quit_key='<Esc>'

"----- Split -----
set splitbelow
set splitright
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>


" Toggle relativenumber
nmap <leader>r :set relativenumber!<cr>


"----- Auto-Commands -----

"Edit vimrc file
nmap <Leader>ev :e $MYVIMRC<cr>
nmap <Leader>ep :e ~/.vim/plugins.vim<cr>
nmap <Leader>et :e ~/.vim/vim.txt<cr>

"Source vimrc on save
augroup autosourcing
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
    autocmd BufWritePost ~/.vim/plugins.vim source $MYVIMRC
augroup END

au FileType yaml setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2

"========== PHP ===========
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>i <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>i :call PhpInsertUse()<CR>


set laststatus=2
