if filereadable(expand("~/.vim/bundle/YouCompleteMe/autoload"))
  let g:acp_enableAtStartup = 0

  " enable completion from tags
  let g:ycm_collect_identifiers_from_tags_files = 1

  " remap Ultisnips for compatibility for YCM
  let g:UltiSnipsExpandTrigger = '<C-j>'
  let g:UltiSnipsJumpForwardTrigger = '<C-j>'
  let g:UltiSnipsJumpBackwardTrigger = '<C-k>'
  let g:UltiSnipsListSnippets="<C-u>"

  " Enable omni completion.
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
  autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

  " Haskell post write lint and check with ghcmod
  " $ `cabal install ghcmod` if missing and ensure
  " ~/.cabal/bin is in your $PATH.
  if !executable("ghcmod")
    autocmd BufWritePost *.hs GhcModCheckAndLintAsync
  endif

  " For snippet_complete marker.
  if !exists("g:spf13_no_conceal")
    if has('conceal')
      set conceallevel=2 concealcursor=i
    endif
  endif

  " Disable the neosnippet preview candidate window
  " When enabled, there can be too much visual noise
  " especially when splits are used.
  set completeopt-=preview
endif
