" Setup dein  ---------------------------------------------------------------
if (!isdirectory(expand("$HOME/.vim/dein/repos/github.com/Shougo/dein.vim")))
    call system(expand("mkdir -p $HOME/.vim/dein/repos/github.com/Shougo/dein.vim"))
    call system(expand("git clone https://github.com/Shougo/dein.vim $HOME/.vim/dein/repos/github.com/Shougo/dein.vim"))
endif
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim/

call dein#begin(expand('~/.vim/dein')) " plugins' root path

  call dein#add('Shougo/dein.vim')
  call dein#add('Shougo/neomru.vim')

  for f in split(glob('~/.vim/plugins/*.vim'), '\n')
	  execute 'source' f
  endfor

call dein#end()

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
