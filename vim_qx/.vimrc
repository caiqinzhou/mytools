
source ~/.vim/filetypes.vim

" --------------------
" display options
" --------------------
set encoding=gb2312

" set syntax
syntax enable
syntax on
" colorscheme delek
"
"colorscheme mycolor
colorscheme lucius
"colorscheme darkburn
set t_Co=256
" display line number
set nu

" set backup dir
" set backup
" set backupext=.bak
" set backupdir=~/.backup/

" 突出显示当前行
"set cursorline

" tag list
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<cr>
filetype plugin indent on
set completeopt=longest,menu

" display row & col of current position
set ruler

" tabstop and indent
set tabstop=4
set shiftwidth=4
set autoindent
set nowrap 
set wrap 
" set expandtab

"python_fold
set foldmethod=indent
"ctags
nnoremap ~ :TlistToggle<CR>

" move between lines
set whichwrap=b,s,h,l,<,>,[,]

" chinese
set enc=prc

" --------------------
" actions
" --------------------

" windows
nnoremap ` <C-W>w
nnoremap <C-H> <C-W><
nnoremap <S-H> <C-W>5<
nnoremap <S-L> <C-W>5>
nnoremap <C-L> <C-W>>
nnoremap <C-J> <C-W>+
nnoremap <C-K> <C-W>-

" tabs
nnoremap <F8> :tabe %<CR>
"nnoremap 1 :tabp<CR>
"nnoremap 2 :tabn<CR>
nnoremap <Space> :tabn<CR>
"nnoremap <S-Space> :tabp<CR>

" format file
map <C-\> ggVG= <C-O><C-O>

" search
set incsearch

:set wildignore=*.o,*.obj
:set wildmenu
:set wildmode=list:full
:set path=.

":set tags=./tags,./../tags,./**/tags,./../../tags
:set tags=./tags,./../tags
" --------------------
" GUI options
" --------------------

" set guioptions=mrL

" font
" set guifont=Courier_New:h11:cANSI
" set guifont=ProggyCleanTT\ 11

" max window when started
" au GUIEnter * simalt ~x

" set wmh=0

let &termencoding=&encoding
" set fileencodings=utf-8,gbk,euc-cn
set fileencodings=cp936,utf-8,gbk,euc-cn
