call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('flazz/vim-colorschemes')
call dein#add('powerline/fonts')

colorscheme Tomorrow-Night
set guifont=Droid\ Sans\ Mono:h11

" formatting
set nowrap                " Do not wrap long lines
set autoindent            " Indent at the same level of the previous line
set shiftwidth=2          " Use indents of 2 spaces
set expandtab             " Tabs are spaces, not tabs
set tabstop=2             " How many spaces is each TAB press
set softtabstop=2         " How many spaces to add when hitting TAB in insert mode
set nojoinspaces          " Prevents inserting two spaces after punctuation on a join (J)
set splitright            " Puts new vsplit windows to the right of the current
set splitbelow            " Puts new split windows to the bottom of the current
