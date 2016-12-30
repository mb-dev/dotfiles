if has('nvim')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('zchee/deoplete-go', {'on_ft': 'go', 'build': 'make'})
  set completeopt+=noinsert
  set completeopt+=noselect
  let g:deoplete#enable_at_startup = 1
  let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
  let g:deoplete#sources#go#use_cache = 1
  let g:deoplete#sources#go#json_directory = '/tmp'
  let g:deoplete#sources#jedi#enable_cache = 1
endif
