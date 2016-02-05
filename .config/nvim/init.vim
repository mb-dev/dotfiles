set clipboard=unnamed

"
" PLUGINS
"
"
call plug#begin('~/.config/nvim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
Plug 'fatih/vim-go'
call plug#end()

"
" HOTKEYS
"
map <C-n> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>
