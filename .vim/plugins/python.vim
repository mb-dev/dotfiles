NeoBundle 'vim-scripts/indentpython.vim'
NeoBundle 'nvie/vim-flake8'

let g:syntastic_python_flake8_args='--ignore=E501,E271,E272,E302'
let g:syntastic_python_python_exec='/usr/local/bin/python3.5'
let g:syntastic_python_flake8_exe='python3 -m flake8'
let python_highlight_all=1

