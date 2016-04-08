 " Note: Skip initialization for vim-tiny or vim-small.
 if !1 | finish | endif

 if &compatible
   set nocompatible               " Be iMproved
 endif

source ~/.vim/functions.vim
source ~/.vim/vimrc.bundles

" Vim UI {
  syntax on                                       " Syntax highlighting
  if has('gui_running')
    set background=dark
    colorscheme Tomorrow-Night                      " Load a colorscheme
  else
    colorscheme zenburn
  endif
  set guifont=Droid\ Sans\ Mono:h11               " Use Droid Sans Mono font

  set backspace=indent,eol,start                  " Backspace for dummies
  set linespace=0                                 " No extra spaces between rows
  set number                                      " Line numbers on
  set showmatch                                   " Show matching brackets/parenthesis
  set incsearch                                   " Find as you type search
  set hlsearch                                    " Highlight search terms
  set winminheight=0                              " Windows can be 0 line high
  set ignorecase                                  " Case insensitive search
  set smartcase                                   " Case sensitive when uc present
  set wildmenu                                    " Show list instead of just completing
  set wildmode=list:longest,full                  " Command <Tab> completion, list matches, then longest common part, then all.
  set whichwrap=b,s,h,l,<,>,[,]                   " Backspace and cursor keys wrap too
  set list
  set listchars=tab:›\ ,trail:•,extends:#,nbsp:.  " Highlight problematic whitespace

  filetype plugin indent on                       " Automatically detect file types.
  set mouse=a                                     " Automatically enable mouse usage
  set mousehide                                   " Hide the mouse cursor while typing
  set encoding=utf-8
  scriptencoding utf-8
  set shortmess+=filmnrxoOtT                      " Abbrev. of messages (avoids 'hit enter')
                                                  " Allow for cursor beyond last character
  set viewoptions=folds,options,cursor,unix,slash "
  set virtualedit=onemore     " Allow for cursor beyond last character
  set history=1000                    " Store a ton of history (default is 20)
  set spell                           " Spell checking on
  set hidden                          " Allow buffer switching without saving
  set iskeyword-=.                    " '.' is an end of word designator
  set iskeyword-=#                    " '#' is an end of word designator
  set iskeyword-=-                    " '-' is an end of word designator

  :au FocusLost * silent! wa          " Auto save when buffer is switched
  set autowriteall                    " Automatically write a file when leaving a modified buffer
  set noswapfile
  set nobackup
  set nowritebackup
  set undodir=~/.vim-undo

  " Always switch to the current file directory
  " autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif

  " When possible use + register for copy-paste
  if has('clipboard')
    if has('unnamedplus')  " When possible use + register for copy-paste
      set clipboard=unnamed,unnamedplus
    else         " On mac and Windows, use * register for copy-paste
      set clipboard=unnamed
    endif
  endif

  " Instead of reverting the cursor to the last position in the buffer, we
  " set it to the first line when editing a git commit message
  au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

  function! ResCur()
    if line("'\"") <= line("$")
      silent! normal! g`"
      return 1
    endif
  endfunction

  " Restore cursor to file position in previous editing session
  augroup resCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
  augroup END

  if has('persistent_undo')
    set undofile            " So is persistent undo ...
    set undolevels=1000     " Maximum number of changes that can be undone
    set undoreload=10000    " Maximum number lines to save for undo on a buffer reload
  endif

" }

 " Formatting {

  set nowrap                " Do not wrap long lines
  set autoindent            " Indent at the same level of the previous line
  set shiftwidth=2          " Use indents of 4 spaces
  set expandtab             " Tabs are spaces, not tabs
  set tabstop=2             " An indentation every four columns
  set softtabstop=2         " Let backspace delete indent
  set nojoinspaces          " Prevents inserting two spaces after punctuation on a join (J)
  set splitright            " Puts new vsplit windows to the right of the current
  set splitbelow            " Puts new split windows to the bottom of the current

" }

" Key (re)Mappings {

  " Change mapleader
  let mapleader = ','

  " Quickly edit/reload the vimrc file
  nmap <silent> <leader>ev :e $MYVIMRC<CR>
  nmap <silent> <leader>sv :so $MYVIMRC<CR>

  " Quicker save
  nmap <leader>w :w<CR>

  " Easier moving in tabs and windows
  map <C-J> <C-W>j<C-W>_
  map <C-K> <C-W>k<C-W>_
  map <C-L> <C-W>l<C-W>_
  map <C-H> <C-W>h<C-W>_

  " Wrapped lines goes down/up to next row, rather than next line in file.
  noremap j gj
  noremap k gk

  function! WrapRelativeMotion(key, ...)
      let vis_sel=""
      if a:0
          let vis_sel="gv"
      endif
      if &wrap
          execute "normal!" vis_sel . "g" . a:key
      else
          execute "normal!" vis_sel . a:key
      endif
  endfunction

  " Map g* keys in Normal, Operator-pending, and Visual+select
  noremap $ :call WrapRelativeMotion("$")<CR>
  noremap <End> :call WrapRelativeMotion("$")<CR>
  noremap 0 :call WrapRelativeMotion("0")<CR>
  noremap <Home> :call WrapRelativeMotion("0")<CR>
  noremap ^ :call WrapRelativeMotion("^")<CR>
  " Overwrite the operator pending $/<End> mappings from above
  " to force inclusive motion with :execute normal!
  onoremap $ v:call WrapRelativeMotion("$")<CR>
  onoremap <End> v:call WrapRelativeMotion("$")<C

  " Overwrite the Visual+select mode mappings from above
  " to ensure the correct vis_sel flag is passed to function
  vnoremap $ :<C-U>call WrapRelativeMotion("$", 1)<CR>
  vnoremap <End> :<C-U>call WrapRelativeMotion("$", 1)<CR>
  vnoremap 0 :<C-U>call WrapRelativeMotion("0", 1)<CR>
  vnoremap <Home> :<C-U>call WrapRelativeMotion("0", 1)<CR>
  vnoremap ^ :<C-U>call WrapRelativeMotion("^", 1)<CR>

  " toggle search highlighting
  nmap <silent> <leader>/ :nohlsearch<CR>

  " Shortcuts
  " Change Working Directory to that of the current file
  cmap cwd lcd %:p:h
  cmap cd. lcd %:p:h

  " Visual shifting (does not exit Visual mode)
  vnoremap < <gv
  vnoremap > >gv

  " For when you forget to sudo.. Really Write the file.
  cmap w!! w !sudo tee % >/dev/null

  " Some helpers to edit mode
  " http://vimcasts.org/e/14
  cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
  map <leader>ew :e %%
  map <leader>es :sp %%
  map <leader>ev :vsp %%
  map <leader>et :tabe %%

  " Easier horizontal scrolling
  map zl zL
  map zh zH

  " Easier formatting
  nnoremap <silent> <leader>q gwip

  " Easier moving lines up / down
  nnoremap <A-j> :m .+1<CR>==
  nnoremap <A-k> :m .-2<CR>==
" }
"
  if has("gui_macvim")
    let g:AutoPairsShortcutToggle     = 'π' " <m-p>
    let g:AutoPairsShortcutFastWrap   = '∑' " <m-w>
    let g:AutoPairsShortcutJump       = '∆' " <m-j>
    let g:AutoPairsShortcutBackInsert = '∫' " <m-b>
  endif

" }
