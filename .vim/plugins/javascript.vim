NeoBundle 'pangloss/vim-javascript'
NeoBundle 'mxw/vim-jsx'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'digitaltoad/vim-pug'
NeoBundle 'leafgarland/typescript-vim'
NeoBundle 'elzr/vim-json'

let g:syntastic_typescript_checkers=["eslint"]
let g:syntastic_javascript_checkers = ['jsxhint']
let g:syntastic_javascript_jsxhint_exec = 'jsx-jshint-wrapper'
