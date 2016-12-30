call dein#add('tpope/vim-sensible')

if &compatible
	set nocompatible
endif

filetype plugin indent on
set background=dark

" change leader key
let mapleader = ","


:au FocusLost * silent! wa          " Auto save when buffer is switched

set autowriteall                    " Automatically write a file when leaving a modified buffer
set noswapfile
set nobackup
set nowritebackup
set number
set hlsearch                        " Highlight search terms
set ignorecase                                  " Case insensitive search
set smartcase                                   " Case sensitive when uc present
set wildmenu                                    " Show list instead of just completing
set wildmode=list:longest,full                  " Command <Tab> completion, list matches, then longest common part, then all.
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.  " Highlight problematic whitespace

" ## Shortcuts

" Easier save
nmap <leader>w :w<CR>
" Reload configuration when pressing ,sv
nmap <silent> <leader>sv :so $MYVIMRC<CR>
" toggle search highlighting
nmap <silent> <leader>/ :nohlsearch<CR>
" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv


" When possible use + register for copy-paste
if has('clipboard')
  if has('unnamedplus')  " When possible use + register for copy-paste
    set clipboard=unnamed,unnamedplus
  else         " On mac and Windows, use * register for copy-paste
    set clipboard=unnamed
  endif
endif

set undodir=~/.vim/undo-dir
set undofile
set undolevels=1000     " Maximum number of changes that can be undone
set undoreload=10000    " Maximum number lines to save for undo on a buffer reload
