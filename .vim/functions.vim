" Identify platform {
  silent function! OSX()
    return has('macunix')
  endfunction
  silent function! LINUX()
    return has('unix') && !has('macunix') && !has('win32unix')
  endfunction
  silent function! WINDOWS()
    return  (has('win32') || has('win64'))
  endfunction
" }
"
