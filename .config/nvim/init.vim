set clipboard=unnamed

"
" PLUGINS
"
call plug#begin('~/.config/nvim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
Plug 'fatih/vim-go'

Plug 'chriskempson/vim-tomorrow-theme'
call plug#end()

"
" APPERANCE
"
color Tomorrow-Night                            " Load a colorscheme
set guifont=Droid\ Sans\ Mono:h11               " Use Droid Sans Mono font


"
" OTHER SETTINGS
"
:let g:netrw_dirhistmax = 0

"
" HOTKEYS
"
map <C-n> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>
